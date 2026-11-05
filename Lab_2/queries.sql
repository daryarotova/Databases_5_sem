-- Часть 2. Получение операционной информации
-- 2.1. Многотабличные запросы
-- 1. Объединяет 7 таблиц: кто у кого сдал, из какой группы
SELECT 
    s.surname AS student_surname,
    s.first_name AS student_name,
    sg.name AS group_name,
    c.name AS course_name,
    t.surname AS teacher_surname,
    r.grade,
    r.exam_date
FROM student s
JOIN student_group sg ON s.group_id = sg.student_group_id
JOIN grade_book gb ON s.student_id = gb.student_id
JOIN grade_book_record r ON gb.grade_book_id = r.grade_book_id
JOIN course_offering co ON r.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
JOIN teacher t ON co.teacher_id = t.teacher_id
WHERE r.grade IS NOT NULL
ORDER BY student_surname, course_name;

-- 2. Поиск преподавателей, которые не ведут ни у каких групп
SELECT 
    t.surname AS teacher_surname,
    t.first_name AS teacher_name,
    t.position,
    d.name AS department_name
FROM teacher t
JOIN department d ON t.department_id = d.department_id
LEFT JOIN course_offering co ON t.teacher_id = co.teacher_id
WHERE co.course_offering_id IS NULL
ORDER BY teacher_surname;

-- 3. Поиск отличников из группы А-22-1
SELECT 
    s.surname AS student_surname,
    s.first_name AS student_name,
    sg.name AS group_name,
    c.name AS course_name,
    r.grade
FROM student s
JOIN student_group sg ON s.group_id = sg.student_group_id
JOIN grade_book gb ON s.student_id = gb.student_id
JOIN grade_book_record r ON gb.grade_book_id = r.grade_book_id
JOIN course_offering co ON r.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
WHERE sg.name = 'А-22-1'
AND r.grade = 5
ORDER BY student_surname;

-- 2.2. Агрегация и группировка
-- 1. Сбор инф-ии о студентах, сданных экзаменах и баллах по группе
SELECT 
    sg.name AS group_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(r.grade_book_record_id) AS total_exams_passed,
    ROUND(AVG(r.grade), 2) AS avg_group_grade,
    MIN(r.grade) AS min_grade_in_group,
    MAX(r.grade) AS max_grade_in_group
FROM student_group sg
LEFT JOIN student s ON sg.student_group_id = s.group_id
LEFT JOIN grade_book gb ON s.student_id = gb.student_id
LEFT JOIN grade_book_record r ON gb.grade_book_id = r.grade_book_id
GROUP BY sg.name
ORDER BY group_name;

-- 2. Показатели дисциплин, у которых средний балл выше 3.6
SELECT 
    c.name AS course_name,
    COUNT(r.grade_book_record_id) AS total_grades,
    ROUND(AVG(r.grade), 2) AS average_grade,
    MIN(r.grade) AS min_grade,
    MAX(r.grade) AS max_grade
FROM course c
JOIN course_offering co ON c.course_id = co.course_id
JOIN grade_book_record r ON co.course_offering_id = r.course_offering_id
WHERE r.grade IS NOT NULL
GROUP BY c.name
HAVING AVG(r.grade) > 3.6
ORDER BY average_grade DESC;

-- 3. Аналитика по зарплатам преподавателей
SELECT 
    position AS teacher_position,
    COUNT(teacher_id) AS teachers_count,
    SUM(salary) AS total_salary_fund,
    ROUND(AVG(salary), 2) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM teacher
GROUP BY position
ORDER BY total_salary_fund DESC;

-- Часть 3. Подзапросы и поиск нетривиальных ситуаций
-- 3.1. Сравнение с вычисляемым показателем
-- Студенты со средним баллом выше среднего по унив-ту
SELECT 
    s.surname AS student_surname, 
    s.first_name AS student_name, 
    ROUND(AVG(r.grade), 2) AS student_avg_grade
FROM student s
JOIN grade_book gb ON s.student_id = gb.student_id
JOIN grade_book_record r ON gb.grade_book_id = r.grade_book_id
GROUP BY s.student_id, s.surname, s.first_name
HAVING AVG(r.grade) > (
    SELECT AVG(grade)
    FROM grade_book_record
    WHERE grade IS NOT NULL
)
ORDER BY student_avg_grade DESC, student_surname;

-- 3.2. Проверка существования связанных данных
-- Преподаватели, у которых есть студенты-отличники
SELECT 
    t.surname AS teacher_surname,
    t.first_name AS teacher_name
FROM teacher t
WHERE EXISTS (
    SELECT 1
    FROM course_offering co
    JOIN grade_book_record r ON co.course_offering_id = r.course_offering_id
    WHERE co.teacher_id = t.teacher_id 
    AND r.grade = 5
);

-- 3.3. Поиск отсутствующих событий
-- Студенты-двоечники или неуспевающие
SELECT 
    s.surname AS student_surname,
    s.first_name AS student_name
FROM student s
WHERE NOT EXISTS (
    SELECT 1
    FROM grade_book gb
    JOIN grade_book_record r ON gb.grade_book_id = r.grade_book_id
    WHERE s.student_id = gb.student_id
    AND r.grade IN (3, 4, 5)
)
ORDER BY student_surname;

-- 3.4 Коррелированный подзапрос
-- Личная успеваемость каждого студента
SELECT 
    s.surname AS student_surname,
    s.first_name AS student_name,
    (SELECT COUNT(*)
    FROM grade_book gb
    JOIN grade_book_record r ON gb.grade_book_id = r.grade_book_id
    WHERE gb.student_id = s.student_id
    AND r.grade IS NOT NULL
    ) AS passed_exams,
    (SELECT ROUND(AVG(r.grade), 2) 
    FROM grade_book gb
    JOIN grade_book_record r ON gb.grade_book_id = r.grade_book_id
    WHERE gb.student_id = s.student_id
    AND r.grade IS NOT NULL
    ) AS avg_grade
FROM student s
ORDER BY passed_exams DESC, student_surname;
-- Часть 4. Комплексный аналитический отчёт с использованием CTE
-- Инф-я о каждом преподавателе: нагрузка, средний балл его студентов, кол-во "5" и "2"
WITH 
teacher_work_load AS (
    SELECT 
        t.teacher_id,
        t.surname AS surname,
        t.first_name AS name,
        t.position AS position,
        COALESCE(SUM(c.credits), 0) AS total_credits,
        COUNT(DISTINCT co.group_id) AS groups_count
    FROM teacher t
    LEFT JOIN course_offering co ON co.teacher_id = t.teacher_id
    LEFT JOIN course c ON co.course_id = c.course_id
    GROUP BY t.teacher_id, t.surname, t.first_name, t.position
),
teacher_grades AS (
    SELECT
        co.teacher_id,
        ROUND(AVG(r.grade), 2) AS avg_grade,
        SUM(CASE WHEN r.grade = 5 THEN 1 ELSE 0 END) AS fives_count,
        SUM(CASE WHEN r.grade = 2 THEN 1 ELSE 0 END) AS twos_count
    FROM course_offering co
    JOIN grade_book_record r ON co.course_offering_id = r.course_offering_id
    WHERE r.grade IS NOT NULL
    GROUP BY co.teacher_id
)

SELECT 
    twl.surname,
    twl.name,
    twl.position,
    twl.total_credits,
    twl.groups_count,
    COALESCE(tg.avg_grade, 0.00) AS avg_grade,
    COALESCE(tg.fives_count, 0) AS fives_count,
    COALESCE(tg.twos_count, 0) AS twos_count
FROM teacher_work_load twl 
LEFT JOIN teacher_grades tg ON twl.teacher_id = tg.teacher_id
ORDER BY twl.total_credits DESC, tg.avg_grade DESC;
-- Часть 1.2. Операции изменения данных
BEGIN;

SELECT COUNT(*) AS students_before 
FROM student;

INSERT INTO student (surname, first_name, patronymic, email, phone, group_id, status, birth_date) 
VALUES ('Петров', 'Иван', 'Сергеевич', 'petrov_ivan@edu.ru', '89001234567', 1, 'active', '2004-01-01');

INSERT INTO grade_book (student_id, number, issue_date) 
SELECT student_id, '24-0020', '2024-09-01' 
FROM student 
WHERE email = 'petrov_ivan@edu.ru';

INSERT INTO grade_book_record (grade_book_id, course_offering_id, grade, exam_date, attendance) 
SELECT gb.grade_book_id, 11, 5, '2025-01-25', 98 
FROM grade_book gb
JOIN student s ON s.student_id = gb.student_id
WHERE s.email = 'petrov_ivan@edu.ru';

SELECT s.surname, s.first_name, g.number, r.grade, r.attendance
FROM student s
JOIN grade_book g ON s.student_id = g.student_id
JOIN grade_book_record r ON g.grade_book_id = r.grade_book_id
WHERE s.email = 'petrov_ivan@edu.ru';

UPDATE student 
SET status = 'academic_leave' 
WHERE student_id = 8;

UPDATE teacher 
SET salary = salary * 1.07
WHERE position IN ('professor', 'associate_professor');

DELETE FROM grade_book_record 
WHERE grade_book_id = (
    SELECT grade_book_id 
    FROM grade_book 
    WHERE number = '24-0020'
);

SELECT COUNT(*) AS students_during_transaction 
FROM student;

ROLLBACK;

SELECT COUNT(*) AS students_after_rollback 
FROM student;
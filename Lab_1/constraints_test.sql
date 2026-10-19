INSERT INTO student (surname, first_name, email, phone, group_id, status, birth_date) 
VALUES ('Тестов', 'Тест', 'alexandrova@edu.ru', '89990000001', 1, 'active', '2000-01-01');

INSERT INTO grade_book_record (grade_book_id, course_offering_id, grade, exam_date, attendance) 
VALUES (1, 2, 5, '2025-01-15', 90);

INSERT INTO student (surname, first_name, email, phone, group_id, status, birth_date) 
VALUES ('Тестов', 'Тест', 'test1@edu.ru', '89990000001', 99, 'active', '2000-01-01');

INSERT INTO course (code, name, credits, department_id) 
VALUES ('TEST-01', 'Тестовый курс', 3, 99);

INSERT INTO student (surname, first_name, email, phone, group_id, status, birth_date) 
VALUES (NULL, 'Тест', 'test2@edu.ru', '89990000002', 1, 'active', '2000-01-01');

INSERT INTO student (surname, first_name, email, phone, group_id, status, birth_date) 
VALUES ('Тестов', 'Тест', 'test3@edu.ru', '99990000003', 1, 'active', '2000-01-01');

INSERT INTO student (surname, first_name, email, phone, group_id, status, birth_date) 
VALUES ('Тестов', 'Тест', 'test4@edu.ru', '89990000004', 1, 'sleeping', '2000-01-01');

INSERT INTO grade_book_record (grade_book_id, course_offering_id, grade, exam_date, attendance) 
VALUES (1, 3, 6, '2025-01-15', 90);

INSERT INTO grade_book_record (grade_book_id, course_offering_id, grade, exam_date, attendance) 
VALUES (1, 3, 4, '2025-01-15', 150);

INSERT INTO course_offering (course_id, teacher_id, group_id, year_start, year_end, semester) 
VALUES (1, 1, 1, 2024, 2025, 3);

INSERT INTO course_offering (course_id, teacher_id, group_id, year_start, year_end, semester) 
VALUES (1, 1, 2, 2024, 2026, 1);

UPDATE teacher SET salary = -500000.00 WHERE teacher_id = 1;
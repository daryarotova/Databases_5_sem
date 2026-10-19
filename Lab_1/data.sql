INSERT INTO faculty (faculty_id, name) OVERRIDING SYSTEM VALUE VALUES
(1, 'Экономический'),
(2, 'Иностранные языки'),
(3, 'Филологический'),
(4, 'Физико-математический');

INSERT INTO department (department_id, name, faculty_id) OVERRIDING SYSTEM VALUE VALUES
(1, 'Экономика и управление', 1),
(2, 'Иностранные языки', 2),
(3, 'Филология', 3),
(4, 'Высшая математика', 4),
(5, 'Информационные технологии', 4);

INSERT INTO specialty (specialty_id, code, name, faculty_id) OVERRIDING SYSTEM VALUE VALUES
(1, '38.03.01', 'Экономика', 1),
(2, '45.03.02', 'Лингвистика', 2),
(3, '45.03.01', 'Филология', 3),
(4, '03.05.03', 'Астрономия', 4),
(5, '01.03.02', 'Прикладные математика и информатика', 4);

INSERT INTO student_group (student_group_id, name, specialty_id, admission_year) OVERRIDING SYSTEM VALUE VALUES
(1, 'Э-21-1', 1, 2021),
(2, 'Л-22-1', 2, 2022),
(3, 'Ф-22-1', 3, 2022),
(4, 'А-22-1', 4, 2022),
(5, 'ПМИ-22-1', 5, 2022);

INSERT INTO student (student_id, surname, first_name, patronymic, email, phone, group_id, status, birth_date) OVERRIDING SYSTEM VALUE VALUES
(1, 'Александрова', 'Ульяна', 'Глебовна', 'alexandrova@edu.ru', '89991123891', 1, 'active', '2003-04-12'),
(2, 'Казаков', 'Ярослав', 'Львович', 'kazakov@edu.ru', '89871110243', 1, 'graduated', '2003-01-20'),
(3, 'Крылов', 'Никита', 'Олегович', 'krylov@edu.ru', '89701230805', 1, 'expelled', '2003-12-15'),
(4, 'Фомин', 'Илья', NULL, 'fomin@edu.ru', '89883560466', 1, 'active', '2003-08-05'),
(5, 'Данилова', 'Ольга', 'Михайловна', 'danilova@edu.ru', '89190023047', 2, 'active', '2005-06-30'),
(6, 'Ермолаев', 'Мирон', NULL, 'ermolaev@edu.ru', '89143156629', 4, 'academic_leave', '2004-05-07'),
(7, 'Сафонов', 'Даниил', 'Викторович', 'safonov@edu.ru', '89054067825', 5, 'active', '2004-10-26');

INSERT INTO teacher (teacher_id, surname, first_name, patronymic, email, department_id, position, salary) OVERRIDING SYSTEM VALUE VALUES
(1, 'Петров', 'Роман', 'Викторович', 'petrov@edu.ru', 4, 'professor', 205100.00),
(2, 'Фролов', 'Артём', 'Петрович', 'frolov@edu.ru', 1, 'associate_professor', 178000.00),
(3, 'Цветкова', 'Анастасия', 'Максимовна', 'tsvetkova@edu.ru', 2, 'senior_lecturer', 107000.00),
(4, 'Кузьмина', 'Агата', 'Михайловна', 'kuzmina@edu.ru', 5, 'associate_professor', 160500.00);

INSERT INTO course (course_id, code, name, credits, department_id) OVERRIDING SYSTEM VALUE VALUES
(1, 'BD-101', 'Базы данных', 4, 5),
(2, 'MATH-101', 'Высшая математика', 6, 4),
(3, 'HIST-R-101', 'История России', 3, 1),
(4, 'LANG-101', 'Иностранный язык', 5, 2),
(5, 'ASTRO-101', 'Введение в астрономию', 4, 4);

INSERT INTO course_offering (course_offering_id, course_id, teacher_id, group_id, year_start, year_end, semester) OVERRIDING SYSTEM VALUE VALUES
(1, 1, 4, 5, 2024, 2025, 1),
(2, 2, 1, 1, 2024, 2025, 1),
(3, 2, 1, 5, 2024, 2025, 1),
(4, 3, 2, 1, 2024, 2025, 1),
(5, 3, 2, 2, 2024, 2025, 1),
(6, 4, 3, 2, 2024, 2025, 1),
(7, 5, 1, 4, 2024, 2025, 1),
(8, 3, 2, 4, 2024, 2025, 2);

INSERT INTO grade_book (grade_book_id, student_id, number, issue_date) OVERRIDING SYSTEM VALUE VALUES
(1, 1, '21-0001', '2021-09-01'),
(2, 2, '21-0002', '2021-09-01'),
(3, 3, '21-0003', '2021-09-01'),
(4, 4, '21-0004', '2021-09-01'),
(5, 5, '22-0005', '2022-09-01'),
(6, 6, '22-0006', '2022-09-01'),
(7, 7, '22-0007', '2022-09-01');

INSERT INTO grade_book_record (grade_book_record_id, grade_book_id, course_offering_id, grade, exam_date, attendance) OVERRIDING SYSTEM VALUE VALUES
(1, 1, 2, 5, '2025-01-15', 95),
(2, 1, 4, 4, '2025-01-20', 90),
(3, 2, 2, 4, '2025-01-15', 85),
(4, 2, 4, 5, '2025-01-20', 90),
(5, 3, 2, 2, '2025-01-15', 15),
(6, 3, 4, 2, '2025-01-20', 20),
(7, 4, 2, 3, '2025-01-15', 70),
(8, 4, 4, NULL, NULL, 60),
(9, 5, 5, 4, '2025-01-18', 80),
(10, 5, 6, 5, '2025-01-21', 100),
(11, 6, 7, NULL, NULL, 50),
(12, 6, 8, 3, '2025-01-22', 40),
(13, 7, 1, 5, '2025-01-16', 100),
(14, 7, 3, 4, '2025-01-17', 85);

SELECT setval(pg_get_serial_sequence('faculty', 'faculty_id'), (SELECT MAX(faculty_id) FROM faculty));
SELECT setval(pg_get_serial_sequence('department', 'department_id'), (SELECT MAX(department_id) FROM department));
SELECT setval(pg_get_serial_sequence('specialty', 'specialty_id'), (SELECT MAX(specialty_id) FROM specialty));
SELECT setval(pg_get_serial_sequence('student_group', 'student_group_id'), (SELECT MAX(student_group_id) FROM student_group));
SELECT setval(pg_get_serial_sequence('student', 'student_id'), (SELECT MAX(student_id) FROM student));
SELECT setval(pg_get_serial_sequence('teacher', 'teacher_id'), (SELECT MAX(teacher_id) FROM teacher));
SELECT setval(pg_get_serial_sequence('course', 'course_id'), (SELECT MAX(course_id) FROM course));
SELECT setval(pg_get_serial_sequence('course_offering', 'course_offering_id'), (SELECT MAX(course_offering_id) FROM course_offering));
SELECT setval(pg_get_serial_sequence('grade_book', 'grade_book_id'), (SELECT MAX(grade_book_id) FROM grade_book));
SELECT setval(pg_get_serial_sequence('grade_book_record', 'grade_book_record_id'), (SELECT MAX(grade_book_record_id) FROM grade_book_record));
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

INSERT INTO student (student_id, surname, first_name, patronymic, email, phone, group_id, status, birth_date) OVERRIDING SYSTEM VALUE VALUES
(8, 'Смирнов', 'Алексей', 'Дмитриевич', 'smirnov_a@edu.ru', '89001112233', 3, 'active', '2003-08-05'),
(9, 'Кузнецова', 'Елена', 'Александровна', 'kuznetsova@edu.ru', '89002223344', 4, 'graduated', '2003-06-12'),
(10, 'Попов', 'Дмитрий', 'Сергеевич', 'popov@edu.ru', '89003334455', 5, 'active', '2003-07-02'),
(11, 'Васильева', 'Анна', 'Игоревна', 'vasileva@edu.ru', '89004445566', 2, 'expelled', '2003-08-08'),
(12, 'Никитин', 'Максим', NULL, 'nikitin@edu.ru', '89005556677', 1, 'active', '2003-10-09'),
(13, 'Петрова', 'Мария', 'Алексеевна', 'petrova_m@edu.ru', '89006667788', 3, 'active', '2004-02-10'),
(14, 'Сидоров', 'Иван', 'Петрович', 'sidorov@edu.ru', '89007778899', 5, 'active', '2004-03-19');

INSERT INTO teacher (teacher_id, surname, first_name, patronymic, email, department_id, position, salary) OVERRIDING SYSTEM VALUE VALUES
(5, 'Соколов', 'Игорь', 'Владимирович', 'sokolov@edu.ru', 3, 'lecturer', 98000.00),
(6, 'Михайлова', 'Светлана', 'Петровна', 'mikhailova@edu.ru', 1, 'assistant', 65000.00),
(7, 'Иванов', 'Петр', 'Сергеевич', 'ivanov_p@edu.ru', 4, 'senior_lecturer', 106000.00); 

INSERT INTO course (course_id, code, name, credits, department_id) OVERRIDING SYSTEM VALUE VALUES
(6, 'PHYS-101', 'Физика', 4, 4),
(7, 'PHIL-101', 'Философия', 3, 3),
(8, 'ECON-101', 'Экономическая теория', 5, 1);

INSERT INTO course_offering (course_offering_id, course_id, teacher_id, group_id, year_start, year_end, semester) OVERRIDING SYSTEM VALUE VALUES
(9, 6, 5, 4, 2024, 2025, 1),
(10, 7, 3, 2, 2024, 2025, 1), 
(11, 8, 2, 1, 2024, 2025, 1), 
(12, 1, 4, 3, 2024, 2025, 2), 
(13, 3, 2, 5, 2024, 2025, 2), 
(14, 4, 3, 1, 2024, 2025, 2), 
(15, 5, 1, 2, 2024, 2025, 2),
(16, 8, 2, 2, 2024, 2025, 2),
(17, 6, 5, 3, 2024, 2025, 2),
(18, 7, 3, 5, 2024, 2025, 2),
(19, 1, 4, 4, 2024, 2025, 1);

INSERT INTO grade_book (grade_book_id, student_id, number, issue_date) OVERRIDING SYSTEM VALUE VALUES
(8, 8, '22-0008', '2022-09-01'),
(9, 9, '22-0009', '2022-09-01'),
(10, 10, '22-0010', '2022-09-01'),
(11, 11, '22-0011', '2022-09-01'),
(12, 12, '21-0012', '2021-09-01'),
(13, 13, '22-0013', '2022-09-01'),
(14, 14, '22-0014', '2022-09-01');

INSERT INTO grade_book_record (grade_book_record_id, grade_book_id, course_offering_id, grade, exam_date, attendance) OVERRIDING SYSTEM VALUE VALUES
(15, 1, 11, 5, '2024-11-15', 90),
(16, 1, 14, 4, '2024-11-20', 85),
(17, 2, 11, 4, '2024-11-16', 80),
(18, 2, 14, 5, '2024-11-21', 95),
(19, 3, 11, 2, '2024-11-17', 15),
(20, 3, 14, NULL, NULL, 0),
(21, 4, 11, 3, '2024-11-18', 60),
(22, 4, 14, 4, '2024-11-23', 80),
(23, 5, 10, 5, '2024-12-10', 100),
(24, 5, 15, 4, '2024-12-15', 90),
(25, 11, 5, 3, '2024-12-11', 60),
(26, 11, 6, 2, '2024-12-12', 10),
(27, 11, 10, NULL, NULL, 0),
(28, 11, 15, 4, '2024-12-16', 85),
(29, 11, 16, 5, '2024-12-17', 95),
(30, 5, 16, 3, '2024-12-18', 70),
(31, 6, 9, 4, '2025-01-10', 75),
(32, 6, 12, 5, '2025-01-11', 95),
(33, 9, 8, 3, '2025-01-12', 65),
(34, 9, 9, 4, '2025-01-13', 80),
(35, 9, 12, 2, '2025-01-14', 5),
(36, 9, 7, 4, '2025-01-15', 85),
(37, 9, 19, 5, '2025-01-16', 90),
(38, 6, 19, 4, '2025-01-17', 88),
(39, 7, 13, 5, '2025-02-10', 100),
(40, 10, 1, 4, '2025-02-11', 85),
(41, 10, 3, 3, '2025-02-12', 70),
(42, 10, 13, 5, '2025-02-13', 95),
(43, 7, 18, 4, '2025-02-14', 80),
(44, 8, 17, 5, '2025-02-15', 90),
(45, 8, 12, 3, '2025-02-16', 50);

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
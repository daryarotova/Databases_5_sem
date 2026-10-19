DROP TABLE IF EXISTS grade_book_record CASCADE;
DROP TABLE IF EXISTS grade_book CASCADE;
DROP TABLE IF EXISTS course_offering CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS teacher CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS student_group CASCADE;
DROP TABLE IF EXISTS specialty CASCADE;
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS faculty CASCADE;

CREATE TABLE faculty (
    faculty_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE CHECK (length(trim(name)) > 0)
);

CREATE TABLE department (
    department_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK (length(trim(name)) > 0),
    faculty_id BIGINT NOT NULL REFERENCES faculty(faculty_id) ON DELETE RESTRICT,
    UNIQUE (faculty_id, name)
);

CREATE TABLE specialty (
    specialty_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(10) NOT NULL UNIQUE CHECK (code ~ '^\d{2}\.\d{2}\.\d{2}$'),
    name VARCHAR(100) NOT NULL CHECK (length(trim(name)) > 0),
    faculty_id BIGINT NOT NULL REFERENCES faculty(faculty_id) ON DELETE RESTRICT,
    UNIQUE (faculty_id, name)
);

CREATE TABLE student_group (
    student_group_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20) NOT NULL CHECK (length(trim(name)) > 0),
    specialty_id BIGINT NOT NULL REFERENCES specialty(specialty_id) ON DELETE RESTRICT,
    admission_year INT NOT NULL CHECK (admission_year >= 2000),
    UNIQUE (specialty_id, name)
);

CREATE TABLE student (
    student_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    surname VARCHAR(100) NOT NULL CHECK (length(trim(surname)) > 0),
    first_name VARCHAR(100) NOT NULL CHECK (length(trim(first_name)) > 0),
    patronymic VARCHAR(100),
    email VARCHAR(150) NOT NULL UNIQUE CHECK (email ~ '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
    phone VARCHAR(11) NOT NULL UNIQUE CHECK (phone ~ '^8[0-9]{10}$'),
    group_id BIGINT NOT NULL REFERENCES student_group(student_group_id) ON DELETE RESTRICT,
    status VARCHAR(20) NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'academic_leave', 'expelled', 'graduated')),
    birth_date DATE NOT NULL CHECK (birth_date > DATE '1900-01-01' AND birth_date < DATE '2100-01-01')
);

CREATE TABLE teacher (
    teacher_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    surname VARCHAR(100) NOT NULL CHECK (length(trim(surname)) > 0),
    first_name VARCHAR(100) NOT NULL CHECK (length(trim(first_name)) > 0),
    patronymic VARCHAR(100),
    email VARCHAR(150) NOT NULL UNIQUE CHECK (email ~ '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
    department_id BIGINT NOT NULL REFERENCES department(department_id) ON DELETE RESTRICT,
    position VARCHAR(30) NOT NULL CHECK (position IN ('assistant', 'lecturer', 'senior_lecturer', 'associate_professor', 'professor', 'head')),
    salary NUMERIC(10,2) NOT NULL CHECK (salary > 0)
);

CREATE TABLE course (
    course_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(15) NOT NULL UNIQUE CHECK (length(trim(code)) > 0),
    name VARCHAR(150) NOT NULL CHECK (length(trim(name)) > 0),
    credits INT NOT NULL CHECK (credits > 0 AND credits <= 30),
    department_id BIGINT NOT NULL REFERENCES department(department_id) ON DELETE RESTRICT,
    UNIQUE (department_id, name)
);

CREATE TABLE course_offering (
    course_offering_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id BIGINT NOT NULL REFERENCES course(course_id) ON DELETE RESTRICT,
    teacher_id BIGINT NOT NULL REFERENCES teacher(teacher_id) ON DELETE RESTRICT,
    group_id BIGINT NOT NULL REFERENCES student_group(student_group_id) ON DELETE RESTRICT,
    year_start INT NOT NULL CHECK (year_start >= 2000),
    year_end INT NOT NULL,
    semester INT NOT NULL CHECK (semester IN (1, 2)),
    UNIQUE (course_id, group_id, year_start, year_end, semester),
    CHECK (year_end = year_start + 1)
);

CREATE TABLE grade_book (
    grade_book_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id BIGINT NOT NULL UNIQUE REFERENCES student(student_id) ON DELETE CASCADE,
    number VARCHAR(20) NOT NULL UNIQUE CHECK (length(trim(number)) > 0),
    issue_date DATE NOT NULL CHECK (issue_date > DATE '2000-01-01' AND issue_date < DATE '2100-01-01')
);

CREATE TABLE grade_book_record (
    grade_book_record_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    grade_book_id BIGINT NOT NULL REFERENCES grade_book(grade_book_id) ON DELETE CASCADE,
    course_offering_id BIGINT NOT NULL REFERENCES course_offering(course_offering_id) ON DELETE RESTRICT,
    grade INT CHECK (grade IS NULL OR grade BETWEEN 2 AND 5),
    exam_date DATE CHECK (exam_date IS NULL OR (exam_date > DATE '2000-01-01' AND exam_date < DATE '2100-01-01')),
    attendance INT CHECK (attendance IS NULL OR attendance BETWEEN 0 AND 100),
    UNIQUE (grade_book_id, course_offering_id)
);
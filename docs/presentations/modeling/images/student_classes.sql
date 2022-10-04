CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    enrolled_at TIMESTAMP,
    semester TEXT,
    student_id INTEGER references students(id),
    class_id INTEGER references classes(id)
);
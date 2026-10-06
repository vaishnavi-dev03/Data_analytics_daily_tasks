CREATE DATABASE Vaishnavi;
USE Vaishnavi;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    phoneno VARCHAR(15)
);

INSERT INTO students (student_id, name, course, phoneno)
VALUES
(1, 'Aarav Sharma', 'BCA', '9876123456'),
(2, 'Priya Verma', 'MCA', '9876234567');

ALTER TABLE students 
ADD email VARCHAR(100);

SELECT * FROM students;

SELECT name FROM students WHERE student_id = "1";

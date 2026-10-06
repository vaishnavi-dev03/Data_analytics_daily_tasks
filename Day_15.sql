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
(1, 'Riya Sharma', 'MCA', '9876512345'),
(2, 'Rahul Verma', 'B.Tech CSE', '9876523456'),
(3, 'Ananya Gupta', 'BCA', '9876534567'),
(4, 'Karan Singh', 'MBA', '9876545678'),
(5, 'Neha Kapoor', 'M.Tech', '9876556789');

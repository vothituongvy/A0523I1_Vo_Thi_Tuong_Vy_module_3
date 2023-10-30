use `student_management`;
CREATE TABLE students (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
CREATE TABLE Class (
    id INT PRIMARY KEY,
    `name` VARCHAR(50)
);
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
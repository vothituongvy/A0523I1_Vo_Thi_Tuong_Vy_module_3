create database `student_management`;
use `student_management`;
CREATE TABLE student (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
CREATE TABLE Classs (
    id INT PRIMARY KEY,
    `name` VARCHAR(50)
);
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

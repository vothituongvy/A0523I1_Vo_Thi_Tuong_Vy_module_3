use `student_management`;
CREATE TABLE students (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
INSERT INTO `student_management`.`students` (`id`, `name`, `age`, `country`) VALUES ('1', 'Tran van A', '11', 'Ha Noi');
CREATE TABLE Class (
    id INT PRIMARY KEY,
    `name` VARCHAR(50)
);
INSERT INTO `student_management`.`class` (`id`, `name`) VALUES ('1', 'A05');
INSERT INTO `student_management`.`class` (`id`, `name`) VALUES ('2', 'A06');
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
INSERT INTO `student_management`.`teacher` (`id`, `name`, `age`, `country`) VALUES ('1', 'Nguyen Van A', '27', 'Quang Nam');
INSERT INTO `student_management`.`teacher` (`id`, `name`, `age`, `country`) VALUES ('2', 'Nguyen Van B', '29', 'Da Nang');

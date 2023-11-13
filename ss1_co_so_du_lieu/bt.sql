CREATE DATABASE demo_ss2;
USE demo_ss2;
create table class(
  id int primary key auto_increment, 
  `name` varchar(20)
);
create table jame(
  `account` varchar(50) primary key, 
  `password` varchar(50)
);
create table student(
  id int primary key auto_increment, 
  `name` varchar(50), 
  birthday date, 
  gender boolean, 
  email varchar(50), 
  `point` float, 
  class_id int, 
  `account` varchar(50) unique, 
  foreign key (class_id) references class(id), 
  foreign key (`account`) references jame(`account`)
);
create table instructor(
  id int primary key auto_increment, 
  `name` varchar(50), 
  birthday date, 
  salary double
);
create table instructor_class(
  class_id int, 
  instructor_id int, 
  start_time date, 
  end_time date, 
  primary key (class_id, instructor_id), 
  foreign key(class_id) references class(id), 
  foreign key(instructor_id) references instructor(id)
);
insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');
insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');
 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
SELECT *
FROM student
JOIN class ON student.class_id = class.id;
SELECT *
FROM student
LEFT JOIN class ON student.class_id = class.id;
SELECT * FROM student
WHERE `name` LIKE '%hai' OR `name` LIKE '%huynh';
SELECT *
FROM student
WHERE `point` > 5;
SELECT *
FROM student
WHERE `name` LIKE 'nguyen%';
SELECT `point`, count(*) AS so_luong
FROM student
GROUP BY `point`;
SELECT `point`, COUNT(*) AS so_luong
FROM student
WHERE `point` > 5
GROUP BY `point`
HAVING COUNT(*) >= 2;
SELECT student.`name`
FROM student
JOIN class ON student.class_id = class.id
WHERE class.`name` = 'c1121g1'
ORDER BY student.`name` ASC;
-- 1. Hiện thị danh sách các lớp có học viên theo học và 
-- số lượng học viên của mỗi lớp 
SELECT student.class_id,class.name, count(*) AS so_luong_hoc_vien
FROM student
join class on student.class_id = class.id
GROUP BY student.class_id;
-- 2. Tính điểm lớn nhất của mỗi các lớp
select class.name,max(point) as diem_cao_nhat
from class
join student on class.id=student.class_id
group by class.name;
-- 3. Tình điểm trung bình của từng lớp 
select class.name,avg(point) as diem_trung_binh
from class
join student on class.id=student.class_id
group by class.name;
-- 4. Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. 
-- Sử dụng union để kết hợp kết quả từ 2 bảng
select name,birthday
from instructor
union
select name,birthday
from student;
-- 5. Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
-- limit là để lấy ra 
select name,point
from student
order by point desc
limit 3;
-- 6. Lấy ra các học viên có điểm số là cao nhất của trung tâm.
select *
from student
where point=(select max(point) from student);

 
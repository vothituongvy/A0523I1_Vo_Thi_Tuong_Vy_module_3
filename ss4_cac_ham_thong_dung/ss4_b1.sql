use quanlysinhvien;
select *
from subject
where Credit=(select max(Credit) from subject);
select s.*, m.Mark 
from subject s join mark m on s.Subid = m.Subid
having m.Mark >= all (select mark from mark);
select s.*,avg(m.Mark) as diem_trung_binh
from student s
join mark m on s.StudentId=m.StudentId
group by s.StudentId,s.StudentName
order by diem_trung_binh desc
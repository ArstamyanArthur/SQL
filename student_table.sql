-- <, >, <=, >=, <> not =, =, AND, OR
create database student_table;

-- Creating
create table student(
    student_id int AUTO_INCREMENT primary key,
    name varchar(20) NOT NULL,
    major varchar(20)
);

DESCRIBE student;


Alter table student add goa decimal(3, 2);
Alter table student drop column goa;

insert into student values(1, 'Jack', 'Biology');
insert into student values(2, 'Kate', 'Sociology');
insert into student(name, major) values('Claire', 'Chemistry');
insert into student values(4, 'Jack', 'Biology');
insert into student values(5, 'Mike', 'Computer Science');
insert into student(name, major) values('Arthur', 'Computer Science');

-- Reading
select *  -- * is equivalent to writing all column names
from student
where student_id > 2 or name in ('Kate', 'Mia', 'Samuel')
order by major desc, student_id desc;

select name, major
from student
where major <> 'Chemistry';


-- Updating 
update student 
set major = 'CS'
where major = 'Computer Science';

update student 
set major = 'Biochemistry'
where major = 'Biology' or major = 'Chemistry';

update student 
set name = 'Tom', major = 'undecided'
where student_id = 4;

-- Deleting
DELETE FROM student
WHERE student_id = 5;

DELETE FROM student
WHERE name = 'Tom' and major='undecided';

DROP TABLE student;



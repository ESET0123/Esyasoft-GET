create database demodb1;

use demodb1;

create table employee(
id int,
emp_name varchar(50),
salary float,
phone_no INT,
dob date);

ALTER TABLE employee
ALTER COLUMN phone_no BIGINT;

insert into employee values(4,'Rahul',25000000.0,8014012625,'1998-11-19'),
(5,'Sam',2200000.0,8014573455,'1998-12-19');

select * from employee;

truncate table employee;

UPDATE employee SET salary=2600000 WHERE emp_name='Rishav';

SELECT salary from employee
WHERE emp_name='rishav';

SELECT * from employee
WHERE salary>=2200000.0
ORDER BY salary asc;

DELETE from employee
WHERE id=3;


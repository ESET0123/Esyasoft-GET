create database rishavdb;

use rishavdb;

create table employee(
id int,
emp_name varchar(50),
branch varchar(100),
salary float);

insert into employee values(1,'Akash','Mechanical',100000.0),
(2,'Bishal','Electrical',200000.0),
(3,'Shreyansh','Electronics',300000.0),
(4,'Punit','Computer Science',400000.0),
(5,'Sumit','Electrical',500000.0);

SELECT * from employee;

SELECT * from employee
WHERE salary > 100000;

UPDATE  employee
SET emp_name='Shivam' where id=4;

DELETE from employee where emp_name='shivam';

ALTER TABLE employee
ADD phone_no BIGINT;

ALTER TABLE employee
DROP COLUMN phone_no;

EXEC sp_help 'employee_table';		/* Structure of the table */

EXEC sp_rename 'employee.emp_name', 'employee_name', 'column';	/* change column name */

EXEC sp_rename 'employee', 'employee_table';	/* change table name */
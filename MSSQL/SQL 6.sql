create database sql6;
Use sql6;

CREATE TABLE Students2024 (ID INT, Name VARCHAR(50));
CREATE TABLE Students2025 (ID INT, Name VARCHAR(50));

INSERT INTO Students2024 VALUES
(1,'Ravi'),(2,'Asha'),(3,'John'),(4,'Meera'),(5,'Kiran'),
(6,'Divya'),(7,'Lokesh'),(8,'Anita'),(9,'Rahul'),(10,'Sneha');

INSERT INTO Students2025 VALUES
(2,'Asha'),(4,'Meera'),(5,'Kiran'),(11,'Prakash'),(12,'Vidya'),
(13,'Neha'),(14,'Manoj'),(15,'Ramesh'),(16,'Lata'),(17,'Akash');



CREATE TABLE Employees (EmpID INT, Name VARCHAR(50), Department VARCHAR(20));

INSERT INTO Employees VALUES 
(1,'Ananya','HR'),(2,'Ravi','IT'),(3,'Meera','Finance'),
(4,'John','IT'),(5,'Divya','Marketing'),(6,'Sneha','Finance'),
(7,'Lokesh','HR'),(8,'Asha','IT'),(9,'Kiran','Finance'),(10,'Rahul','Sales');



CREATE TABLE Projects (ProjectID INT, Name VARCHAR(50), StartDate DATE, EndDate DATE);

INSERT INTO Projects VALUES 
(1,'Bank App','2025-01-01','2025-03-15'),
(2,'E-Commerce','2025-02-10','2025-05-20');

CREATE TABLE Contacts (ID INT, Name VARCHAR(50), Email VARCHAR(50), Phone VARCHAR(20));

INSERT INTO Contacts VALUES
(1,'Ravi','ravi@gmail.com',NULL),
(2,'Asha',NULL,'9876543210'),
(3,'John',NULL,NULL);

select *, rank() over (order by ID) as popularity
from Students2024;

select * from Students2024
union all
select * from Students2025

select GETDATE() as today_date

select upper('hello world') as upper_text

select lower(name) as f_name from Students2024

select name, len(name) as f_name from Students2024

select substring(name,2,2) from Students2024

select lower(reverse(name)) from Students2024

select reverse(substring(name,2,len(name))) from Students2024

select replace('rishav likes tea', 'tea', 'coffee')

select replace(name, 'ravi', 'ravi kumar') from Students2024

select concat('rishav likes tea', ' and ', 'coffee')

select concat(name, ' ', id) from Students2024

select cast('5000' as int)

select cast(id as float) from Students2024

select GETDATE() as todaysdate

select convert(varchar(10), getdate(), 103) as Date__DDMMYY


/* Show a list of all student names (unique only). */
select name from Students2024
union 
select name from Students2025

/* Show a list of all student names (including duplicates). */
select name from Students2024
union all
select name from Students2025

--Task

/* Display employee names in UPPERCASE and LOWERCASE. */
select upper(name) from employees;

select lower(name) from employees;

/* Find the length of each employee’s name. */
select name, len(name) from employees;

/* Show only the first 3 letters of each name. */
select name, substring(name,1,3) as first_3_letters from employees;

/* Replace Finance department with Accounts. */
select REPLACE(Department, 'Finance', 'Accounts') from employees;

/* Create a new column showing "Name - Department" using CONCAT. */
select CONCAT(name,' - ', department) from employees

/* Show today’s date using GETDATE(). */
select GETDATE() AS TodaysDate

/* Find the duration (in days) of each project using DATEDIFF. */
select name, StartDate, EndDate, datediff(day, StartDate, EndDate) as DurationInDays
from Projects;

/* Add 10 days to each project’s EndDate using DATEADD. */
select name, EndDate, dateadd(day, 10, EndDate) as NewEndDate
from Projects;

/* Find how many days are left until each project ends. (Hint: Use DATEDIFF with GETDATE()) */
select name, EndDate, datediff(day, GETDATE(), EndDate) as DaysUntilEnd
from Projects;



/* Convert today’s date into DD/MM/YYYY format using CONVERT. */
select convert(varchar(10), getdate(), 103) as Date__DDMMYY

/* Convert a float 123.456 into an integer using CAST. */
select cast(123.456 as integer) as int_value

/* For employees (from Employees table above), categorize them: 
If Dept = IT → show Tech Team 
If Dept = HR → show Human Resources 
Else → Other */
select name,
    case
        when Department = 'IT' then 'Tech Team'
        when Department = 'HR' then 'Human Resources'
        else 'Other'
    end as Category
from Employees;

-- Procedures

create procedure retrieve_data
as 
begin 
	select * from employees;
end

exec retrieve_data

create procedure retrieve_data2
	@emp_id INT
as 
begin 
	select * from employees where EmpID=@emp_id;
end

exec retrieve_data2 @emp_id=4

create procedure checkEmployeeSalary
	@emp_id INT
as 
begin 
	DECLARE @salary INT;
	SELECT @salary= salary
	from employees
	where EmpId= @emp_id;

	IF @SALARY >=5000
		PRINT 'High Salary';
	ELSE IF @SALARY >= 3000
		PRINT 'Mid Salary';
	ELSE
		PRINT 'Low Salary';
end

exec checkEmployeeSalary @emp_id=1;
create database rdb1;

use rdb1;

DROP table employee;

create table employee(
Id int primary key,
Name varchar(50),
Dept varchar(50),
Salary varchar(40),
);

insert into employee values(1, 'NB','IT' ,'100000'),
(2,'SD','HR','200000'),
(3,'MM','MARKETING','300000'),
(4,'SK','MARKETING','500000'),
(5,'PN','IT','100000');

UPDATE employee
SET Salary = '400000' WHERE Name='SD';

SELECT * FROM employee;

ALTER TABLE employee
ADD Phone_N VARCHAR(10);

ALTER TABLE employee
ADD Salary BIGINT;

UPDATE employee
SET Phone_N ='8013073625' WHERE ID=1;
UPDATE employee
SET Phone_N ='8013413625' WHERE ID=2;
UPDATE employee
SET Phone_N ='8017473625' WHERE ID=3;
UPDATE employee
SET Phone_N ='8013076525' WHERE ID=4;
UPDATE employee
SET Phone_N ='8013012625' WHERE ID=5;

SELECT ID, Name, Dept FROM employee;

create table SALARY(
S_Id int primary key,
Salary varchar(40)
FOREIGN KEY (S_ID) REFERENCES employee(id),
);

INSERT INTO salary 
SELECT ID,Salary FROM employee ;

SELECT * FROM Salary;

ALTER table employee 
DROP COLUMN salary;

ALTER TABLE employee
ALTER COLUMN Salary BIGINT;

SELECT * FROM employee;

SELECT * FROM employee where id=1;

SELECT * FROM employee where id in (1,3,5);

SELECT * FROM employee where salary<>400000;		/* not 400000*/

SELECT * FROM employee where salary<=400000;		

SELECT * FROM employee where salary BETWEEN 200000 AND 400000

SELECT * FROM employee where Name like 'NB';

SELECT * FROM employee where Name like 'S%';

SELECT * FROM employee where Name NOT like 'S%';

SELECT MIN(Salary) as min_sal FROM employee ;
SELECT MAX(Salary) as max_sal FROM employee where salary<400000;
SELECT Count(Salary) as count FROM employee;
SELECT Sum(Salary) as sum FROM employee;
SELECT AVg(Salary) as avg_sal FROM employee;

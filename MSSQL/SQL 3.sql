EXEC sp_help 'university';		/* Structure of the table */

drop table university;

create table university (
id int primary key identity (1,1),	/* begin at 1 and increment by 1 */
names varchar(100),
dept varchar(100),
fees float);

insert into university values ('Shre', 'Cs', 15000.09, 'ab5c@email.com'),
('Pratima', 'CA', 55000.09, 'abc2@email.com'),
('Amit', 'Comm', 45010.09, 'abc3@email.com'),
('Shubham', 'Arts', 700000.09, 'abc4@email.com')

ALTER table university
ADD email varchar(100) unique;

select * from university;

create table students (
s_id int primary key,name varchar(10),
class varchar(10),
foreign key (s_id) references university(id));

drop table students;

insert into students values (1, 'Rishav 1 ', 'class 1'),
(4, 'Rishav 2', 'class 2'),(5, 'Rishav 3', 'class 3'),(3, 'Rishav 5', 'class 5');

select * from students;

delete from university where id =3;
CREATE DATABASE assessment1;

use assessment1;

create table customers(
CustomerId int primary key,
Name varchar(50),
Address varchar(50),
Region varchar(50)
);

create table SmartMeterReadings(
MeterId int primary key,
CustomerId int,
Location varchar(50),
InstalledDate Date,
ReadingDateTime DateTime,
EnergyConsumed int
foreign key(CustomerId) references Customers(CustomerId)
);

INSERT into Customers values(101,'Rishav', 'Kolkata', 'North'),
(102,'Aniket', 'Siliguri', 'North'),
(103,'Sahil', 'Rajasthan', 'West'),
(104,'Manjit', 'Orissa', 'East'),
(105,'Soumyadeep', 'Kolkata', 'South');

INSERT into SmartMeterReadings values(1001, 105, 'rooftop','2024-07-02','2025-06-12 10:00:00',450),
(1002, 102, 'basement','2024-07-12','2024-06-12 10:00:00',300),
(1003, 103, 'rooftop','2024-09-03','2024-01-12 10:00:00',450),
(1004, 104, 'basement','2023-02-14','2024-04-12 10:00:00',312),
(1005, 105, 'basement','2024-05-02','2024-06-12 10:00:00',454),
(1006, 103, 'rooftop','2025-07-12','2024-05-21 10:00:00',215);

delete from SmartMeterReadings where MeterId=1007

select * from SmartMeterReadings;

select *, row_number() over (order by EnergyConsumed desc) as Row_Num,
rank() over (order by EnergyConsumed desc) as ranks,
DENSE_RANK() over (order by EnergyConsumed desc) as d_rank
from SmartMeterReadings;

select *, row_number() over (partition by Location order by EnergyConsumed desc) as Row_Num
from SmartMeterReadings;

/* Task 1 */

select MeterId, ReadingDateTime, EnergyConsumed from SmartMeterReadings
where EnergyConsumed between 10 and 50;

select MeterId, ReadingDateTime, EnergyConsumed from SmartMeterReadings
where ReadingDateTime between 2024-01-01 and 2024-02-31;

select MeterId, ReadingDateTime, EnergyConsumed from SmartMeterReadings
where InstalledDate <= '2024-06-30';

select MeterId, ReadingDateTime, EnergyConsumed from SmartMeterReadings
where EnergyConsumed between 10 and 50
ANd ReadingDateTime between 2024-01-01 and 2024-02-31
and InstalledDate <= '2024-06-30';

/* Task 2 */

select  customerId, avg(EnergyConsumed) as 'AvgEnergyConsumed', max(EnergyConsumed) as 'MaxEnergyConsumed'
from SmartMeterReadings
where ReadingDateTime between '2025-01-01 00:00:00' and '2025-12-31 23:59:59'
Group By customerId ;

select * from SmartMeterReadings order by EnergyConsumed desc offset 1 rows fetch next 2 rows only;

/* Stretch Goal 

select  MeterId, sum(EnergyConsumed), count(MeterId), CAST(ReadingDateTime AS time)
from SmartMeterReadings
Group By MeterId ;

select * 
*/
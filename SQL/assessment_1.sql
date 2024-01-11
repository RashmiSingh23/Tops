create database wb;
use wb;
create table worker(
WORKER_ID int primary key,
FIRST_NAME varchar(20),
LAST_NAME VARCHAR(20),
SALARY INT,
JOINING_DATE datetime,
DEPARTMENT VARCHAR(20));

INSERT INTO worker VALUES
('1', 'MONIKA ', 'ARORA', '10000', '2014-02-20 09:00:00', 'HR'),
('2', 'NIHARIKA', 'VERMA', '80000', '2014-11-06 9:00:00', 'ADMIN');

INSERT INTO worker VALUES 
('3', 'VISHAL', 'SINGHAL', '300000', '2014-02-20 09:00:00', 'HR'),
('4', 'AMITABH', 'SINGH', '500000', '2014-02-20 09:00:00', 'ADMIN'),
('5', 'VIVEK', 'BHATI', '500000', '2014-06-11 09:00:00', 'ADMIN'),
('6', 'VIPUL', 'DIWAN', '200000', '2014-06-11 09:00:00', 'ACCOUNT'),
('7', 'SATISH', 'KUMAR', '75000', '2014-01-20 09:00:00', 'ACCOUNT'),
('8', 'GEETIKA', 'CHAUHAN', '90000', '2014-04-11 09:00:00', 'ADMIN');

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * from Worker 
order by FIRST_NAME asc,DEPARTMENT desc;

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”from the Worker table.
Select * from Worker 
where FIRST_NAME in ('Vipul','Satish');

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
Select * from Worker
where FIRST_NAME like '______h'; 

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 300000.
Select * from Worker 
where SALARY between 100000 and 300000;

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT  SALARY,deaprtment FROM worker
group by salary, DEPARTMENT
having count(*) > 1;

-- 6. Write an SQL query to show the top 6 records of a table.
select * from worker
limit 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them.
select DEPARTMENT,count(*) from worker
group by DEPARTMENT
having count(*)<5;

-- 8. Write an SQL query to show all departments along with the number of people in there.
select DEPARTMENT,count(*) from worker
group by DEPARTMENT;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department. 
select FIRST_NAME,SALARY from worker
where salary=(select max(salary) from worker);

create database if not exists school;
use school;
create table st(
Std int primary key,
StdName varchar(20),
sex varchar(20),
Percentage int,
class int,
Sec varchar(5),
Stream varchar(20),
DOB date);

INSERT INTO st VALUES 
('1001', 'Surekha Joshi ', 'Female', '82', '12', 'A', 'Science', '1998-08-3');

INSERT INTO st values 
('1002', 'Maahi Agarwal', 'Female', '56', '11', 'C', 'Commerce', '2008-11-23'),
('1003', 'Sanam Verma', 'Male', '59', '11', 'C', 'Commerce', '2006-06-29'),
('1004', 'Ronit Kumar', 'Male', '63', '11', 'C', 'Commerce', '1997-05-11'),
('1005', 'Dipesh Pulkit', 'Male', '78', '11', 'B', 'Science', '2003-09-14'),
('1006', 'Jahanvi Puri', 'Female', '60', '11', 'B', 'Commerce', '2008-07-11'),
('1007', 'Sanam Kumar', 'Male', '23', '12', 'F', 'Commerce', '1998-08-03'),
('1008', 'Sahil saras', 'Male', '56', '11', 'C', 'Commerce', '2008-07-11'),
('1009', 'Akshra agarwal', 'Female', '72', '12', 'B', 'Commerce', '1996-01-10'),
('1010', 'stuti Mishra', 'Female', '39', '11', 'F', 'Science', '2008-11-23'),
('1011', 'Harsh Agarwal', 'Male', '42', '11', 'C', 'Science', '1998-03-8'),
('1012', 'Nikunj agarwal', 'Male', '49', '12', 'C', 'Commerce', '1998-06-28'),
('1013', 'Akriti saxena', 'Female', '89', '12', 'A', 'Science', '2008-11-23'),
('1014', 'Tani Rastogi', 'Female', '82', '12', 'A', 'Science', '2008-11-23');

-- 1 To display all the records form STUDENT table. 
SELECT * FROM st ;

-- 2. To display any name and date of birth from the table STUDENT. 
SELECT StdName, DOB
FROM st ;

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table.
SELECT * FROM st WHERE percentage >= 80;

-- 4. To display student name, stream and percentage where percentage of student is more than 80
SELECT StdName, Stream, Percentage from st
WHERE percentage > 80;

-- 5. To display all records of science students whose percentage is more than 75 form student table.
SELECT * from st 
WHERE stream = 'Science' AND percentage > 75;



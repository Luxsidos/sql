-- lesson 9 joins

-- relational database

-- one to one

-- emp login, password
-- emp, salary.

-- one to many
-- dep, emp
-- 1 dep = 10-15 emp
 
-- many to many

-- F24 - 25 Students
-- S20, F24 John

-- Self referencing
-- Emp: Emp, name, id, age, depID, ManagerID



-- cartesion product (cross join)

-- 3, 4 = 12
create table tbl1 (number1 int, number2 int)
create table tbl2 (number1 int, number2 int)

insert into tbl1 values (1, 2)
insert into tbl1 values (1, 2)
insert into tbl1 values (1, 2)

insert into tbl2 values (2, 1)
insert into tbl2 values (2, 1)
insert into tbl2 values (2, 1)
insert into tbl2 values (2, 1)

select * from tbl1
select * from tbl2

-- filter certasian, cross join
select * from tbl1 cross join tbl2

select * from tbl1 cross join tbl2
where tbl1.number1 > 1

-- showing INNER join

select * from tbl1 inner join tbl2
on tbl1.number2 > 1

-- using logical opr clause(=, <>, >, <...)

--Salesman:
--SalesmanID, name, salary, dep
--Sales:
--SaleID, SaleAmount, SalesmanID, date

-- Drop tables if they already exist
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Salesmen;

-- Create Salesmen Table
CREATE TABLE Salesmen (
    SalesmanID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10, 2),
    Department VARCHAR(100)
);

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleAmount DECIMAL(10, 2),
    SalesmanID INT,
    SaleDate DATE,
    FOREIGN KEY (SalesmanID) REFERENCES Salesmen(SalesmanID)
);


INSERT INTO Salesmen (SalesmanID, Name, Salary, Department) VALUES
(1, 'Alice Johnson', 5000.00, 'Electronics'),
(2, 'Bob Smith', 5500.00, 'Furniture'),
(3, 'Charlie Brown', 4800.00, 'Clothing'),
(4, 'Diana Evans', 6000.00, 'Electronics'),
(5, 'Ethan Clark', 5200.00, 'Stationery'),
(6, 'Fiona Davis', 5100.00, 'Clothing'),
(7, 'George Adams', 5300.00, 'Furniture'),
(8, 'Hannah Lee', 4900.00, 'Electronics'),
(9, 'Ian Thomas', 5800.00, 'Stationery'),
(10, 'Jack White', 4700.00, 'Clothing'),
(11, 'Karen Harris', 4950.00, 'Furniture'),
(12, 'Liam Walker', 6100.00, 'Electronics'),
(13, 'Mia Lewis', 4750.00, 'Stationery'),
(14, 'Noah Hall', 5000.00, 'Clothing'),
(15, 'Olivia Allen', 5600.00, 'Furniture'),
(16, 'Paul Young', 5400.00, 'Electronics'),
(17, 'Quincy Scott', 5200.00, 'Stationery'),
(18, 'Rachel King', 4950.00, 'Clothing'),
(19, 'Samuel Turner', 5150.00, 'Furniture'),
(20, 'Tina Baker', 5300.00, 'Electronics'),
(21, 'Uma Foster', 5050.00, 'Stationery');

INSERT INTO Sales (SaleID, SaleAmount, SalesmanID, SaleDate) VALUES
(101, 1200.00, 1, '2023-01-15'),
(102, 1500.00, 2, '2023-01-16'),
(103, 1800.00, 3, '2023-01-17'),
(104, 1000.00, 4, '2023-01-18'),
(105, 900.00, 5, '2023-01-19'),
(106, 1250.00, 6, '2023-01-20'),
(107, 1400.00, 7, '2023-01-21'),
(108, 1100.00, 8, '2023-01-22'),
(109, 1600.00, 9, '2023-01-23'),
(110, 1300.00, 10, '2023-01-24'),
(111, 1500.00, 11, '2023-01-25'),
(112, 1700.00, 12, '2023-01-26'),
(113, 900.00, 13, '2023-01-27'),
(114, 1350.00, 14, '2023-01-28'),
(115, 1450.00, 15, '2023-01-29'),
(116, 1550.00, 16, '2023-01-30'),
(117, 1650.00, 17, '2023-01-31'),
(118, 1750.00, 18, '2023-02-01'),
(119, 1850.00, 19, '2023-02-02'),
(120, 1950.00, 20, '2023-02-03'),
(121, 1050.00, 21, '2023-02-04'),
(122, 1500.00, 1, '2023-02-05'),
(123, 1350.00, 2, '2023-02-06');

select * from Sales
select * from Salesmen


select * from Salesmen join Sales
on Salesmen.SalesmanID = Sales.SalesmanID


select name, Sum(SaleAmount) from Salesmen join Sales
on Salesmen.SalesmanID = Sales.SalesmanID
group by name


-- 

create table employees (employeeID int, EmployeeName varchar(20), DepartmentID int)

create table departments (DepartmentID int, DepartmentName varchar(20))


insert into employees values (1, 'John', 1), (2, 'Alice', 2), (3, 'Bob', 1), (4, 'Sarah', 3)

insert into departments values (1, 'Sales'), (2, 'Marketing'), (3, 'IT')

select * from employees
select * from departments

-- emp name, department name

select EmployeeName, DepartmentName
from employees join departments on employees.DepartmentID = departments.DepartmentID

--

create table students (studentID int, StudentName varchar(20))
create table courses (CourseID int, CourseName varchar(20))
create table enrollments (studentID int, courseID int)

insert into students values (1, 'Alice'), (2, 'Bob'), (3, 'Charlie')
insert into courses values (101, 'Math'), (102, 'Science'), (103, 'English')

insert into Enrollments values (1, 101), (1, 102), (2, 101), (3, 102)

--SQL query to fetch the names of students and the courses they are enrolled

select * from students
select * from courses
select * from enrollments

select studentName, CourseName
from students join enrollments on 
students.studentID = enrollments.studentID
join courses on 
courses.CourseID = enrollments.courseID






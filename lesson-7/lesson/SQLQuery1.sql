--lesson-7

--Aggregate Functions, filtering aggregated
--data

--1. Explaining MIN and MAX (apply these to numbers and characters)

--2. Showing the difference COUNT (*), COUNT (columnname) and Count (distinct columnname)

--3. Explaining AVG and SUM

--4. Applying Aggregate functions with Group by

--5. Filtering aggregated data with HAVING

--aggregate functions
--avg, sum, count, min, max

create database f24_class7
use f24_class7

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Products VALUES
(212, 'Apple', 1.50),
(432, 'Banana', 1.00),
(54, 'Mango', 2.00),
(443, 'Orange', 1.20);

--1. Explaining MIN and MAX (apply these to numbers and characters)

select max(price) from Products -- numeric
select min(price) from Products -- numeric
select max(ProductName) from Products -- character
select min(ProductName) from Products -- character

--2. Showing the difference COUNT (*), COUNT (columnname) and Count (distinct columnname)

select count(productname) from Products

insert into products values (1, null, 3), (3, null, 4)
insert into products values (1, 'kiwi', 0)

select count(Price) from Products

select count(*) from Products

insert into products values (null, null, null), (null, null, null)

select * from Products

select  count(distinct productname) from products

select distinct ProductName from products

--3. Explaining AVG and SUM

select * from Products

select avg(price) from Products
select sum(price) from Products
select count(price) from Products

--4. Applying Aggregate functions with Group by

select ProductName, avg(price) from Products 
group by ProductName

select ProductName, sum(price) from Products
group by ProductName


--5. Filtering aggregated data with HAVING

select ProductName, avg(price) from Products 
group by ProductName
having AVG(price) > 1.5

select ProductName from Products 
group by ProductName
--having AVG(price) > 1.5


-- error, having only works for aggregate and group by tables
--select * from Products 
--having AVG(price) > 1.5

-- puzzle 1
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO Sales (SaleID, ProductName, Quantity, Price) VALUES
(1, 'Laptop', 2, 800.00),
(2, 'Phone', 3, 500.00),
(3, 'Laptop', 1, 800.00),
(4, 'Tablet', 5, 300.00),
(5, 'Phone', 2, 500.00);

select * from sales



select productName, sum(price * Quantity) from Sales 
group by ProductName


-- puzzle 2
CREATE TABLE EmployeeSalaries (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO EmployeeSalaries (EmpID, EmpName, Department, Salary) VALUES
(1, 'John', 'HR', 50000),
(2, 'Mary', 'IT', 70000),
(3, 'Steve', 'IT', 72000),
(4, 'Sara', 'Finance', 60000),
(5, 'Mike', 'HR', 55000);

select * from EmployeeSalaries
-- find average salary per department

select Department, avg(Salary) from EmployeeSalaries 
group by Department


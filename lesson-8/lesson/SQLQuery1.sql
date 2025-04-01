create database f24_class8

use f24_class8

--practice
--pivot

--Puzzle 1
--A shop wants to find customers whose total spending is greater than $1000.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Amount DECIMAL(10,2)
);

INSERT INTO Orders (OrderID, CustomerName, Amount) VALUES
(1, 'Alice', 500.00),
(2, 'Bob', 300.00),
(3, 'Alice', 600.00),
(4, 'David', 200.00),
(5, 'Bob', 800.00);

select CustomerName, SUM(Amount) as TotalSpending from Orders
group by CustomerName
having SUM(Amount) > 1000


--Puzzle 2
--A store tracks product prices. 
--Find the highest and lowest price recorded for each product.

CREATE TABLE ProductPricing (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO ProductPricing (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 800.00),
(2, 'Phone', 500.00),
(3, 'Laptop', 850.00),
(4, 'Tablet', 300.00),
(5, 'Phone', 550.00);

select ProductName, Min(Price), Max(Price) from ProductPricing
group by ProductName

--Puzzle 4
--You are given a table tblSales 
--that stores product sales across three countries: India, US, and UK. 
--Each row includes the SalesAgent, SalesCountry, and SalesAmount.

--Write a query that shows the total sales 
--for each agent in India, US, and UK as separate columns 
--using SUM() + CASE


CREATE TABLE tblProductSales (
    SalesAgent VARCHAR(50),
    SalesCountry VARCHAR(50),
    SalesAmount DECIMAL(10,2)
);

INSERT INTO tblProductSales VALUES
('Ali', 'India', 100),
('Ali', 'US', 200),
('Ali', 'UK', 150),
('Sara', 'India', 300),
('Sara', 'UK', 250),
('John', 'US', 400),
('John', 'UK', 100);

Insert into tblProductSales values('Tom', 'UK', 200)
Insert into tblProductSales values('John', 'US', 180)
Insert into tblProductSales values('John', 'UK', 260)
Insert into tblProductSales values('David', 'India', 450)
Insert into tblProductSales values('Tom', 'India', 350)
Insert into tblProductSales values('David', 'US', 200)
Insert into tblProductSales values('Tom', 'US', 130)
Insert into tblProductSales values('John', 'India', 540)
Insert into tblProductSales values('John', 'UK', 120)
Insert into tblProductSales values('David', 'UK', 220)
Insert into tblProductSales values('John', 'UK', 420)
Insert into tblProductSales values('David', 'US', 320)
Insert into tblProductSales values('Tom', 'US', 340)
Insert into tblProductSales values('Tom', 'UK', 660)
Insert into tblProductSales values('John', 'India', 430)
Insert into tblProductSales values('David', 'India', 230)
Insert into tblProductSales values('David', 'India', 280)
Insert into tblProductSales values('Tom', 'UK', 480)
Insert into tblProductSales values('John', 'US', 360)
Insert into tblProductSales values('David', 'UK', 140)

Select * from tblProductSales

SELECT SalesAgent,
	SUM(case
		when SalesCountry = 'India' then SalesAmount
		else 0
	end) as India,
	SUM(case
		when SalesCountry = 'UK' then SalesAmount
		else 0
	end) as UK,
	SUM(case
		when SalesCountry = 'US' then SalesAmount
		else 0
	end) as US
from tblProductSales
Group by SalesAgent

-- pivot
select SalesAgent, UK, US, India from tblProductSales
pivot(SUM(SalesAmount) for salesCountry in (UK, US, India)) as pivottable

--Puzzle 5
CREATE TABLE GroupedStatus
(
       Id INT
    ,  A1 VARCHAR(1)
    ,  QTY INT  
    ,  Vals VARCHAR(10)
)
GO
 
INSERT INTO GroupedStatus VALUES
(1,'A',25,'OPEN'),
(1,'B',25,'OPEN'),
(1,'C',25,'OPEN'),
(1,'D',25,'CLOSE'),
(1,'E',25,'OPEN'),
(1,'F',25,'OPEN'),
(1,'G',25,'OPEN'),
(2,'A',43,'OPEN'),
(2,'B',43,'OPEN'),
(2,'C',43,'OPEN'),
(2,'D',43,'OPEN'),
(2,'E',43,'OPEN'),
(2,'F',43,'OPEN'),
(2,'G',43,'OPEN'),
(3,'A',20,'CLOSE'),
(3,'B',20,'CLOSE'),
(3,'C',20,'CLOSE'),
(3,'D',20,'CLOSE'),
(3,'E',20,'CLOSE'),
(3,'F',20,'CLOSE'),
(3,'G',20,'CLOSE')
GO
 
SELECT * FROM GroupedStatus
GO
/*
In this puzzle you have to group data based on the Id and QTY column 
& find out the status for them, 
if the status are multiple then we need �In progress in this column� 
otherwise you just need to place the same status if all the status are same.
The challenge is to do this in a single SELECT. 
Please see the sample input and expected output.

expected output:
Id  QTY  GrStatus
1  25  In-Progress
2  43  OPEN
3  20  CLOSE
*/

select id, QTY,
		case when count(distinct Vals) > 1 then 'In-progress'
		else Max(Vals)
	end as group_status
from GroupedStatus
group by id, QTY






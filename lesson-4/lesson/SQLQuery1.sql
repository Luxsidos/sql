-- filtering and ordering

-- not null, identity, unique, primary key, foreign key

-- check, default, update cascade, delete cascade

-- CHECK

create database f24_class4
use f24_class4

create table CountryList(countryName varchar(50), countryPopulation int check (countryPopulation > 0))

insert into CountryList values ('Uzbekistan', 37)

-- ERROR
insert into CountryList values ('BAA', -37)

alter table CountryList 
Nocheck constraint CK__CountryLi__count__36B12243

SELECT * FROM CountryList


-- DEFAULT

create table Empoyees(id int, name varchar(50), age int default 18)

select * from Empoyees

insert into Empoyees values (1, 'John', 20)
insert into Empoyees values (1, 'Arthur', null)
insert into Empoyees(id, name) values (3, 'John')

-- CASCADE

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) 
        REFERENCES Customers(CustomerID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT INTO Customers (CustomerID, Name)
VALUES (1, 'John Doe'), (2, 'Alice Smith');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (101, 1, '2024-03-01'), (102, 1, '2024-03-05'), (103, 2, '2024-03-10');


Select * from Customers
Select * from Orders

update Customers
set CustomerID = 10
where CustomerID = 3

delete Customers
where CustomerID = 2

alter table Orders
Drop constraint CK__CountryLi__count__36B12243

alter table Orders
add constraint Fk_orders foreign key (customerID) references Customers(customerId)

-- lesson 4 ordering data

 --1. TOP

select top 10 * from [AdventureWorks2022].[Person].[Person]

 --2. percent
select top 10 percent * from [AdventureWorks2022].[Person].[Person]


select top 3 * from [AdventureWorks2022].[Person].[Person] order by FirstName 

select top 3 percent * from [AdventureWorks2022].[Person].[Person] order by FirstName 

 --offset and fetch

select * from [AdventureWorks2022].[Person].[Person] order by BusinessEntityID
 offset 10 rows fetch next 5 rows only

select * from [AdventureWorks2022].[Person].[Person] order by BusinessEntityID
 offset 10 rows

 --ERROR
--select * from [AdventureWorks2022].[Person].[Person] order by BusinessEntityID
-- fetch next 5 rows only

select * from [AdventureWorks2022].[Person].[Person] order by BusinessEntityID
 offset 10 rows fetch next 5 first only


-- distinct

select distinct Persontype from [AdventureWorks2022].[Person].[Person]
select distinct EmailPromotion from [AdventureWorks2022].[Person].[Person]


select distinct Persontype, EmailPromotion from [AdventureWorks2022].[Person].[Person]


-- ISNULL and COALESE
select * from [AdventureWorks2022].[Person].[Person]

select ISNULL(title, 'no title') from [AdventureWorks2022].[Person].[Person]

select coalesce(title, Middlename, lastname) from [AdventureWorks2022].[Person].[Person]

-- order by:
-- a) order by numbers
-- b) order by strings
-- c) order by multiple column

select * from [AdventureWorks2022].[Person].[Person] order by BusinessEntityID desc

select * from [AdventureWorks2022].[Person].[Person] order by Firstname asc

select * from [AdventureWorks2022].[Person].[Person] order by PersonType asc, BusinessEntityID desc

-- where

select * from [AdventureWorks2022].[Person].[Person] 
where BusinessEntityID > 500

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName = 'Luis' and EmailPromotion = 2
order by BusinessEntityID asc

-- LIKE

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like 'C%'

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like '_a%'

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like '[abcd]%'

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like '[aeio][bcd]%'

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like '[a-e]_[a-c]%'

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like '[^a-e]%'

select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like '%[%]%'

-- escape
select * from [AdventureWorks2022].[Person].[Person] 
where FirstName like '%\%%' escape '\'
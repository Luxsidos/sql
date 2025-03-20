
-- EASY

-- 1

--High-performance data import: It allows for fast, large-scale insertion of data.
--ETL processes: Commonly used in Extract, Transform, Load (ETL) operations to bring in data from different sources.
--Data migration: Useful for importing data from legacy systems or third-party applications.
--Batch processing: Helpful when processing large files in batch jobs.

--Basic Syntax:

BULK INSERT TableName FROM 'FilePath'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 2.

--Four File Formats That Can Be Imported into SQL Server

--CSV (Comma-Separated Values)
--Text files where each line represents a row and fields are separated by commas.

--TXT (Plain Text)
--Flat files with custom delimiters like tabs (\t), pipes (|), etc.

--XML (eXtensible Markup Language)
--Structured data files that can be imported using OPENXML, XML Bulk Load, or BULK INSERT (with XML support).

--JSON (JavaScript Object Notation)
--Lightweight data-interchange format; imported using OPENROWSET(BULK) with SINGLE_CLOB or SINGLE_BLOB options and then parsed with OPENJSON.

-- 3.

create table Products(ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10, 2))

-- 4.

INSERT INTO Products VALUES
    (1, 'Laptop', 1200.50),
    (2, 'Smartphone', 800.00),
    (3, 'Headphones', 150.75);

-- 5. 

-- NULL: unknown, undefined data in database
-- colum that allows NULL car store no value at all
-- NULL is not same with blank - '' and zero - 0

-- NOT NULL: Column must have value, cannot be empty

-- 6

ALTER TABLE Products
ADD CONSTRAINT UniqueProductName UNIQUE(ProductName)

-- 7.

-- SINGLE COMMENT
-- This query gets products that greater than 600 price

SELECT * FROM Products
WHERE Price > 600

-- MULTI COMMENT
/*
This query gets products
that greater
than 600 price
*/

SELECT * FROM Products
WHERE Price > 600

-- 8.

CREATE TABLE Categories(CategoryID INT PRIMARY KEY, CategoryName VARCHAR(50) UNIQUE)

-- 9. IDENTITY means that if you do your column identity it will be start from 1
-- and every time when you insert new data it increase to 1
-- if you do identity(100, 5) that means fist start from, second is range

-- for example

-- basic identity
CREATE TABLE Students
(
    StudentID INT IDENTITY PRIMARY KEY,  -- Auto-incrementing unique identifier
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- custom seed and increment
CREATE TABLE Orders
(
    OrderID INT IDENTITY(1000, 5) PRIMARY KEY,
    OrderDate DATE
);

-- MEDIUM

-- 10.

-- txt data includes:
/*
1,Laptop,1200.50
2,Smartphone,800.00
3,Headphones,150.75
*/

BULK INSERT ProductsFromTxt
FROM 'C:\Data\products.txt'
WITH
(
    FIELDTERMINATOR = ',',   -- Comma separates columns
    ROWTERMINATOR = '\n',    -- New line separates rows
    FIRSTROW = 1             -- Start from the first row
);

-- 11.
CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- 12.
ALTER TABLE Products
ADD CategoryID int

ALTER TABLE Products
ADD CONSTRAINT FK_Products_categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)

-- 13.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

-- 14.
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

-- 15.
SELECT 
    ProductID,
    ProductName,
    ISNULL(Stock, 0) AS Stock
FROM Products;

-- 16.
--A FOREIGN KEY constraint maintains referential integrity between two tables by
--ensuring that the value in one table corresponds to an existing value in another table.

-- using foreign key:

--CREATE TABLE Categories
--(
--    CategoryID INT PRIMARY KEY,
--    CategoryName VARCHAR(50)
--);

--CREATE TABLE Products
--(
--    ProductID INT PRIMARY KEY,
--    ProductName VARCHAR(50),
--    Price DECIMAL(10, 2),
--    CategoryID INT,
--    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
--);


-- 17.

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18)
);

-- 18.
CREATE TABLE Invoices
(
    InvoiceID INT IDENTITY(100, 10) PRIMARY KEY,
    InvoiceDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL
);

-- 19.
CREATE TABLE OrderDetails
(
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);

-- 20.
SELECT 
    EmpID,
    ISNULL(PhoneNumber, 'No Phone') AS Phone
FROM Employees;


-- 21.
CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);


-- 22
-- parent table
CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


-- child table
CREATE TABLE Staff
(
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
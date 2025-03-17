-- BASIC

-- 1
CREATE TABLE Employees(EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))

-- 2
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'John Marston', 5000.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (2, 'Rip Wan Winkle', 6000.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (3, 'Micah Bell', 5500.00), (4, 'Duch Davis', 6200.00);

-- 3
UPDATE Employees
SET Salary = 8000.0
WHERE EmpID = 1

-- 4
DELETE Employees
WHERE EmpID = 2


-- 5
CREATE TABLE TestTable (
    ID INT,
    Data VARCHAR(50)
);

-- Insert sample data
INSERT INTO TestTable (ID, Data) VALUES (1, 'Sample 1'), (2, 'Sample 2');

-- DELETE Removes rows but keeps the table structure and can have a WHERE clause
DELETE FROM TestTable WHERE ID = 1;

-- TRUNCATE Removes all rows, no WHERE clause, resets identity (if any), faster, minimal logging
TRUNCATE TABLE TestTable;

-- DROP Completely removes the table structure and data
DROP TABLE TestTable;

-- 6
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

-- 7 
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 8
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

-- 9
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 10
DELETE FROM Employees;


-- INTERMADITE

-- 11

CREATE TABLE ExistingDepartments (
    DeptID INT,
    DeptName VARCHAR(50)
);

INSERT INTO ExistingDepartments (DeptID, DeptName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance'),
    (4, 'Marketing'),
    (5, 'Operations');

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DeptID, DeptName
FROM ExistingDepartments;


-- 12
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

-- 13
TRUNCATE TABLE Employees;

-- 14
ALTER TABLE Employees
DROP COLUMN Department;

-- 15
EXEC sp_rename 'Employees', 'StaffMembers';


-- 16
DROP TABLE Departments;


-- ADVANCED

-- 17
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Description VARCHAR(255)
);

-- 18
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

-- 19
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

-- 20
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description, StockQuantity)
VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 'Ergonomic wireless mouse', 100),
(2, 'Gaming Keyboard', 'Electronics', 59.50, 'Mechanical RGB keyboard', 75),
(3, 'Running Shoes', 'Footwear', 89.99, 'Lightweight running shoes', 120),
(4, 'Water Bottle', 'Accessories', 12.49, 'Stainless steel bottle', 200),
(5, 'Notebook', 'Stationery', 4.99, 'A5 lined notebook', 300);

-- 21
SELECT * INTO Products_Backup
FROM Products;

-- 22
EXEC sp_rename 'Products', 'Inventory';

-- 23
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

-- 24
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);

-- 25
SELECT * FROM Inventory;
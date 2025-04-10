-- 1

SELECT * FROM Employees;

-- 2

SELECT ProductName, Price
FROM Products;

-- 3
SELECT *
FROM Students
WHERE Grade = 'A';

-- 4
SELECT *
FROM Books
ORDER BY Year DESC;

-- 5
SELECT TOP 2 *
FROM Orders
ORDER BY Total DESC;

CREATE DATABASE F24_class

use F24_class

CREATE TABLE Students(ID int not null, Firstname varchar(30), age int)

INSERT INTO Students values (1, 'John', 20)
INSERT INTO Students values (2, 'Jim', NULL)
INSERT INTO Students values (3, null, null)

INSERT INTO Students(ID) values (4)
INSERT INTO Students(ID, Firstname) values (5, 'Arthur')

SELECT * FROM Students
SELECT FIrstname, ID, age FROM Students


CREATE TABLE employees(ID int not null, name varchar(20), age int, salary int, dep varchar(20))

insert into employees values (1, 'Alex', 23, 1300, 'HR')
insert into employees values (2, 'Bob', 25, 1000, 'Sales')
insert into employees values (3, 'Charlie', 45, 1600, 'HR')
insert into employees values (4, 'George', 19, 800, 'Finance')
insert into employees values (5, 'Jane', 25, 1250, 'Sales')
insert into employees values (6, 'Aleksib', 36, 1520, 'Sales')
insert into employees values (7, 'Donk', 26, 1450, 'Sales')

SELECT * FROM employees

--SUM, AVG, COUNT, MIN, MAX

SELECT dep, SUM(salary) as [Sum of salary] FROM employees
group by dep

SELECT dep, AVG(age) as [AVERAGE AGE], Min(salary) as [Minimum salary] FROM employees
group by dep


SELECT AVG(salary) From employees
WHERE dep = 'Sales'



SELECT dep, MIN(AGE) as minimum_age, MAX(salary) as maximum_salary FROM employees
GROUP BY dep
ORDER BY minimum_age DESC, minimum_age DESC




Create table salesmen (ID int, Name varchar(20), age int, years_exp int)
Create table Sales (Sale_id int, product_name varchar(20), quantity int, price int, salesman_id int)



-- Inserting 20 records into Salesmen
INSERT INTO Salesmen (ID, Name, Age, Years_Exp) VALUES
(1, 'John Doe', 35, 10),
(2, 'Alice Smith', 29, 5),
(3, 'Bob Johnson', 40, 15),
(4, 'Emma Brown', 28, 4),
(5, 'Michael White', 45, 20),
(6, 'Sophia Davis', 31, 7),
(7, 'James Wilson', 38, 12),
(8, 'Olivia Taylor', 27, 3),
(9, 'William Martin', 33, 9),
(10, 'Emily Anderson', 30, 6),
(11, 'Daniel Thomas', 36, 11),
(12, 'Charlotte Garcia', 26, 2),
(13, 'Henry Martinez', 41, 16),
(14, 'Amelia Hernandez', 32, 8),
(15, 'Benjamin Lopez', 39, 14),
(16, 'Mia Gonzalez', 25, 1),
(17, 'Alexander Lee', 34, 10),
(18, 'Harper Young', 29, 5),
(19, 'Ethan Scott', 37, 13),
(20, 'Isabella Adams', 28, 4);

-- Inserting 50 records into Sales
INSERT INTO Sales (Sale_ID, Product_Name, Quantity, Price, Salesman_ID) VALUES
(21, 'Laptop', 2, 950, 1),
(22, 'Smartphone', 4, 520, 2),
(23, 'Tablet', 3, 310, 3),
(24, 'Headphones', 6, 120, 4),
(25, 'Monitor', 5, 220, 5),
(26, 'Keyboard', 7, 55, 6),
(27, 'Mouse', 9, 35, 7),
(28, 'Printer', 3, 270, 8),
(29, 'Webcam', 2, 85, 9),
(30, 'Speaker', 6, 160, 10),
(31, 'Hard Drive', 5, 130, 11),
(32, 'SSD', 4, 190, 12),
(33, 'RAM', 8, 95, 13),
(34, 'Graphics Card', 4, 420, 14),
(35, 'Motherboard', 3, 360, 15),
(36, 'Power Supply', 6, 160, 16),
(37, 'Cooling Fan', 7, 45, 17),
(38, 'VR Headset', 3, 620, 18),
(39, 'Game Console', 5, 520, 19),
(40, 'Smartwatch', 4, 210, 20),
(41, 'Earbuds', 8, 80, 1),
(42, 'Gaming Mouse', 5, 70, 2),
(43, 'Wireless Charger', 7, 40, 3),
(44, 'Bluetooth Speaker', 4, 130, 4),
(45, '4K Monitor', 3, 500, 5),
(46, 'Gaming Keyboard', 6, 90, 6),
(47, 'External SSD', 5, 250, 7),
(48, 'Gaming Chair', 2, 300, 8),
(49, 'Mechanical Keyboard', 3, 120, 9),
(50, 'Portable Hard Drive', 4, 110, 10);


SELECT * FROM Sales
SELECT * FROM salesmen

SELECT * FROM salesmen JOIN SALES
ON ID = salesman_id

SELECT Name, SUM(price*quantity) as total_sale from sales join salesmen
on ID = salesman_id
group by Name

-- lesson 5 -- Alias, Joining table with UNION, UNION ALL, INTERSECT, EXCEPT
-- Creating conditional columnswith CASE and IIF, IF, WHILE

create database F24_class5
use F24_class5

-- 1. Aliases


Select 'hello world' as Description
-- SAME
Select 'hello world' Description

select BusinessEntityID as ID, JobTitle from [AdventureWorks2022].[HumanResources].[Employee]

select count(1234) as number

-- select * from table1  as t1 join Table1 as t2 -- we will come back this in lesson 8,9

--Cte 

-- 2. UNION AND UNION ALL

SELECT 1,2,3
UNION 
SELECT 2,3,4

SELECT 1
UNION 
SELECT 2
UNION 
SELECT 3

create table number1 (num int)
create table number2 (num int)
create table number3 (num int)

insert into number1 values(1),(2),(3),(4)
insert into number2 values(5),(6),(7),(8)
insert into number2 values(5),(6),(7),(8)

select * from number1
select * from number2

select * from number1
union
select * from number2

select * from number1
union all
select * from number2

select num as Number into Number4 from number1
union all
select * from number2


select BusinessEntityID, JobTitle into test1 from [AdventureWorks2022].HumanResources.Employee
select BusinessEntityID, JobTitle into test2 from [AdventureWorks2022].HumanResources.Employee

select * from test1
select * from test2


Update test1
set BusinessEntityID = 1 
where BusinessEntityID <= 3
 
select * from test1
select * from test2


 
select * from Number1
intersect
select * from Number2

 
select * from Number1
except
select * from Number2
union
select * from number2

--4. CASE 

--case 
--	when condition then value
--	when condition2 then value
--else value
--end


select case 
	when 12 > 10 then 'Yes, correct!' 
	else 'No, incorrect' 
end

select case 
	when 14  % 2 = 0 then 'Even' 
	else 'Odd' 
end

declare @number int = 23

select case
	when @number % 2 = 0 then 'even'
	else 'odd'
end


create table employees (id int, departmentName varchar(20), salary int)

insert into employees values (1, 'IT', 2000), (2, 'HR', 3000), (3, 'Marketing', 16000),
	   (4, 'IT', 45000), (5, 'HR', 67000), (6, 'IT', 65000)

select * from employees


select *, case when salary > 10000 then 'Senior' else 'Junior' end as Position from employees

select *,
	case
		when departmentName = 'HR' and salary > 50000 then 'Rich'
		when departmentName = 'IT' and salary > 60000 then 'SuperRich'
		when salary < 40000 then 'Poor'
		else 'normal'
	end as Category
from employees
where case
		when departmentName = 'HR' and salary > 50000 then 'Rich'
		when departmentName = 'IT' and salary > 60000 then 'SuperRich'
		when salary < 40000 then 'Poor'
		else 'normal'
	end = 'Rich' 

select * into employers from [f24_class4].[dbo].[Employees]

select * from employers
order by DepartmentName asc

select *
from employers
order by case
		when DepartmentName = 'IT' then 1
		else 0
	end desc, Salary desc

-- 5. IFF

--IFF(boolean_expression, true_value, false_value)

select IIF(13 > 8, 'yes', 'no')
select IIF(13 = 8, 'yes', 'no')


select IIF(13 = 8, 'yes', IIF(13 = 10, 'Final yes', 'unfortunately'))

select * from employers
order by IIF(departmentName = 'IT', 1, 0) desc, Salary desc


-- 6. IF

if 10 > 2 select 'London'
else select 'UNITED'

declare @StudentMark int = 4

if @StudentMark >= 90
	select 'congratulation'
else if @StudentMark >= 60
	select 'pass'
else 
	select 'you failed'



declare @StudentMark int = 4

if @StudentMark >= 90
	insert number1 values (@StudentMark)
else if @StudentMark >= 60
	select 'pass'
else 
	select 'you failed'


-- 7.

--while condition
--	begin
--		statement
--	end

declare @countNumber int = 1

while @countNumber <= 10
	BEGIN
		Select @countNumber
		insert into number1 values (@countNumber)
		set @countNumber = @countNumber + 1
	END
	
select * from number1

-- endless
declare @countNumber int = 1

while @countNumber <= 10
	BEGIN
		Select @countNumber
	END
	
select * from number1




declare @countNumber int = 12

while @countNumber <= 20 and @countNumber >= 10
	BEGIN
		insert into number1 values (@countNumber)
		set @countNumber = @countNumber + 1
	END
	
select * from number1



create database F24_class2

use F24_class2

--DDL
--create

--creating database, table, schema, temp table, stored procedure, function and so on.

create database testdatabase
create table TestTable (id int, uniid int)
create schema TestSchema

--temp table
-- LOCAL
create table #TestTempTable (id int, uniid int)
SELECT * FROM #TestTempTable

-- GLOABAL
create table ##TestTempTableG (id int, uniid int)
SELECT * FROM ##TestTempTableG

INSERT INTO #TestTempTable VALUES (1,2)

-- STORED PROCEDURE

CREATE PROCEDURE SELECT_ALL_EMP_AGAIN
AS
BEGIN 
		CREATE TABLE #TempEmp (uuid int)
		INSERT INTO #TempEmp SELECT id FROM [f24_class11].[dbo].[Salaries info]
		SELECT * FROM #TempEmp
		
END

DROP PROCEDURE SELECT_ALL_EMP_AGAIN

SELECT_ALL_EMP_AGAIN


create function Currentyear
returns int
as
begin
	select YEAR(getdate())
end

-- ALTER
SELECT * INTO EMPLOYEE FROM [F24_class].[dbo].[employees]

select * from EMPLOYEE

ALTER TABLE EMPLOYEE
ADD YEARS INT

ALTER TABLE EMPLOYEE
DROP COLUMN YEARS

ALTER TABLE EMPLOYEE
ALTER COLUMN salary varchar(50)

ALTER TABLE EMPLOYEE
ALTER COLUMN salary int

select SUM(salary) AS SUM_OF_SALARY from EMPLOYEE

-- DROP, TRUNCATE
SELECT * FROM EMPLOYEE

BEGIN TRANSACTION
	TRUNCATE TABLE EMPLOYEE

ROLLBACK TRANSACTION


BEGIN TRAN
	DELETE FROM EMPLOYEE

ROLLBACK TRAN

BEGIN TRAN
drop table EMPLOYEE

ROLLBACK TRAN

-- DML: INSERT UPDATE DELETE
--DIFFERENT WAYS OF INSERTING

INSERT INTO EMPLOYEE VALUES (8, 'Micah', 32, 1800, 'Rat')
INSERT INTO EMPLOYEE VALUES (9, 'Lunny', 19, 100, null)
INSERT INTO EMPLOYEE(id, name) VALUES (10, 'Hosea')

insert into EMPLOYEE  values (11, 'Ritchard', 8, 1200, 'Sales'), (12, 'Morgan', 28, 300, 'HR')

SELECT * FROM EMPLOYEE

SELECT * INTO COPY_EMPOYEE FROM EMPLOYEE

SELECT * FROM COPY_EMPOYEE

SELECT name INTO NAME_EMPOYEE FROM COPY_EMPOYEE

SELECT * FROM NAME_EMPOYEE

INSERT INTO EMPLOYEE
SELECT 13, 'Eddie', 20, 1800, 'Rempage'
union
SELECT 14, 'Sam', 20, 190, 'Sales'

SELECT * FROM EMPLOYEE





use F24_project

select * from graph_table

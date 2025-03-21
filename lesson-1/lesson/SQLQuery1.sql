-- 1. DQL DATA QUERY LANGUAGE

SELECT 1+2
SELECT 1+2*5-13/5
SELECT 'HELLO WORLD'

-- SELECT COLUMNNAME FROM TABLENAME

use F24_class

SELECT * FROM salesmen
SELECT Name, age FROM salesmen


SELECT @@CPU_BUSY
SELECT GETDATE()

-- 2. DDL - DATA DEFINITION LANGUAGE

--CREATE
--ALTER
--DROP
--TRUNCATE

CREATE DATABASE LESSON1

USE LESSON1

CREATE TABLE STUDENTS (ID INT, FIRSTNAME VARCHAR(20))

-- SCHEMA
CREATE SCHEMA IT

CREATE TABLE IT.STUDENTS(ID INT, FIRSTNAME VARCHAR(20))
CREATE TABLE "HR.STUDENTS"(ID INT, FIRSTNAME VARCHAR(20))

CREATE TABLE [FINANCE.STUDENTS](ID INT, FIRSTNAME VARCHAR(20))
CREATE TABLE [FINANCE STUDENTS](ID INT, FIRSTNAME VARCHAR(20))

ALTER TABLE STUDENTS
ADD AGE INT

SELECT ID, AGE, FIRSTNAME FROM STUDENTS

ALTER TABLE STUDENTS
ALTER COLUMN AGE VARCHAR(10)

-- drop
DROP DATABASE f24_class11

use LESSON1

drop table STUDENTS

CREATE SCHEMA NEWTEST

drop schema IT

--TRUNCATE

TRUNCATE TABLE STUDENTS

CREATE TABLE STUDENTS (ID INT, FIRSTNAME VARCHAR(20))


-- DML - DATA MANIMULATION LANGUAGE --


-- INSERT
INSERT INTO STUDENTS VALUES (1, 'JOHN')
INSERT STUDENTS VALUES (2, 'ARTHUR')


SELECT * FROM STUDENTS

INSERT INTO STUDENTS VALUES (3, 'MICAH'), (4, 'DUTCH')

SELECT * INTO STUDENTS_COPY FROM STUDENTS

DROP TABLE STUDENTS

--UPDATE
SELECT * FROM STUDENTS_COPY

UPDATE STUDENTS_COPY
SET FIRSTNAME = 'DUTCHY'
WHERE ID = 4

--DELETE
--DELETE --ROW BY ROW
DELETE FROM STUDENTS_COPY
WHERE ID = 4


-- HOME WORK
--TRUNCATE VS DELETE (WITHOUT WHERE CLAUSE)

DELETE STUDENTS_COPY
TRUNCATE STUDENTS_COPY

-- DCL - DATA CONTROL LANGUAGE
--GRANT
--REVOKE 20 LESSON AROUND

-- TCL -- TRANSACTION CONTROL LANGUAGE

-- BEGIN, ROLLBACK, COMMIT

SELECT * FROM STUDENTS_COPY

BEGIN TRAN
INSERT INTO STUDENTS_COPY VALUES (4, 'SAM')

ROLLBACK TRAN


BEGIN TRANSACTION
CREATE TABLE TEST(ID INT)

BEGIN TRANSACTION
CREATE TABLE TEST1(ID INT)

ROLLBACK TRANSACTION

COMMIT TRANSACTION

SELECT * FROM TEST
SELECT * FROM TEST1



-- EASY

-- 1.
-- Data: Raw facts or info like names or numbers
-- Database: place to store and organize data
-- Relational Database: type of database that stores data in tables linked to each other
-- Table: Like spreadsheet with rows and columns where data is stay

-- 2. 
-- Fast performance
-- Good for small or big projects
-- Supports stored procedures 
-- Backup and restore options
-- Secure data protection

-- 3.
-- Open SSMS, it shows dialog for connecting
-- you need to choose you need to choose 
-- server type like Database engine, choose or write
-- server name, Authentication like Windows authentication
-- final you need to check the 
-- checkbox which is for trust server certificate
-- rest fields optional in this case, in final
-- click connect button to connect

-- Medium

-- 4. 
CREATE DATABASE SchoolDB

-- 5.
USE SchoolDB

CREATE TABLE StudentID(ID INT PRIMARY KEY, Name VARCHAR(50), AGE INT)

-- 6.
-- For this question I want to answer with exapmle human body

-- SQL Server: brain. store and processes data
-- SSMS: hands and eyes. lets you work with the server easily
-- SQL: language. use to give instructions

-- Hard

-- 7.

-- 1. DQL Data Query Language
-- Gets data from the database.
-- Main command: SELECT

-- 2. DML Data Manipulation Language
-- Adds, updates, or deletes data in the tables.
-- Commands: INSERT, UPDATE, DELETE

-- 3. DDL Data Definition Language
-- Creates or changes the structure of tables.
-- Commands: CREATE, ALTER, DROP, TRUNCATE

-- 4. DCL - Data Control Language
-- Controls who can access the data
-- Commands: GRANT, REVOKE

-- 5. TCL - Transaction Control Language
-- Manages transactions save or undo changes
-- Commands: COMMIT, ROLLBACK


-- 8.

INSERT INTO StudentID VALUES (1, 'JOHN', 20)
INSERT INTO StudentID VALUES (2, 'ARTHUR', 22)
INSERT INTO StudentID VALUES (3, 'MICAH', 24)

SELECT * FROM StudentID

-- 9
-- I created Backup folder for creating
BACKUP DATABASE SchoolDB
TO DISK = 'C:\Backup\SchoolDB.bak';

RESTORE DATABASE SchoolDB
FROM DISK = 'C:\Backup\SchoolDB.bak'
WITH REPLACE;

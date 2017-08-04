-- All instructions was executed in Microsoft SQL Server Management Studio
-- Start creating a new database 
CREATE DATABASE purchasing_control;

-- set what the database you use
USE purchasing_control;

-- create table purchases
CREATE TABLE purchases(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	value DECIMAL(12,2) NULL,
	purchase_date DATE NULL,
	observations NVARCHAR (200) NULL,
	received BIT
);

-- Observations:
-- nvarchar -> column type of text in SQL Server, similar with varchar2 in oracle

-- If you want to see the description of purchases table, or in other table, execute:
-- sp_help purchases;

-- test insert, execute:
INSERT INTO purchases (value, purchase_date, observations, received)
VALUES (200.0, '2017-08-04', 'Material de Escritório', 1);

-- after
SELECT observations, value FROM purchases;
SELECT * FROM purchases;

-- Ok, stop here! Before to continue, populate the purchases table with: "class_1-populate_table.sql"

-- 1. Select observations and values in purchases that purchase_date greater or equal than 15/12/2008
SELECT observations, value FROM purchases WHERE purchase_date >= '2008-12-15'; -- or purchase_date >= '15-12-2008'

-- 2. Repeat last exercise, but show and order result by date
SELECT observations, value, purchase_date FROM purchases WHERE purchase_date >= '2008-12-15' ORDER BY purchase_date ASC;

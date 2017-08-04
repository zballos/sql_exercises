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
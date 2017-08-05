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

-- 3. Select all purchases that value between 100 and 1000
SELECT observations, value, purchase_date FROM purchases WHERE value BETWEEN 100 AND 1000 ORDER BY purchase_date ASC;
-- other form
SELECT observations, value, purchase_date FROM purchases WHERE value >= 100 AND value <= 1000 ORDER BY purchase_date ASC;

-- 4. Select all purchases between 01/01/2009 and 01/01/2010
SELECT * FROM purchases WHERE purchase_date BETWEEN '2009-01-01' AND '2010-01-01'; 

-- 5. Select purchases that value greater than 15 and less than 35, and observations starts with LANCHONETE
SELECT * FROM purchases WHERE value >= 15 AND value <= 35 AND observations LIKE 'LANCHONETE%';

-- 6. Select all received purchases
SELECT * FROM purchases WHERE received = 1;
-- or
SELECT * FROM purchases WHERE received = 'TRUE';

-- 7. Greater than 5000 or received
SELECT * FROM purchases WHERE received = 'TRUE' OR value >= 5000.0;

-- 8. Greater than 1000 and less than 3000 OR greater than 5000.
SELECT * FROM purchases WHERE (value >= 1000 OR value <= 3000) OR value >= 5000.0;
-- All instructions was executed in Microsoft SQL Server Management Studio
-- Start creating a new database 
create database purchasing_control;

-- set what the database you use
use purchasing_control;

-- create table purchases
create table purchases(
	id int identity primary key not null,
	value decimal (12,2),
	purchase_date date,
	observations nvarchar (200),
	received bit
);

-- If you want to see the description of purchases table, or in other table, execute:
-- sp_help purchases;
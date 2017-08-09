-- ALTER TABLE, FOREIGN KEYS AND JOINs

-- 1. Create table buyers for a ligation with purchases
CREATE TABLE buyers(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	name NVARCHAR(200) NOT NULL,
	address NVARCHAR(100) NULL,
	telephone NVARCHAR(30) NULL
);

-- 2. Insert column for id buyers associated with purchases
ALTER TABLE purchases ADD buyer_id INT NULL;
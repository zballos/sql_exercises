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

-- 3. Create new buyers
INSERT INTO buyers VALUES ('João da Silva', 'Rua 123', '');
INSERT INTO buyers VALUES ('Marc Zuk', 'Facebook Street', '');
INSERT INTO buyers VALUES ('Dave Jones', 'Don Juan Avenue', '123456789');

-- 4. Distribute purchases between buyers
UPDATE purchases SET buyer_id = 1 WHERE id < 25;
UPDATE purchases SET buyer_id = 2 WHERE id > 25;
UPDATE purchases SET buyer_id = 3 WHERE id = 25;

-- 5. Add foreign key
ALTER TABLE purchases 
ADD CONSTRAINT FK_Purchases_Buyers_ID 
FOREIGN KEY (buyer_id)
REFERENCES buyers (id);
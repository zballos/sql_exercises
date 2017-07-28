-- Exercise 3: Commands with tables

-- Obs. A: for descrive a specific table, use the commands desc or describe, for exemple:
DESCRIBE finances;
DESC finances;

-- NOTE: Only property ID is not null, it's wrong! Let's do some testing...

-- 1. Insert new finance with description is null
INSERT INTO finances (id, value, my_date, observation, received) VALUES (id_seq.nextval, 541.5, '27-JUL-2017', '', '1');

-- Obs. B: Use the command 'IS NULL' to find elements with value is null, for exemple:
SELECT * FROM finances WHERE observation IS NULL;

-- 2. Delete from finances all registers that have observation value equal 'NULL'
DELETE FROM finances WHERE observation IS NULL;

-- NOTE: Have a observation accepting value NULL is horrible! We will change with ALTER TABLE, so...
-- 3. Alter the finances table for the observation not receive null values.
ALTER TABLE finances MODIFY (observation VARCHAR2 (30) NOT NULL);

-- 4. Alter the finances table for that the 'received' be zero by default, after, insert new finances without received value.
ALTER TABLE finances MODIFY (received char default '0' check (received in (0, 1)));
INSERT INTO finances (id, value, my_date, observation) VALUES (id_seq.nextval, 15.5, '27-JUL-2017', 'new finance');

-- NOTE: We need to inform the type of payment. The command 'ADD' serves for to create new column in table
-- 5. Add column 'payment_type' in table finances, and check if is 'BILLET', 'MONEY' or 'CARD'. After, insert new finance.
ALTER TABLE finances ADD (payment_type VARCHAR2(10) check (payment_type in ('BILLET', 'MONEY', 'CARD')));
INSERT INTO finances (id, value, my_date, observation, payment_type) VALUES (id_seq.nextval, 15.5, '27-JUL-2017', 'new finance with payment_type', 'BILLET');

-- 6. Update all finances that have payment_type is null, set value 'MONEY'
UPDATE finances SET payment_type = 'MONEY' WHERE payment_type IS NULL;

-- 7. Rename column my_date to payment_date
ALTER TABLE finances RENAME COLUMN my_date TO payment_date;

-- Table updated
/*
	CREATE TABLE finances (
		id NUMBER PRIMARY KEY,
		value NUMBER,
		payment_date DATE,
		observation VARCHAR2(30) NOT NULL,
		received CHAR DEFAULT '0' CHECK (received IN (0, 1)),
		payment_type VARCHAR2(10) CHECK (payment_type IN ('BILLET', 'MONEY', 'CARD'))
	);
*/
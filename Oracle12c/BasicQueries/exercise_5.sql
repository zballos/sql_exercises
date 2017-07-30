-- Exercise 5: News features, new table, relationships.

-- 1. Create new table for buyers
CREATE TABLE buyers (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(40) NOT NULL,
	address VARCHAR2(50) NOT NULL,
	telephone VARCHAR2(20) NOT NULL
);

-- 2. Create the sequence for table buyers
CREATE SEQUENCE id_buyers_seq;

-- 3. Insert three buyers 
INSERT INTO buyers (id, name, address, telephone) VALUES (id_buyers_seq.nextval, 'Albert', 'batcavern', '(55) 8181-9901');
INSERT INTO buyers (id, name, address, telephone) VALUES (id_buyers_seq.nextval, 'Bruce Wayne', 'batcavern', '(55) 8181-9901');
INSERT INTO buyers (id, name, address, telephone) VALUES (id_buyers_seq.nextval, 'Thomas Wayne', 'batcavern', '(55) 8181-9901');

-- NOTE: In prompt command, thare are a crash in the table buyers because the size is minimal. If you want change, use the command:
SET LINESIZE 150; 

-- Well, now we need connect the table finances with the table buyers. Ready go!
-- 4. Create a new column in table finances, with name 'buyer_id'
ALTER TABLE finances ADD (buyer_id NUMBER); 

-- 5. Set all finances with id less than 140 for the buyer 'Albert'
UPDATE finances SET buyer_id = 1 WHERE id < 150;

-- 6. Set all finances with id greater than or equals 150 for buyer 'Bruce Wayne'
UPDATE finances SET buyer_id = 2 WHERE id >= 150;

-- NOTE: The JOIN command is used to join two tables with a given ID in each table.
-- 7. Select observation, value, payment_date and name in table finances and buyers
SELECT observation, value, payment_date, name
FROM finances 
JOIN buyers ON (buyers.id = finances.buyer_id);

-- 8. Configure a foreign key in table finances
ALTER TABLE finances ADD FOREIGN KEY (buyer_id) REFERENCES buyers(id);

-- REVISION
-- 9. Shows name and value of finances before 08/03/2017
SELECT name, value 
FROM finances JOIN buyers ON buyers.id = finances.buyer_id
WHERE payment_date <= '08-ABR-2017';

-- 10. Show all finances that buyer id is 1
SELECT * FROM finances WHERE buyer_id = 1;
SELECT * FROM finances JOIN buyers ON buyers.id = finances.buyer_id WHERE buyers.id = 1;

-- 11. Show finances that contains name 'Wayne' in buyers
SELECT finances.*
FROM finances JOIN buyers ON buyers.id = finances.buyer_id
WHERE buyers.name LIKE '%Wayne%';

-- 12. Show only name and value total of all buyers
SELECT name, SUM(value) as TOTAL
FROM finances JOIN buyers ON buyers.id = finances.buyer_id
GROUP BY buyers.name ; 
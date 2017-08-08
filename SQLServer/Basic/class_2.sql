-- SELECT WITH BETWEEN; UPDATE and DELETE

-- 1. 
SELECT * FROM purchases;

-- 2. Show purchases with date between 01/05/2009 and 01/08/2009 and value greater than 50 and less than 500
SELECT * FROM purchases
WHERE purchase_date BETWEEN '2009-05-01' AND '2009-08-01'
AND value >= 50 AND value <= 500;

-- OR
SELECT * FROM purchases
WHERE purchase_date BETWEEN '2009-05-01' AND '2009-08-01'
AND value BETWEEN 50 AND 500;  

-- 3. Update purchases sum 15,00 in results before 10/10/2010
SELECT * FROM purchases WHERE purchase_date <= '2010-10-10';

UPDATE purchases SET value = value + 15.0 WHERE purchase_date <= '2010-10-10';

-- 4. Update observations and received when date between 01/07/2009 and 01/07/2010
UPDATE purchases
SET observations = 'entregue antes de 2011', received = 'TRUE'
WHERE purchase_date BETWEEN '2009-07-01' AND '2010-07-01'; 

-- 5. Delete purchases between 6/04/2009 and 29/04/2009
DELETE FROM purchases WHERE purchase_date BETWEEN '2009-04-06' AND '2009-04-29';

-- 6. Select all purchases that value different of 200
SELECT * FROM purchases WHERE NOT value = 200; 
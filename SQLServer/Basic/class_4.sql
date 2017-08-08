-- SUM, AVG, COUNT, MONTH, YEAR...

-- 1. Sum total value of purchases
SELECT SUM(value) AS total FROM purchases; 

-- 2. Sum total value of purchases and group by received
SELECT received, SUM(value) AS total FROM purchases GROUP BY received; 

-- 3. Sum total value of purchases, only date before 10/09/2009 and group by received
SELECT received, SUM(value) AS total 
FROM purchases 
WHERE purchase_date <= '2009-09-10'
GROUP BY received; 

-- 4. Count total of purchases, group by received
SELECT received, COUNT(1) AS amount
FROM purchases
GROUP BY received;

-- 5. Count total amount and value of purchases, and group to received, month and year
SELECT YEAR(purchase_date) AS year, MONTH(purchase_date) AS month, received, COUNT(1) AS amount, SUM(value) as total
FROM purchases
GROUP BY YEAR(purchase_date), MONTH(purchase_date), received;

-- 6. Show average all purchases
SELECT AVG(value) AS average FROM purchases;
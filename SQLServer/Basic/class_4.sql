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

-- 4. 
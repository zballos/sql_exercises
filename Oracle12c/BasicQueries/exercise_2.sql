-- Exercise 2: I continue using the last table 'finances'.

-- 1. Select values in specific interval of values
SELECT * FROM finances WHERE value >= 500 AND value <= 1500;

-- 2. Repeat using between
SELECT * FROM finances WHERE value BETWEEN 500 AND 1500;

-- 3. Filter using between, but with interval of dates
SELECT * FROM finances WHERE my_date BETWEEN '10-JAN-2017' AND '10-JUN-2017';

-- 4. Repeat last exercise, ordering the result for date
SELECT * FROM finances WHERE my_date BETWEEN '10-JAN-2017' AND '10-JUN-2017' ORDER BY my_date ASC;

-- 5. Update all observations when date < JAN/2016
UPDATE finances SET observation = 'OLD COUNTS, IGNORE!' WHERE my_date < '01-JAN-2016';

-- 6. Now, update all observations that not between JUN/2015 until OCT/2017
UPDATE finances SET observation = 'specific values' WHERE my_date NOT BETWEEN '01-JUN-2015' AND '01-OUT-2017';

-- 7. Update finances in specific dates
UPDATE finances SET observation = 'in holidays' WHERE my_date IN ('13-JUN-2017', '07-SET-2016', '31-DEZ-2015'); 

-- 8. Delete one register with date equal 02-FEV-2015
DELETE FROM finances WHERE my_date < '20-FEV-2015';

-- 9. Update purchases when date equals 12/06/2017;
UPDATE finances set observation = 'purchases in VALENTINE´s DAY' WHERE my_date = '12-JUN-2017';

-- 10. Update all finances, sum actual value + 10 only when date is less that 01/01/2016
UPDATE finances SET value = value + 10 WHERE my_date < '01-JAN-2016'; 

-- 11. Update all finances that date between 01/07/2015 and 01/07/2016, with observation and received true.
UPDATE finances SET observation = 'payed before 2017', received = '1' WHERE my_date BETWEEN '01-SET-2015' AND '01-SET-2016';

-- 12. Delete all finances that date between 02/03/2016 until 20/03/2016
DELETE FROM finances WHERE my_date BETWEEN '02-MAR-2016' AND '20-MAR-2016';

-- 13. Show all finances that value not equals 98,00
SELECT * FROM finances WHERE NOT value = 98; 
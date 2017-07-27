# Exercise 2: I continue using the last table 'finances'.

# 1. Select values in specific interval of values
SELECT * FROM finances WHERE value >= 500 AND value <= 1500;

# 2. Repeat using between
SELECT * FROM finances WHERE value BETWEEN 500 AND 1500;

# 3. Filter using between, but with interval of dates
SELECT * FROM finances WHERE my_date BETWEEN '10-JAN-2017' AND '10-JUN-2017';

# 4. Repeat last exercise, ordering the result for date
SELECT * FROM finances WHERE my_date BETWEEN '10-JAN-2017' AND '10-JUN-2017' ORDER BY my_date ASC;

# 5. Update all observations when date < JAN/2016
UPDATE finances SET observation = 'OLD COUNTS, IGNORE!' WHERE my_date < '01-JAN-2016';

# 6. Now, update all observations that not between JUN/2015 until OCT/2017
UPDATE finances SET observation = 'specific values' WHERE my_date NOT BETWEEN '01-JUN-2015' AND '01-OUT-2017';  
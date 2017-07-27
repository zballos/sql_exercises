# Exercise 4: Functions

# 1. Sum all values in finances
SELECT SUM(value) FROM finances;

# NOTE: If i want know the average of all values? In this case, use the function 'AVG()'
# 2. Return the average of all values in finances
SELECT AVG(value) FROM finances;

# 3. Count tha amount of finances in 2017
SELECT COUNT(value) FROM finances WHERE payment_date BETWEEN '01-JAN-2017' AND '31-DEZ-2017';

# 4. Calcule the total and average value of all finances
SELECT SUM(value) AS TOTAL, AVG(value) AS AVERAGE FROM finances;

# 5. Calcule and show the total values by received
SELECT received, SUM(value) as TOTAL FROM finances GROUP BY received;

# NOTE: The function EXTRACT serves for to extract one element in one value, for example, type date.
# 6. Sum the total of values by year
SELECT EXTRACT(YEAR FROM payment_date), SUM(value) FROM finances GROUP BY EXTRACT(YEAR FROM payment_date);

# 7. Now, improve the before exercise and order by year
SELECT EXTRACT(YEAR FROM payment_date) AS PAYMENT_YEAR, SUM(value) AS TOTAL
FROM finances
GROUP BY EXTRACT(YEAR FROM payment_date)
ORDER BY PAYMENT_YEAR;
# Exercise 4: Functions

# 1. Sum all values in finances
SELECT SUM(value) FROM finances;

# NOTE: If i want know the average of all values? In this case, use the function 'AVG()'
# 2. Return the average of all values in finances
SELECT AVG(value) FROM finances;

# 3. Count the amount of finances in 2017
SELECT COUNT(value) FROM finances WHERE payment_date BETWEEN '01-JAN-2017' AND '31-DEZ-2017';

# 4. Calculate the total and average value of all finances
SELECT SUM(value) AS TOTAL, AVG(value) AS AVERAGE FROM finances;

# 5. Calculate and show the total values by received
SELECT received, SUM(value) as TOTAL FROM finances GROUP BY received;

# NOTE: The EXTRACT function is for extracting an element from a date, into date type columns
# 6. Sum the total of values by year
SELECT EXTRACT(YEAR FROM payment_date), SUM(value) FROM finances GROUP BY EXTRACT(YEAR FROM payment_date);

# 7. Now, improve the before exercise and order by year
SELECT EXTRACT(YEAR FROM payment_date) AS PAYMENT_YEAR, SUM(value) AS TOTAL
	FROM finances
	GROUP BY EXTRACT(YEAR FROM payment_date)
	ORDER BY PAYMENT_YEAR;

# REVISION
# 8. Calculate the average of all finances, the date is less of 12/04/2017
SELECT AVG(value) AS AVERAGE FROM finances WHERE payment_date <= '12-ABR-2017';

# 9. Sum all values before 10/07/2016 and group by payment type
SELECT payment_type, SUM(value) AS TOTAL 
	FROM finances 
	WHERE payment_date <= '10-JUL-2016' 
	GROUP BY payment_type; 

# 10. Calculate the total of finances received with date less 12/01/2017
SELECT COUNT(id) AS TOTAL FROM finances WHERE payment_date < '12-JAN-2017' AND received = '1';

# 11. Show total of all values group by received and payment type
SELECT received, payment_type, SUM(value) AS TOTAL FROM finances GROUP BY received, payment_type;
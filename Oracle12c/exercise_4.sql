# Exercise 4: Functions

# 1. Sum all values in finances
SELECT SUM(value) FROM finances;

# NOTE: If i want know the average of all values? In this case, use the function 'AVG()'
# 2. Return the average of all values in finances
SELECT AVG(value) FROM finances;

# 3. Count tha amount of finances in 2017
SELECT COUNT(value) FROM finances WHERE payment_date BETWEEN '01-JAN-2017' AND '31-DEZ-2017';
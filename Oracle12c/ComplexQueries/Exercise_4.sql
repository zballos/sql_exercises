-- Exercise 4: DISTINCT and more about IN

DESC employees;

-- 1. Select employees by age
SELECT DISTINCT age FROM employees;

-- 2. Select employees by role
SELECT DISTINCT role_id FROM employees;

-- 3. Select name and age of everyone employees that ages are 20, 25 or 30 years old
SELECT name, age
FROM employees
WHERE age in (20, 25, 30)
ORDER BY age ASC;

-- 4. Remenber, show the amount of employees
SELECT COUNT(e.id) as amount
FROM employees e;

-- 5. Show amount of employees by company
SELECT c.name, COUNT(e.id) as amount
FROM companies c
JOIN employees e ON (e.company_id = c.id)
GROUP BY c.name 
ORDER BY c.name ASC;

-- 6. Show all employees that your role is Intern
-- First: identify the intern id in table roles
SELECT * FROM roles;

-- So, the intern id is 10. Continue
SELECT e.name AS employee, r.name AS role, r.salary
FROM employees e
JOIN roles r ON (r.id = e.role_id)
WHERE r.id = 10;
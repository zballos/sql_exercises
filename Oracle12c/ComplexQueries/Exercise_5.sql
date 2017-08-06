-- Exercise 5 : sub-queries

-- 1. Show all employees, salary and the difference of average salaries of the company with id = 1
-- A.
SELECT * FROM roles;
SELECT * FROM companies;
SELECT * FROM employees;

-- B.
SELECT e.name, r.salary 
FROM employees e
JOIN roles r ON (r.id = e.role_id)
GROUP BY e.name, r.salary;

-- C.
SELECT c.name, AVG(r.salary) as salary
FROM companies c 
JOIN employees e ON (e.company_id = c.id)
JOIN roles r ON (r.id = e.role_id)
GROUP BY c.name; 

-- D.
SELECT 
    e.name as employee,
    r.salary,
    (r.salary - 
        (
            SELECT AVG(roles.salary) as average
            FROM roles 
            JOIN employees emp ON (emp.role_id = roles.id)
            JOIN companies ON (companies.id = emp.company_id)
        ) 
    ) as diference
FROM employees e
JOIN roles r ON (r.id = e.role_id)
WHERE e.company_id = 1
GROUP BY e.name, r.salary;
-- Exercise 6: JOIN, LEFT JOIN and RIGHT JOIN

-- 1. JOIN
SELECT e.name AS employee, b.name as benefit, eb.benefit_value
FROM employees e
JOIN employees_benefits eb ON (eb.employee_id = e.id)
JOIN benefits b ON (eb.benefit_id = b.id)
GROUP BY e.name, b.name, eb.benefit_value;

-- 2. Insert new employee
DESC employees;

INSERT INTO employees (id, name, age, role_id, company_id)
VALUES (id_employees_seq.nextval, 'Jones Robert', 31, 9, 3);

-- 3. Select all employees using LEFT JOIN
SELECT e.name AS employee, b.name as benefit, eb.benefit_value
FROM employees e
LEFT JOIN employees_benefits eb ON (eb.employee_id = e.id)
LEFT JOIN benefits b ON (eb.benefit_id = b.id)
GROUP BY e.name, b.name, eb.benefit_value;

-- 4. Show all using RIGHT JOIN from the benefits table
SELECT e.name AS employee, b.name as benefit, eb.benefit_value
FROM benefits b
RIGHT JOIN employees_benefits eb ON (eb.benefit_id = b.id)
RIGHT JOIN employees e ON (eb.employee_id = e.id)
GROUP BY e.name, b.name, eb.benefit_value
ORDER BY e.name ASC;

-- 5. Select all employees using LEFT JOIN when benefit id = 1 (Overtime)
SELECT e.name AS employee, b.name as benefit, eb.benefit_value
FROM employees e
LEFT JOIN employees_benefits eb ON (eb.employee_id = e.id)
LEFT JOIN benefits b ON (eb.benefit_id = b.id) AND b.id = 1
GROUP BY e.name, b.name, eb.benefit_value;
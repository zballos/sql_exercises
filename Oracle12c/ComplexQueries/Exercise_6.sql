-- Exercise 6: JOIN, LEFT JOIN and RIGHT JOIN

-- 1. JOIN
SELECT e.name AS employee, b.name as benefit, eb.benefit_value
FROM employees e
JOIN employees_benefits eb ON (eb.employee_id = e.id)
JOIN benefits b ON (eb.benefit_id = b.id)
GROUP BY e.name, b.name, eb.benefit_value;
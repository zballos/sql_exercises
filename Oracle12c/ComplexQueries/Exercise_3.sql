-- Exercise 3: HAVING and agregations
-- Use HAVING for to filter groupement results, for example, the result of aggregate function. AVG(), COUNT(), SUM()...

-- NOTE: The difference between HAVING and WHERE is:
-- WHERE is used, basically, before the groupement, and;
-- HAVING is used after the groupement, in aggregate functions.

-- 1. Show the average of benefits of all employees when average less 258,00.
select e.name as employee, b.name as benefit, avg(eb.benefit_value) as average
    from employees e
    join employees_benefits eb on (eb.employee_id = e.id)
    join benefits b on (b.id = eb.benefit_id)
 group by e.name, b.name
 having avg(eb.benefit_value) < 258.0;

-- 2. Show the companies that have greater than 3 employees.
select c.name, count(e.id) as amount
    from companies c
    join employees e on (e.company_id = c.id)
group by c.name
having count(e.id) > 3;

-- 3. Show the employee name and total value of benefits received, only when the total is greater than 420,00.
select e.name as employee, b.name as benefit, avg(eb.benefit_value) as average
    from employees e
    join employees_benefits eb on (eb.employee_id = e.id)
    join benefits b on (b.id = eb.benefit_id)
group by e.name, b.name
having avg(eb.benefit_value) > 420.0;

-- 4. Repeat the last exercise including the amount of benefits.
select e.name as employee, b.name as benefit, count(eb.id) as amount, avg(eb.benefit_value) as average
    from employees e
    join employees_benefits eb on (eb.employee_id = e.id)
    join benefits b on (b.id = eb.benefit_id)
group by e.name, b.name
having avg(eb.benefit_value) > 420.0;

-- 5. Show the employee name and total value of benefits received, only when the total is less than 350,00 and amount of benefits greater than 2.
select e.name as employee, b.name as benefit, count(eb.id) as amount, avg(eb.benefit_value) as average
    from employees e
    join employees_benefits eb on (eb.employee_id = e.id)
    join benefits b on (b.id = eb.benefit_id)
group by e.name, b.name
having avg(eb.benefit_value) < 350.0 and count(eb.id) > 2;
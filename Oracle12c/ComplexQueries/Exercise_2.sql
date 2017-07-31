-- Exercise 2: Joins, group by, count...

-- Before all, remember the structure of tables using DESC:
DESC employees;
DESC roles;
DESC department;
DESC companies;
DESC benefits;
DESC employees_benefits;
DESC companies_departments;

-- 1. Show name and amount of employees by company
select c.name, count(e.id)
  from companies c
  join employees e on (e.company_id = c.id)
 group by c.name;

-- 2. Show name and amount of employees by department
select d.name, count(e.id)
    from departments d
    join roles r on (r.department_id = d.id)
    join employees e on (e.role_id = r.id)
 group by d.name;

-- 3. Show employee, benefit name and total value of benefits by employees in 2017
select e.name, b.name, sum(eb.benefit_value)
    from employees e
    join employees_benefits eb on (eb.employee_id = e.id)
    join benefits b on (b.id = eb.benefit_id)
 group by e.name, b.name;

-- 4. Show company name, amount and total value of benefits after JAN-2015
select c.name, count(eb.id) as amount, sum(eb.benefit_value) as total_value
    from employees e
    join companies c on (c.id = e.company_id)
    join employees_benefits eb on (eb.employee_id = e.id)
    join benefits b on (b.id = eb.benefit_id)
    where eb.received_date between '01-JAN-2017' and '31-DEZ-2017'
 group by c.name;

-- 5. Calculate the average of benefits of all employees
select c.name, avg(eb.benefit_value) as average_benefit
    from employees e
    join companies c on (c.id = e.company_id)
    join employees_benefits eb on (eb.employee_id = e.id)
    join benefits b on (b.id = eb.benefit_id)
group by c.name;

-- 6. Calculate the average of salaries by company
select c.name, avg(r.salary) as average_salary
    from companies c
    join employees e on (c.id = e.company_id)
    join roles r on (r.id = e.role_id)
group by c.name;

-- 7. Show all employees and ordered by name desc
select e.name, e.age
    from employees e
order by  e.name;

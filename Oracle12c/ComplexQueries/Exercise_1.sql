-- New functions and functionalities of Oracle
-- JOINs, EXISTS and NOT EXISTS

-- NOTE: We will work with tables new in next exercises, so, a complete database in file: Database_Exercise_1.sql
-- Execute before of to start: @DIRECTORY/Database_Exercise_1.sql

-- Do you remember how to show the language of dates?
show parameter nls_lang;

-- If we wanted to show all tables of the logged user?
select table_name from user_tables;

-- 1. Show all employees that exists in role = 1
select e.name
from employees e
where exists (
    select r.id
      from roles r
     where r.id = e.role_id and r.id = 1
);

-- 2. Show name and role of all employees
select e.name, r.name
  from employees e
  join roles r on (r.id = e.role_id);

-- 3. Show name, age and role of all employees, improve the names of columns and ordered by age
select e.name as employee, e.age as age, r.name as role
  from employees e
  join roles r on (r.id = e.role_id)
  order by e.age;

-- 4. Show name, role and salary of all employees
select e.name as employee, r.name as role, r.salary as salary
  from employees e
  join roles r on (r.id = e.role_id);

-- 5. Change the size of the names in the employee table to 50.
ALTER TABLE employees MODIFY (name VARCHAR2 (50));

-- 6. Show the date of two years, four months and 99 days ago
select sysdate - interval '2' year from dual;
select sysdate - interval '4' month from dual;
select sysdate - interval '99' days from dual;

-- 7. Show all employees with salaries, total of benefits and balance of january 2017. 
select e.id, e.name, r.salary, sum(b.benefit_value) as benefits, (sum(b.benefit_value) + r.salary) as total 
  from employees e
  join roles r on (r.id = e.role_id)
  left join employees_benefits b on (b.employee_id = e.id)
 where b.received_date between '01-JAN-2017' and '31-JAN-2017'
 group by e.id, e.name, r.salary;
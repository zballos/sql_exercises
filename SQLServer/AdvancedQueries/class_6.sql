-- LEFT JOIN and RIGHT JOIN

-- 1. left join
SELECT s.name, COUNT(a.id) AS answers 
FROM student s
LEFT JOIN answer a ON (a.student_id = s.id)
GROUP BY s.name;

SELECT s.name, COUNT(r.id) AS registrations
FROM student s
LEFT JOIN registration r ON (r.student_id = s.id)
GROUP BY s.name;

SELECT c.name, COUNT(r.id) AS registrations
FROM course c
LEFT JOIN registration r ON (r.course_id = c.id)
GROUP BY c.name;

-- 2. right join (This appears when one argument not exists in right table)
SELECT r.reg_type, COUNT(c.id) AS courses
FROM registration r
RIGHT JOIN course c ON (r.course_id = c.id)
GROUP BY r.reg_type;

-- 3. left join and subqueries
SELECT s.name, COUNT(a.id) AS answers 
FROM student s
LEFT JOIN answer a ON (a.student_id = s.id)
GROUP BY s.name;

SELECT s.name, (SELECT COUNT(a.id) FROM answer a WHERE a.student_id = s.id) AS answers  
FROM student s
ORDER BY s.name ASC;

-- 4. left join, group by and count with distinct
SELECT s.name, COUNT(DISTINCT a.id) AS answers, COUNT(DISTINCT r.id) AS registrations
FROM student s
LEFT JOIN answer a ON (a.student_id = s.id)
LEFT JOIN registration r ON (r.student_id = s.id)
GROUP BY s.name;
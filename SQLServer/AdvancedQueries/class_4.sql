-- DISTINCT and IN()

-- 1. Select all types of registration
SELECT DISTINCT reg_type FROM registration;

-- 2. show students in courses with id 1 and 2
SELECT s.name, c.name
FROM student s
JOIN registration r ON (r.student_id = s.id)
JOIN course c ON (r.course_id = c.id)
WHERE c.id IN (1, 2);

-- 3. show amount of questions by course
SELECT c.name, e.question, COUNT(a.id) AS amount
FROM exercise e
JOIN section s ON (s.id = e.section_id)
JOIN course c ON (s.course_id = c.id)
JOIN answer a ON (a.exercise_id = e.id)
WHERE c.id IN (1, 3)
group by c.name, e.question;
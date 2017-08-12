-- subqueries

-- 1. show student, courses, average note and difference between average and average of course
SELECT 
	st.name, 
	c.name, 
	(SELECT AVG(n.note) FROM note n) AS avg_courses,
	AVG(n.note) as avg_student, 
	AVG(n.note) - (SELECT AVG(n.note) FROM note n) as difference
FROM note n
JOIN answer a ON (a.id = n.answer_id)
JOIN exercise e ON (e.id = a.exercise_id)
JOIN section s ON (s.id = e.section_id)
JOIN course c ON (c.id = s.course_id)
JOIN student st ON (st.id = a.student_id)
GROUP BY st.name, c.name;

-- 2. Show all students, amount of registrations and amount of answers by student
SELECT s.name,
	(SELECT COUNT(r.id) FROM registration r WHERE r.student_id = s.id) AS amount_registrations,
	(SELECT COUNT(a.id) FROM answer a WHERE a.student_id = s.id) AS amount_answers
FROM student s; 

-- 3. Show students, amount of registrations and division between registrations by student and all registrations
SELECT s.name,
	COUNT(r.id),
	COUNT(r.id)/(SELECT COUNT(id) FROM registration) AS division
FROM student s
JOIN registration r ON (r.student_id = s.id)
GROUP BY s.name; 
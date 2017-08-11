-- HAVING

-- 1. Show students with average note greater than 6
SELECT st.name, c.name, AVG(n.note) as average
FROM note n
JOIN answer a ON (a.id = n.answer_id)
JOIN exercise e ON (e.id = a.exercise_id)
JOIN section s ON (s.id = e.section_id)
JOIN course c ON (c.id = s.course_id)
JOIN student st ON (st.id = a.student_id)
GROUP BY st.name, c.name
HAVING AVG(n.note) >= 6;

-- 2. Students with greater than 3 answers in exercises
SELECT s.name, e.question, COUNT(a.id) AS answers
FROM answer a
JOIN exercise e ON (e.id = a.exercise_id)
JOIN student s ON (s.id = a.student_id)
GROUP BY s.name, e.question
HAVING COUNT(a.id) > 3;

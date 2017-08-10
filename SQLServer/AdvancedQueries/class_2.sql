-- WHERE, GROUP BY, GROUP BY with WHERE, AVG() and COUNT()

-- 1. Show all tables (courses, students, registrations, sections, notes, exercises and answers)
SELECT * FROM course;
SELECT * FROM student;
SELECT * FROM registration;
SELECT * FROM section;
SELECT * FROM note;
SELECT * FROM exercise;
SELECT * FROM answer;

-- 2. Show average note by course
SELECT c.name, AVG(n.note) as average
FROM note n
JOIN answer a ON (a.id = n.answer_id)
JOIN exercise e ON (e.id = a.exercise_id)
JOIN section s ON (s.id = e.section_id)
JOIN course c ON (c.id = s.course_id)
GROUP BY c.name;

-- 3. Show amount of exercises by course
SELECT c.name, COUNT(e.id) AS amount
FROM exercise e
JOIN section s ON (s.id = e.section_id)
JOIN course c ON (c.id = s.course_id)
GROUP BY c.name;

-- 4. Show amount of students by course
SELECT c.name, COUNT(s.id) AS amount
FROM course c
JOIN registration r ON (r.course_id = c.id)
JOIN student s ON (s.id = r.student_id)
GROUP BY c.name;

-- 5. Show average note by course only student names contains 'Silva' or 'Santos'
SELECT c.name, AVG(n.note) as average
FROM note n
JOIN answer a ON (a.id = n.answer_id)
JOIN exercise e ON (e.id = a.exercise_id)
JOIN section s ON (s.id = e.section_id)
JOIN course c ON (c.id = s.course_id)
JOIN student st ON (st.id = a.student_id)
WHERE st.name LIKE '%Silva%' OR st.name LIKE '%Santos%'
GROUP BY c.name;

-- 6. Show amount of answers by exercise
SELECT e.question, COUNT(a.id) AS answers
FROM answer a
JOIN exercise e ON (e.id = a.exercise_id)
GROUP BY e.id, e.question;

-- 7. Order by COUNT the last exercise
SELECT e.question, COUNT(a.id) AS answers
FROM answer a
JOIN exercise e ON (e.id = a.exercise_id)
GROUP BY e.id, e.question
ORDER BY COUNT(a.id) DESC;

-- 8. Two elements in group by
SELECT st.name, c.name, AVG(n.note) as average
FROM note n
JOIN answer a ON (a.id = n.answer_id)
JOIN exercise e ON (e.id = a.exercise_id)
JOIN section s ON (s.id = e.section_id)
JOIN course c ON (c.id = s.course_id)
JOIN student st ON (st.id = a.student_id)
GROUP BY st.name, c.name;
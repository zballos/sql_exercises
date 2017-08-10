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


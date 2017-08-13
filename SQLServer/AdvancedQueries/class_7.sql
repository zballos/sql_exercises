-- TOP, OFFSET and FETCH ROWS

-- 1. Show all students
SELECT s.name
FROM student s
ORDER BY s.name;

-- 2. Show only five first students
SELECT TOP 5 s.name
FROM student s
ORDER BY s.name;

-- 3. Show all students after five before
SELECT s.name
FROM student s
ORDER BY s.name
OFFSET 5 ROWS;

-- 4. Now, only five after per page
SELECT s.name
FROM student s
ORDER BY s.name
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;
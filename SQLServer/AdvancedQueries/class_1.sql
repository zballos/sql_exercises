-- More about sql: New database and EXISTS

-- 1. Execute /sql_advanced.sql in SQLServer for continue

-- 2. Find all students who do not have any records in the courses
SELECT * FROM student s
WHERE NOT EXISTS (
    SELECT r.id FROM registration r WHERE r.student_id = s.id
);

-- or better
SELECT s.name, s.email FROM student s
WHERE NOT EXISTS (
    SELECT r.id FROM registration r WHERE r.student_id = s.id
)
ORDER BY s.name ASC;

-- 3. Show students that they have not registered for the past 45 days.
SELECT s.name, s.email
FROM student s
WHERE NOT EXISTS (
    SELECT r.id 
    FROM registration r
    WHERE r.student_id = s.id AND r.reg_date > DATEADD(DAY, -45, GETDATE())
)
ORDER BY s.name ASC;

/*
    Observations:
    DATEADD -> Internal function that return one smalldatetime;
    DAY -> part of date, return one day;
    GETDATE() -> Internal function, return actual datetime.
*/
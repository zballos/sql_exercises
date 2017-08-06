-- Exercise 7: ROWNUM

-- NOTE: Increase the page size
set pagesize 50;

-- 1. Show all employees ordered by name and number
SELECT ROWNUM, name FROM (
    SELECT e.name FROM employees e ORDER BY e.name
);

-- 2. Show only the 10 first employees
SELECT ROWNUM, name
FROM (
    SELECT e.name FROM employees e ORDER BY e.name
)
WHERE ROWNUM <= 10;

-- 3. If i want only employees between 10 and 20
SELECT * FROM (
    SELECT ROWNUM num, name
    FROM (
        SELECT e.name FROM employees e ORDER BY e.name
    )
    WHERE ROWNUM <= 20
)
WHERE num > 10;

-- 4. Now show only employees after rownum 20
SELECT * FROM (
    SELECT ROWNUM num, name
    FROM (
        SELECT e.name FROM employees e ORDER BY e.name
    )
)
WHERE num > 20;

-- 5. Show all employees that name starts with word 'M'
SELECT ROWNUM num, name
FROM (
    SELECT e.name FROM employees e WHERE e.name LIKE 'M%' ORDER BY e.name
);

-- 6. Show employees that age between 18 and 30 years old
SELECT ROWNUM num, name, age
FROM (
    SELECT e.name, e.age
    FROM employees e 
    WHERE e.age BETWEEN 18 AND 30
    ORDER BY e.name
);

-- 7. Show only 10 first employees that age between 18 and 30 years old
SELECT * FROM (
    SELECT ROWNUM num, name, age
    FROM (
        SELECT e.name, e.age
        FROM employees e 
        WHERE e.age BETWEEN 18 AND 30
        ORDER BY e.name
    )
)
WHERE num <= 10;
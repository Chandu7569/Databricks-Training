-- Select all columns from the Employee table.
SELECT * FROM Employee;

-- Select only the name and salary columns from the Employee table.
SELECT name, salary FROM Employee;

-- Select employees who are older than 30.
SELECT * FROM Employee WHERE age > 30;

-- Select the names of all departments.
SELECT name FROM Department;

-- Select employees who work in the IT department.
SELECT * FROM Employee 
WHERE department_id = (SELECT department_id FROM Department WHERE name = 'IT');

-- Select employees whose names start with 'J'.
SELECT * FROM Employee WHERE name LIKE 'J%';

-- Select employees whose names end with 'e'.
SELECT * FROM Employee WHERE name LIKE '%e';

-- Select employees whose names contain 'a'.
SELECT * FROM Employee WHERE name LIKE '%a%';

-- Select employees whose names are exactly 9 characters long.
SELECT * FROM Employee WHERE LENGTH(name) = 9;

-- Select employees whose names have 'o' as the second character.
SELECT * FROM Employee WHERE name LIKE '_o%';

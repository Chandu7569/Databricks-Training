-- 1. List all students along with their department names.
SELECT s.student_name, d.department_name
FROM students s
JOIN departments d
ON s.department_id = d.department_id;

-- 2. Display all staff members and their department names, including staff without departments.
SELECT st.staff_name, d.department_name
FROM staff st
LEFT JOIN departments d
ON st.department_id = d.department_id;

-- 3. Find all departments that currently have no students assigned.
SELECT d.department_name
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;

-- 4. Show students who do not have any marks recorded.
SELECT s.student_name
FROM students s
LEFT JOIN marks m
ON s.student_id = m.student_id
WHERE m.mark_id IS NULL;

-- 5. Display subjects that are not assigned to any staff member.
SELECT sub.subject_name
FROM subjects sub
LEFT JOIN staff_subjects ss
ON sub.subject_id = ss.subject_id
WHERE ss.staff_id IS NULL;

-- 6. Find the average CGPA department-wise.
SELECT d.department_name, AVG(s.cgpa) AS avg_cgpa
FROM students s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name;

-- 7. Display departments where the average CGPA is greater than 8.0.
SELECT d.department_name, AVG(s.cgpa) AS avg_cgpa
FROM students s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(s.cgpa) > 8.0;

-- 8. Find the total number of students in each department.
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_name;

-- 9. Display the highest and lowest marks scored in each subject.
SELECT sub.subject_name,
MAX(m.marks) AS highest_marks,
MIN(m.marks) AS lowest_marks
FROM marks m
JOIN subjects sub
ON m.subject_id = sub.subject_id
GROUP BY sub.subject_name;

-- 10. Find students who scored more than 90 in any exam.
SELECT DISTINCT s.student_name
FROM students s
JOIN marks m
ON s.student_id = m.student_id
WHERE m.marks > 90;

-- 11. Display the names of students who belong to the Computer Science department.
SELECT s.student_name
FROM students s
JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- 12. Find the number of subjects handled by each staff member.
SELECT st.staff_name, COUNT(ss.subject_id) AS total_subjects
FROM staff st
LEFT JOIN staff_subjects ss
ON st.staff_id = ss.staff_id
GROUP BY st.staff_name;

-- 13. Display students along with the total marks they obtained across all subjects.
SELECT s.student_name, SUM(m.marks) AS total_marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
GROUP BY s.student_name;

-- 14. Find departments with more than 2 staff members.
SELECT d.department_name, COUNT(st.staff_id) AS total_staff
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING COUNT(st.staff_id) > 2;

-- 15. Display students whose CGPA is above the average CGPA.
SELECT student_name, cgpa
FROM students
WHERE cgpa > (SELECT AVG(cgpa) FROM students);

-- 16. Find staff members earning more than the average salary of their department.
SELECT st.staff_name, st.salary
FROM staff st
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM staff
    GROUP BY department_id
) a
ON st.department_id = a.department_id
WHERE st.salary > a.avg_salary;

-- 17. Display the second highest salary among staff members.
SELECT MAX(salary) AS second_highest_salary
FROM staff
WHERE salary < (SELECT MAX(salary) FROM staff);

-- 18. Find students who scored the highest marks in each subject.
SELECT s.student_name, sub.subject_name, m.marks
FROM marks m
JOIN students s
ON m.student_id = s.student_id
JOIN subjects sub
ON m.subject_id = sub.subject_id
WHERE (m.subject_id, m.marks) IN (
    SELECT subject_id, MAX(marks)
    FROM marks
    GROUP BY subject_id
);

-- 19. Display all students and their marks, including students without marks.
SELECT s.student_name, m.marks
FROM students s
LEFT JOIN marks m
ON s.student_id = m.student_id;

-- 20. Find subjects where the average marks are below 70.
SELECT sub.subject_name, AVG(m.marks) AS avg_marks
FROM marks m
JOIN subjects sub
ON m.subject_id = sub.subject_id
GROUP BY sub.subject_name
HAVING AVG(m.marks) < 70;

-- 21. Display students ordered by CGPA in descending order.
SELECT student_name, cgpa
FROM students
ORDER BY cgpa DESC;

-- 22. Find the total salary expenditure department-wise.
SELECT d.department_name, SUM(st.salary) AS total_salary
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name;

-- 23. Display departments where the total salary exceeds 200000.
SELECT d.department_name, SUM(st.salary) AS total_salary
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING SUM(st.salary) > 200000;

-- 24. Find students admitted after 2021 and having CGPA above 7.5.
SELECT student_name, cgpa
FROM students
WHERE admission_year > 2021
AND cgpa > 7.5;

-- 25. Display the number of students admitted each year.
SELECT admission_year, COUNT(student_id) AS total_students
FROM students
GROUP BY admission_year;

-- 26. Find the city with the maximum number of students.
SELECT city, COUNT(student_id) AS total_students
FROM students
GROUP BY city
ORDER BY total_students DESC
LIMIT 1;

-- 27. Display all departments and their staff count, including empty departments.
SELECT d.department_name, COUNT(st.staff_id) AS staff_count
FROM departments d
LEFT JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name;

-- 28. Find students who have failed in at least one subject.
SELECT DISTINCT s.student_name
FROM students s
JOIN marks m
ON s.student_id = m.student_id
WHERE m.marks < 50;

-- 29. Display staff hired before 2018.
SELECT staff_name, hire_date
FROM staff
WHERE YEAR(hire_date) < 2018;

-- 30. Find departments where no staff salary is recorded as NULL.
SELECT d.department_name
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING COUNT(*) = COUNT(st.salary);

-- 31. Assign a row number to students ordered by CGPA.
SELECT student_name, cgpa,
ROW_NUMBER() OVER(ORDER BY cgpa DESC) AS row_num
FROM students;

-- 32. Rank students based on their CGPA.
SELECT student_name, cgpa,
RANK() OVER(ORDER BY cgpa DESC) AS rank_num
FROM students;

-- 33. Display dense rank of staff salaries.
SELECT staff_name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM staff;

-- 34. Find the top 3 highest scoring students using window functions.
SELECT student_name, total_marks
FROM (
    SELECT s.student_name,
           SUM(m.marks) AS total_marks,
           DENSE_RANK() OVER(ORDER BY SUM(m.marks) DESC) AS rnk
    FROM students s
    JOIN marks m
    ON s.student_id = m.student_id
    GROUP BY s.student_name
) t
WHERE rnk <= 3;

-- 35. Display running total of marks for each student.
SELECT student_id, subject_id, marks,
SUM(marks) OVER(PARTITION BY student_id ORDER BY subject_id) AS running_total
FROM marks;

-- 36. Find the average marks for each subject using window functions.
SELECT subject_id, student_id, marks,
AVG(marks) OVER(PARTITION BY subject_id) AS avg_marks
FROM marks;

-- 37. Display previous exam marks for each student using LAG().
SELECT student_id, exam_date, marks,
LAG(marks) OVER(PARTITION BY student_id ORDER BY exam_date) AS previous_marks
FROM marks;

-- 38. Display next exam marks for each student using LEAD().
SELECT student_id, exam_date, marks,
LEAD(marks) OVER(PARTITION BY student_id ORDER BY exam_date) AS next_marks
FROM marks;

-- 39. Find the highest marks within each subject using MAX() OVER().
SELECT student_id, subject_id, marks,
MAX(marks) OVER(PARTITION BY subject_id) AS highest_marks
FROM marks;

-- 40. Display cumulative average marks ordered by exam date.
SELECT exam_date, marks,
AVG(marks) OVER(ORDER BY exam_date) AS cumulative_avg
FROM marks;

-- 41. Find the first student admitted in each department.
SELECT *
FROM (
    SELECT s.student_name,
           d.department_name,
           s.admission_year,
           ROW_NUMBER() OVER(
               PARTITION BY d.department_name
               ORDER BY s.admission_year
           ) AS rn
    FROM students s
    JOIN departments d
    ON s.department_id = d.department_id
) t
WHERE rn = 1;

-- 42. Display the latest hired staff member in each department.
SELECT *
FROM (
    SELECT st.staff_name,
           d.department_name,
           st.hire_date,
           ROW_NUMBER() OVER(
               PARTITION BY d.department_name
               ORDER BY st.hire_date DESC
           ) AS rn
    FROM staff st
    JOIN departments d
    ON st.department_id = d.department_id
) t
WHERE rn = 1;

-- 43. Divide students into 4 CGPA quartiles using NTILE().
SELECT student_name, cgpa,
NTILE(4) OVER(ORDER BY cgpa DESC) AS quartile
FROM students;

-- 44. Find percentage rank of students based on CGPA.
SELECT student_name, cgpa,
PERCENT_RANK() OVER(ORDER BY cgpa DESC) AS percent_rank
FROM students;

-- 45. Display cumulative distribution of salaries.
SELECT staff_name, salary,
CUME_DIST() OVER(ORDER BY salary DESC) AS cumulative_distribution
FROM staff;

-- 46. Find subjects where a student's marks are above the subject average.
SELECT student_id, subject_id, marks
FROM (
    SELECT student_id,
           subject_id,
           marks,
           AVG(marks) OVER(PARTITION BY subject_id) AS avg_marks
    FROM marks
) t
WHERE marks > avg_marks;

-- 47. Find departments whose average staff salary is higher than overall average salary.
SELECT d.department_name, AVG(st.salary) AS avg_salary
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING AVG(st.salary) > (
    SELECT AVG(salary)
    FROM staff
);

-- 48. Display students who scored above department average marks.
SELECT student_name, marks
FROM (
    SELECT s.student_name,
           m.marks,
           AVG(m.marks) OVER(PARTITION BY s.department_id) AS dept_avg
    FROM students s
    JOIN marks m
    ON s.student_id = m.student_id
) t
WHERE marks > dept_avg;

-- 49. Find the nth highest mark (3rd highest) using DENSE_RANK().
SELECT marks
FROM (
    SELECT marks,
           DENSE_RANK() OVER(ORDER BY marks DESC) AS rnk
    FROM marks
) t
WHERE rnk = 3;

-- 50. Generate a report showing student name, department, subject, exam type, 
-- marks, department average, and overall rank.
SELECT s.student_name,
       d.department_name,
       sub.subject_name,
       m.exam_type,
       m.marks,
       AVG(m.marks) OVER(PARTITION BY d.department_id) AS dept_avg,
       RANK() OVER(ORDER BY m.marks DESC) AS overall_rank
FROM marks m
JOIN students s
ON m.student_id = s.student_id
JOIN departments d
ON s.department_id = d.department_id
JOIN subjects sub
ON m.subject_id = sub.subject_id;

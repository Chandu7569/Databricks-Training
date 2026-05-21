-- 1. Display all students and the courses they are enrolled in.

+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| John         | DBMS        |
| John         | Python      |
| Alice        | DBMS        |
| Bob          | AI          |
| Emma         | NULL        |
+--------------+-------------+


-- 2. Find all courses that currently have no students enrolled.

+-------------+
| course_name |
+-------------+
| Java        |
+-------------+


-- 3. Display all instructors and the courses they teach.

+-----------------+-------------+
| instructor_name | course_name |
+-----------------+-------------+
| Smith           | DBMS        |
| David           | Python      |
| Miller          | AI          |
| Anderson        | NULL        |
+-----------------+-------------+


-- 4. Find all courses that do not have an instructor assigned.

+-------------+
| course_name |
+-------------+
| Java        |
+-------------+


-- 5. Display all students and enrollment information using RIGHT JOIN.

+--------------+---------------+-----------+
| student_name | enrollment_id | course_id |
+--------------+---------------+-----------+
| John         | 1             | 101       |
| John         | 2             | 102       |
| Alice        | 3             | 101       |
| Bob          | 4             | 104       |
+--------------+---------------+-----------+


-- 6. Find students who are not enrolled in any course.

+--------------+
| student_name |
+--------------+
| Emma         |
+--------------+


-- 7. FULL OUTER JOIN of students and enrollments.

+--------------+---------------+-----------+
| student_name | enrollment_id | course_id |
+--------------+---------------+-----------+
| John         | 1             | 101       |
| John         | 2             | 102       |
| Alice        | 3             | 101       |
| Bob          | 4             | 104       |
| Emma         | NULL          | NULL      |
+--------------+---------------+-----------+


-- 8. Courses never appeared in enrollments table.

+-------------+
| course_name |
+-------------+
| Java        |
+-------------+


-- 9. FULL OUTER JOIN of instructors and courses with unmatched rows.

+-----------------+-------------+
| instructor_name | course_name |
+-----------------+-------------+
| Smith           | DBMS        |
| David           | Python      |
| Miller          | AI          |
| Anderson        | NULL        |
| NULL            | Java        |
+-----------------+-------------+


-- 10. Report showing student name, course name, instructor name.

+--------------+-------------+-----------------+
| student_name | course_name | instructor_name |
+--------------+-------------+-----------------+
| John         | DBMS        | Smith           |
| John         | Python      | David           |
| Alice        | DBMS        | Smith           |
| Bob          | AI          | Miller          |
| Emma         | NULL        | NULL            |
+--------------+-------------+-----------------+

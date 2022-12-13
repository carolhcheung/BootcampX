--total number of incomplete assignments for a specific student
SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

--same as above, but shorter and better
SELECT (
  SELECT count(*)
  FROM table_name
) as total, other_column
FROM other_table_name
ORDER BY total;


--average number of students that attend a cohort..The as totals_table part gives an alias to the sub query 
SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;

--the inner query can contain as many columns as we like
SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students, cohorts.name as cohort_name
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
) as totals_table;

--name of all completed assignments for student
SELECT assignment_id
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

--name of all incompleted assignments for student
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);
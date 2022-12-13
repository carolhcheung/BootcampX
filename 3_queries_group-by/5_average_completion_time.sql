SELECT students.name as student, avg(duration) as average_assignment_duration
FROM students 
JOIN assignment_submissions on students.id = student_id
WHERE end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;

-- SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- WHERE end_date IS NULL
-- GROUP BY student
-- ORDER BY average_assignment_duration DESC;

SELECT students.name as student, avg(duration) as average_assignment_duration
FROM assignment_submissions
JOIN students on students.id = student_id
WHERE end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;

--all 3 give same table
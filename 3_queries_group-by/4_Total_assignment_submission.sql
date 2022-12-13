-- SELECT cohorts.name as cohort, count(assignment_submissions.*) AS total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- WHERE submission_date BETWEEN cohorts.start_date AND cohorts.end_date 
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;


SELECT cohorts.name as cohort, count(assignment_submissions.*) AS total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;


--doesn't work the other way around
-- SELECT cohorts.name as cohort, count(assignment_submissions.*) AS total_submissions
-- FROM cohorts
-- JOIN students ON students.id = student_id
-- JOIN assignment_submissions ON students.id = student_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;
SELECT teachers.name as teacher, cohorts.name as cohort, count(teachers.id) as total_assistances
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
--BOTH work and give exact same results, works with or without distinct, as we group by teachers.name and cohorts.name

SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;


--DISTINCT causing issue here as 
-- SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(teachers.id) as total_assistances
-- FROM teachers
-- JOIN assistance_requests ON teachers.id = teacher_id
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- WHERE cohorts.name = 'JUL02'
-- ORDER BY teachers.name;
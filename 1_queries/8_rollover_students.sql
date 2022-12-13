SELECT student.name AS student_name, 
        cohort.name AS cohort_name, 
        cohort.start_date AS cohort_start_date, 
        student.start_date AS student_start_date
FROM students JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start_date;

SELECT avg(total_duration) as average_total_duration
FROM (
  SELECT sum(completed_at-started_at) as total_duration
  FROM assistance_requests
  JOIN students on students.id = student_id
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_durations;  --from total_duration on ln3


--FROM 8_total_cohort_assistance_duration and find average of this so nest inside select avg...
-- SELECT cohorts.name as cohort, sum(completed_at-started_at) as total_duration
-- FROM assistance_requests
-- JOIN students on students.id = student_id
-- JOIN cohorts on cohorts.id = cohort_id
-- GROUP by cohorts.name
-- ORDER BY total_duration;
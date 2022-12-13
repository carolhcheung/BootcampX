SELECT assignments.day as day, count(*) as total_assignments
FROM assignments
GROUP BY assignments.day
ORDER BY day;
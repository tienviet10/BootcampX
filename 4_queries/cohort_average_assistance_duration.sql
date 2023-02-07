SELECT
  AVG(total_duration) as average_total_duration
FROM
  (
    SELECT
      SUM(completed_at - started_at) as total_duration
    FROM
      students
      JOIN cohorts ON cohorts.id = cohort_id
      JOIN assistance_requests ON student_id = students.id
    GROUP BY
      cohorts.name
  ) as total_durations;
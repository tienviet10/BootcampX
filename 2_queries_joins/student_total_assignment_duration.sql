SELECT
  sum(assignment_submissions.duration)
FROM
  cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assignment_submissions ON student_id = students.id
WHERE
  cohorts.name = 'FEB12';
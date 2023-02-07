SELECT
  COUNT(assistance_requests.id) as total_assistances,
  name
FROM
  students
  JOIN assistance_requests ON students.id = student_id
WHERE
  name = 'Elliot Dickinson'
GROUP BY
  students.id;
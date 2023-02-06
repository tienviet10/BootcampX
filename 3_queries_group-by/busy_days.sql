SELECT
  day,
  COUNT(id) as total_assignments
FROM
  assignments
GROUP BY
  day
HAVING
  COUNT(id) >= 10
ORDER BY
  day;
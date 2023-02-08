const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryTemplate = `
SELECT
  teachers.name as teacher,
  cohorts.name as cohort,
  COUNT(assistance_requests.*)
FROM
  assistance_requests
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
WHERE
  cohorts.name = $1
GROUP BY
  teachers.name,
  cohorts.name
ORDER BY
  teachers.name;
`;

const cohortName = process.argv[2];
const values = [`${cohortName}`];

pool.query(queryTemplate, values)
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.cohort}: ${teacher.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));
const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2] || 'JUL02';
const values = [`${cohortName}`];
const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher;
`;

pool.query(queryString, values)
  .then(res => {  //res.rows is the objects from the res which is array of objects
    res.rows.forEach(row => {  //row = name argument anything you want it will reference to the array of objects from res.rows and forEach(ojb[0], obj[1]...do something)
      console.log(`${row.cohort}: ${row.teacher}`);
      // console.log(process.argv[2])
      // console.log(res.rows);
    })
  }).catch(err => console.error('query error', err.stack));

// pool.query(`
// SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
// FROM teachers
// JOIN assistance_requests ON teacher_id = teachers.id
// JOIN students ON student_id = students.id
// JOIN cohorts ON cohort_id = cohorts.id
// WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
// ORDER BY teacher;
// `)
//   .then(res => {  //res.rows is the objects from the res which is array of objects
//     res.rows.forEach(row => {  //row = name argument anything you want it will reference to the array of objects from res.rows and forEach(ojb[0], obj[1]...do something)
//       // console.log(process.argv[2])
//       // console.log(res.rows);
//       console.log(`${row.cohort}: ${row.teacher}`);
//     })
//   }).catch(err => console.error('query error', err.stack));
const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

//makes node arguments into array of arguments [cohort, limit] 
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohortName}%`, limit];  
//prevents malicious code injection
//by setting the only values that will be taken from client 

const queryString = `
SELECT students.id as student_id, students.name as name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

pool.query(queryString, values)
  .then(res => { //res.rows is the objects from the res which is array of objects
    res.rows.forEach(user => { //user = name argument anything you want it will reference to the array of objects from res.rows and forEach(ojb[0], obj[1]...do something)
      console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort_name} cohort`);
    })
  }).catch(err => console.error('query error', err.stack));


// pool.query(`
// SELECT students.id as student_id, students.name as name, cohorts.name as cohort_name
// FROM students
// JOIN cohorts ON cohorts.id = cohort_id
// WHERE cohorts.name LIKE '%${process.argv[2]}%'
// LIMIT ${process.argv[3] || 5};
// `)
//   .then(res => { //res.rows is the objects from the res which is array of objects
//     res.rows.forEach(user => { //user = name argument anything you want it will reference to the array of objects from res.rows and forEach(ojb[0], obj[1]...do something)
//       console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort_name} cohort`);
//     })
//   }).catch(err => console.error('query error', err.stack));
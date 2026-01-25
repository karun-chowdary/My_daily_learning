query:
Write a solution to find the employees who are high earners in each of the departments.

 A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+

Logic:
We can use Correlated Subquery Ranking Pattern or windows function

Pattern: Correlated Subquery Ranking Pattern

Code :

"SELECT d.name AS Department,
       e.name AS Employee,
       e.salary
FROM employee e
JOIN department d
  ON e.departmentid = d.id
WHERE 3 > (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employee e2
    WHERE e2.salary > e.salary
      AND e2.departmentid = e.departmentid
); "

How it runs:
sub-query returns ranks for each salary using count in each department.
count-->0 rank -->1
count-->1 rank -->2
count-->2 rank -->3
it is correlated sub query because it is depends on outer query.
based on ranks we will return the employees

Alternate method using window function:

code:

SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY departmentid
               ORDER BY salary DESC
           ) AS rnk
    FROM employee
) e
JOIN department d
  ON e.departmentid = d.id
WHERE rnk < 4;



How it runs:

Using pattern Window_functions
when window_function is runs in code it will in order as below:
	Split data by department
	Sort salaries within department
	Assign rank from 1.
Dense_rank will give same rank to same salary in respective department.
No rows are removed or added.
Rank is just added.
Now database will see this new table  as tempoary table named as "e".
Next we will join department table with temporary table "e".
then where will apply to rank < 4(top 3 high earners)
window functions annotate and then filter.

patterns using at:

| Situation                            | Correlated Subquery | Window Function |
| ------------------------------------ | ------------------- | --------------- |
| DB does NOT support window functions | ✅ Yes               | ❌ No            |
| Simple ranking logic                 | ⚠️ Possible         | ✅ Best          |
| Top-N per group                      | ❌ Hard              | ✅ Easy          |
| Handling ties                        | ⚠️ Complex          | ✅ Natural       |
| Interview fallback solution          | ✅ Yes               | ⚠️ Sometimes    |
| Production / large data              | ❌ Avoid             | ✅ Use           |


Performance characteristics:

| Aspect                 | Correlated Subquery        | Window Function       |
| ---------------------- | -------------------------- | --------------------- |
| Table scans            | ❌ Multiple scans (per row) | ✅ Usually single scan |
| Execution cost         | ❌ High                     | ✅ Lower               |
| Scalability            | ❌ Poor                     | ✅ Excellent           |
| Optimizer friendliness | ❌ Low                      | ✅ High                |
| Index usage            | ⚠️ Limited                 | ✅ Better              |




# Write your MySQL query statement below
SELECT d.name as department, e.name as Employee, Salary
FROM employee e
JOIN department d
on e.departmentid = d.id
WHERE( e.departmentid, e.salary) IN(
    SELECT departmentid, MAX(Salary)
    FROM Employee
    GROUP BY departmentid
)

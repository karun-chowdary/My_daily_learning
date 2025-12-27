CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT MAX(salary) 
      FROM (
        SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) as rnk
        FROM employee
      )t
      WHERE rnk = n

  );
END

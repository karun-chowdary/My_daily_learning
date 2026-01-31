-- Day 8: SQL Practice
-- Source: LeetCode
-- Problem: Managers with at Least 5 Direct Reports

-- Pattern:
-- Parent–Child counting pattern(Self Join + Aggregation Pattern),Window Function Counting Pattern


-- Goal:
-- find managers with at least five direct reports.



Table:
 
Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+

Approach-1:

1. Group employees by managerId.
2. Count number of direct reports per manager.
3. Filter managerId having count >= 5.
4. Fetch manager names using outer query.



query:

SELECT name
FROM employee
WHERE id IN (
    SELECT managerid
    FROM employee
    GROUP BY managerid
    HAVING COUNT(*) >= 5
);



Approach-2 :

1. Read employee table twice using LEFT JOIN.
2. Pair each manager with their employees.
3. Use COUNT() OVER (PARTITION BY manager id) to count employees per manager.
4. Window function adds count without collapsing rows.
5. Group results to remove duplicates.
6. Filter managers with count >= 5.
7. Return names.

Query:

SELECT name
FROM (
    SELECT
        e1.id,
        e1.name,
        COUNT(e2.id) OVER (PARTITION BY e1.id) AS emp_count
    FROM employee e1
    LEFT JOIN employee e2
        ON e1.id = e2.managerid
) t
GROUP BY id, name, emp_count
HAVING emp_count >= 5;




Performance characteristics:

| Aspect            | Self Join + GROUP BY       | Window Function     |
| ----------------- | -------------------------- | ------------------------- |
| Table scans       | Single                     | Single                    
| Sorting           | Required                   | Required
| scalability       | small to medium            | high            
| Readability       | medium                     | high                    


Key takeaways:
-- GROUP BY is usually faster for simple counts.
-- Window functions are preferred when we also need row-level details.




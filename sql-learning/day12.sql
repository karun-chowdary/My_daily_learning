-- Day 12: SQL Practice
-- Source: LeetCode
-- Problem: Last Person to Fit in the Bus

-- Pattern:
-- Self Join, Window Function(cummilative sum)

-- Goal:
-- Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit 1000


Table:
 
Input: 
Queue table:
+-----------+-------------+--------+------+
| person_id | person_name | weight | turn |
+-----------+-------------+--------+------+
| 5         | Alice       | 250    | 1    |
| 4         | Bob         | 175    | 5    |
| 3         | Alex        | 350    | 2    |
| 6         | John Cena   | 400    | 3    |
| 1         | Winston     | 500    | 6    |
| 2         | Marie       | 200    | 4    |
+-----------+-------------+--------+------+
Approach :

1. Process people in queue order using turn.
2. Calculate a running total of weights.
3. Keep only people whose cumulative weight does not exceed 1000.
4. Among those valid people, pick the one with the largest turn value (last person).
5. Return that person’s name.



query:

SELECT person_name 
FROM (
    SELECT 
        person_name, 
        weight, 
        turn, 
        SUM(weight) OVER (ORDER BY turn) AS cum_sum
    FROM queue
) x
WHERE cum_sum <= 1000
ORDER BY turn DESC 
LIMIT 1;


Approach-2 :

1. For each person, calculate total weight of all people before and including them.
2. Check if that total is ≤ 1000.
3. Keep valid people.
4. Select the one with the highest turn.

Query:

SELECT q1.person_name
FROM queue q1
WHERE (
    SELECT SUM(q2.weight)
    FROM queue q2
    WHERE q2.turn <= q1.turn
) <= 1000
ORDER BY q1.turn DESC
LIMIT 1;




Performance characteristics:

| Aspect            | GROUP BY + sub query       | Window Function  |
| ----------------- | -------------------------- | -----------------|
| Table scans       | Multiple                   | Single           |  
| Sorting           | Required                   | Required         | 
| scalability       | Low                        | high             |
| Readability       | Low                        | high             | 


Key takeaways:
-- This is a running total problem.
-- Window functions are the cleanest and safest solution.



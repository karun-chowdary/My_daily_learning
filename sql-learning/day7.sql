-- Day 7: SQL Practice
-- Source: LeetCode
-- Problem: Exchange Seats

-- Pattern:
-- Arithmetic swap pattern, Window-based row navigation


 When to use Window Functions here:
-- Window functions rely on ORDER BY rather than arithmetic on ids, making them safer when ids are unordered or data grows dynamically.




-- Goal:
-- Swap the seat id of every two consecutive students.
-- If the number of students is odd, the last student should remain unchanged.



Table:
 
Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+

Approach-1:

1. using CASE WHEN + MOD function to swap ids
2. when id%2 =1 and it is not last id (MAX(id) returns last id) then id will increment 1.
3. when id%2 = 0 id will decrement 1
4. After this table is not in order. so we sort table using id with ORDER BY.

Limitation:
-- This approach assumes ids are continuous and ordered.
-- If ids are missing or unordered, swapping logic may break.



query:

SELECT
    CASE
        WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;




Approach-2 :

1. Read data from table seats
2. Use LEAD(student) to fetch the next student for odd ids.
3. Use LAG(student) to fetch the previous student for even ids.
4. Apply CASE logic to decide whether to use LEAD or LAG.
5. Use COALESCE to keep the original student name when LEAD returns NULL (last odd row).
6. output :id and swapped student name.

Query:

SELECT
    id,
    COALESCE(
        CASE
            WHEN id % 2 = 1 THEN LEAD(student) OVER (ORDER BY id)
            ELSE LAG(student) OVER (ORDER BY id)
        END,
        student
    ) AS student
FROM Seat;



Performance characteristics:

| Aspect            | Query 1 (CASE + MOD) | Query 2 (Window Function) |
| ----------------- | -------------------------- | ------------------------- |
| Table scans       | Single                     | Single                    
| Sorting           | Required                   | Required for window function ordering
| scalability       | small to medium            | high            
| Readability        | medium                     | high                    


Key Takeaways:
-- Use arithmetic logic when performance is the only concern and data is guaranteed clean.
-- Use window functions when correctness, safety, and future changes matter more than micro-optimizations.




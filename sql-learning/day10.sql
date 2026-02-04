-- Day 10: SQL Practice
-- Source: LeetCode
-- Problem: Product Price at a Given Date

-- Pattern:
-- GROUP BY + MAX (join back), Window Function

-- Goal:
-- Initially, all products have price 10. Write a solution to find the prices of all products on the date 2019-08-16.



Table:
 
Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+

Approach-1:

1. Group by product_id.
2. Find maximum change_date before target date.
3. Join back to get corresponding price.
4. Use LEFT JOIN so missing products get NULL.
5. Replace NULL with default 10.



query:

SELECT
    p.product_id,
    COALESCE(t.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) p
LEFT JOIN (
    SELECT product_id, new_price
    FROM Products
    WHERE (product_id, change_date) IN (
        SELECT product_id, MAX(change_date)
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    )
) t
ON p.product_id = t.product_id;





Approach-2 :

1. Filter rows where change_date is less than or equal to target date.
2. Partition rows by product_id.
3. Sort each partition by change_date descending.
4. Use ROW_NUMBER to rank rows inside each product.
5. Row number 1 gives the latest price.
6. Use COALESCE to assign default price 10 if no change exists.

Query:

SELECT
    p.product_id,
    COALESCE(t.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) p
LEFT JOIN (
    SELECT product_id, new_price
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (
                   PARTITION BY product_id
                   ORDER BY change_date DESC
               ) AS rn
        FROM Products
        WHERE change_date <= '2019-08-16'
    ) x
    WHERE rn = 1
) t
ON p.product_id = t.product_id;



Performance characteristics:

| Aspect            | GROUP BY + sub query       | Window Function  |
| ----------------- | -------------------------- | -----------------|
| Table scans       | Multiple                   | Single           |  
| Sorting           | Required                   | Required         | 
| scalability       | Low                        | high             |
| Readability       | Low                        | high             | 


Key takeaways:
--If window functions are available
--Always prefer Window Function

--If not available
--Use GROUP BY + MAX

--Avoid correlated subqueries for large data



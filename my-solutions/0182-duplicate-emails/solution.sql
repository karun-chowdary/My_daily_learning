# Write your MySQL query statement below
SELECT Email
FROM Person
GROUP BY email
HAVING COUNT(email)>1

/*SELECT DISTINCT p1.email
FROM person p1
WHERE EXISTS (
    SELECT 2
    FROM person p2
    WHERE p1.email = p2.email 
    AND p1.id <> p2.id
)*/

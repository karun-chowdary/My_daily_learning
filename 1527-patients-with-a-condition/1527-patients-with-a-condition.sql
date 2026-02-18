# Write your MySQL query statement below
SELECT *
FROM patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%'
#we can use below mthod also
#WHERE conditions REGEXP "\\bDIAB1"


#pyspark query
/* from pyspark.sql.functions import col
results = patients.filter(col("conditions").rlike(\bDIAB))
reults.show()*/
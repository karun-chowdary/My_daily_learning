# Write your MySQL query statement below
SELECT Employee.name,Bonus.bonus FROM Employee 
LEFT JOIN Bonus ON Employee.empID = Bonus.empID
WHERE bonus < 1000 OR Bonus IS NULL ;

#pyspark code
/*from pyspark.sql import functions as F
result = employee_df.join(bonus_df, "empId", "left") \
    .filter((F.col("bonus") < 1000) | (F.col("bonus").isNull())) \
    .select("name", "bonus")

result.show()*/

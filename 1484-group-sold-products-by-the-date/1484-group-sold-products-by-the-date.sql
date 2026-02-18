# Write your MySQL query statement below
SELECT sell_date, count(distinct product) as num_sold,
 GROUP_CONCAT( DISTINCT product ORDER BY product ASC separator ',') as products
FROM activities
GROUP BY sell_date
ORDER BY sell_date ASC

#pyspark query
/* from pyspark.sql import functions as F
results = activites.groupBy("sell_date")
.agg(F.count_distinct("products").alias('num_solid'),F.concat_ws(',',F.array_sort(collect_set("products"))).alias("products"))

results.show()*/
/* Write your T-SQL query statement below */
with firstt as (select count(product_key) as count_prod_key from Product),

second as (select customer_id, count(distinct product_key) as count_cust_prod_key
from Customer
group by customer_id)

select customer_id
from second
where count_cust_prod_key = (select count_prod_key from firstt)
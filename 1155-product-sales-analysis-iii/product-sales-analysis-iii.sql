/* Write your T-SQL query statement below */
with firstt as (select *, rank() over(partition by product_id order by year) as rnk
from Sales)

select product_id, 
        year as first_year, 
        quantity, 
        price
from firstt
where rnk = 1

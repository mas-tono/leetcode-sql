/* Write your T-SQL query statement below */

with firstt as (select distinct *
from Activities)

select sell_date, count(product) as num_sold, string_agg(product, ',') as products
from firstt
group by sell_date
order by sell_date
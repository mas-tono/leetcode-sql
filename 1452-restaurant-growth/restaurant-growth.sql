/* Write your T-SQL query statement below */

with firstt as (select visited_on, 
    sum(amount) as amount
from Customer
group by visited_on),

secondd as (select visited_on, 
       sum(amount) over(order by visited_on rows between 6 preceding and current row) as amount,
       round(avg(amount*1.0) over(order by visited_on rows between 6 preceding and current row), 2) as average_amount,
       row_number() over(order by visited_on) as rn
from firstt)

select visited_on, amount, average_amount
from secondd
where rn >= 7
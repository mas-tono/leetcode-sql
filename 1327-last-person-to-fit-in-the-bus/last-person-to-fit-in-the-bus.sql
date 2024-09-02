/* Write your T-SQL query statement below */

with firstt as (select *, 
                    sum(weight) over(order by turn rows between unbounded preceding and current row) as total_weight,
                    rank() over(order by turn) as rankk
from Queue)

select person_name
from firstt
where rankk = (select count(person_name)
                from firstt
                where total_weight <= 1000)
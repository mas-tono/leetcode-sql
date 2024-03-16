/* Write your T-SQL query statement below */
with first as (select *, 
temperature - lag(temperature) over(order by recordDate) as diffTemp, 
datediff(day, lag(recordDate) over(order by recordDate), recordDate) as diffDate
from Weather)

select id
from first
where diffTemp > 0 and diffDate = 1
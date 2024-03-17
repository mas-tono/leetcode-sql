/* Write your T-SQL query statement below */
select max(num) as num
from (
    select num, count(num) as count_num
    from MyNumbers
    group by num) n
where count_num = 1
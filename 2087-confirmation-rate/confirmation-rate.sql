/* Write your T-SQL query statement below */
with firstt as (select s.user_id, case
    when action = 'confirmed' then 1.0 else 0.0
end as status
from Confirmations c
right join Signups s
on c.user_id = s.user_id)

select user_id, round(avg(status), 2) as confirmation_rate 
from firstt
group by user_id
/* Write your T-SQL query statement below */

select activity_date as day, count(distinct user_id) as active_users
from (
    select *
    from Activity
    where activity_date > dateadd(day, -30, '2019-07-27') and activity_date <= '2019-07-27') a
group by activity_date
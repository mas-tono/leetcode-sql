/* Write your T-SQL query statement below */

select player_id, event_date as first_login
from (select *, rank() over(partition by player_id order by event_date) as orderr
    from Activity) f
where orderr = 1    
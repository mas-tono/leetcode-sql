/* Write your T-SQL query statement below */

-- clue: you need to count the number of players that logged in for at least two consecutive days STARTING from their FIRST LOGIN date (date difference = 1 from first login date), then divide that number by the total number of players (unique player_id). 

with firstt as (select *, datediff(day, first_date, event_date) as date_diff
from (select *, min(event_date) over(partition by player_id order by event_date) as first_date
from Activity) a)

select round((cast((select count(player_id) from firstt where date_diff = 1) as float) / (select count(distinct player_id) from firstt)), 2) as fraction
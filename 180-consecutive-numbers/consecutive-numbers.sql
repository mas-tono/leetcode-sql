/* Write your T-SQL query statement below */

-- check the 'id' too, it's not really autoincrement

select distinct num as ConsecutiveNums
from (
    select *, 
            case 
                when (num = lagg_num) and (num = leadd_num) then 1 else 0
            end as cek_num,
            case
                when leadd_id - lagg_id = 2 then 1 else 0
            end as cek_id
    from (select *, 
                lag(num) over(order by id) as lagg_num,             
                lead(num) over(order by id) as leadd_num,
                lag(id) over(order by id) as lagg_id,
                lead(id) over(order by id) as leadd_id
    from Logs) c) d
where cek_num = 1 and cek_id = 1
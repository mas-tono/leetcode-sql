/* Write your T-SQL query statement below */
with firstt as (select *, (timestamp - lag(timestamp) over(partition by machine_id, process_id order by timestamp)) as time_diff, concat(machine_id, process_id) as mach_proc
from Activity)

select machine_id, round(avg(time_diff), 3) as processing_time 
from firstt
where time_diff is not null
group by machine_id
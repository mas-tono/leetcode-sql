/* Write your T-SQL query statement below */

select distinct num as ConsecutiveNums 
from (
	select *, case
		when (num = lagg) and (num = leadd) then 1 else 0
		end as cek
	from (
		select *, LAG(num) over(order by id) as lagg, LEAD(num) over(order by id) as leadd
		from Logs) l) c
where cek = 1
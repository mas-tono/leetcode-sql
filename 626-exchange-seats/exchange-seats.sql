/* Write your T-SQL query statement below */

with firstt as (select *, (id-1)/2 as grup
from Seat),

secondd as (select *, 
        case
            when lag(grup) over(order by id) = grup then id-1 else 0
        end as ss,
        case
            when lead(grup) over(order by id) = grup then id+1 else 0
        end as dd
from firstt),

thirdd as (select *, case
            when ss = 0 and dd = 0 then id
            when ss = 0 then dd
            when dd = 0 then ss            
            else id
        end as fix
from secondd)

select t.id, s.student
from thirdd t
left join Seat s
on t.fix = s.id
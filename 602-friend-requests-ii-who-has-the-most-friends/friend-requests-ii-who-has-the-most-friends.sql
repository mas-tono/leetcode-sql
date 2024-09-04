/* Write your T-SQL query statement below */

with firstt as (select requester_id as id
                from RequestAccepted 
                union
                select accepter_id 
                from RequestAccepted),

secondd as (select f.id
            from firstt f
            left join RequestAccepted r
            on f.id = r.requester_id 
            where r.requester_id is not null
            union all
            select f.id
            from firstt f
            left join RequestAccepted r
            on f.id = r.accepter_id  
            where r.accepter_id is not null),

thirdd as (select id, count(id) as num
            from secondd
            group by id)

select id, num
from thirdd
where num = (select max(num) from thirdd)
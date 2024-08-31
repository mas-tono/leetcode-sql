/* Write your T-SQL query statement below */
with firstt as (select *, (rating * 1.0 / position) as rat_pos, 
                count(query_name) over(partition by query_name) as cnt_query_name, 
                case
                    when rating < 3 then 1 else 0
                end as poor_query
from Queries
where query_name is not null)

select query_name, 
        round(sum(rat_pos) / cnt_query_name, 2) as quality, 
        round(sum(poor_query) * 100.0 / cnt_query_name, 2) as poor_query_percentage
from firstt
group by query_name, cnt_query_name
/* Write your T-SQL query statement below */
select name
from (
    select *, isnull(referee_id, 0) as ref_edit
    from Customer) f
where ref_edit <> 2
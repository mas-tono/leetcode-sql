/* Write your T-SQL query statement below */
with firstt as (select managerId, count(managerId) as cnt_manager
from Employee
where managerId is not null
group by managerId)

select e.name
from firstt f
join Employee e
on f.managerId = e.id
where cnt_manager >= 5
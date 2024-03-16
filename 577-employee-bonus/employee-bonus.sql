/* Write your T-SQL query statement below */
with first as (select e.empId, 
    e.name, 
    b.bonus, 
    isnull(b.bonus, 0) as bonus_edit
from Employee e
left join Bonus b
on e.empId = b.empId)

select name, bonus
from first
where bonus_edit < 1000
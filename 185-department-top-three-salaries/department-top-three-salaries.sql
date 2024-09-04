/* Write your T-SQL query statement below */

with firstt as (select d.name as Department, e.name as Employee, e.salary, 
dense_rank() over(partition by d.name order by salary desc) as rnk
from Employee e
join Department d
on e.departmentId  = d.id)

select Department, Employee, Salary
from firstt
where rnk <=3
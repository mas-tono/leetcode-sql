/* Write your T-SQL query statement below */

select Department, Employee, Salary
from (
    select e.id, e.name as Employee, e.salary as Salary, d.name as Department, rank() over(partition by d.name order by salary desc) as rankk
    from Employee e
    left join Department d
    on e.departmentId  = d.id) a
where rankk = 1
order by id
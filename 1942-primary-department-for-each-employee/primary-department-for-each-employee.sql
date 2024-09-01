/* Write your T-SQL query statement below */
with firstt as (select *, count(department_id) over(partition by employee_id) as stat
from employee)

select employee_id, department_id
from firstt
where (primary_flag = 'N' and stat = 1) or primary_flag = 'Y'

/* Write your T-SQL query statement below */

with firstt as (select *, dense_rank() over(order by salary desc) as rankk
    from Employee)

select case
    when (select count(*) from Employee) > 1 then (select distinct salary from firstt where rankk = 2)
    else (select null from firstt)
end as SecondHighestSalary 
 
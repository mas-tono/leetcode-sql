/* Write your T-SQL query statement below */
with first as (select *
from (select customer_number, count(customer_number) as count_cust
    from Orders
    group by customer_number) f)

select customer_number
from first
where count_cust = (select max(count_cust) from first)


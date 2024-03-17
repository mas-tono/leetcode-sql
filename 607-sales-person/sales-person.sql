/* Write your T-SQL query statement below */

with first as (select s.name as name_sales, c.name as name_com
    from SalesPerson s
    left join Orders o
    on s.sales_id = o.sales_id
    left join Company c
    on o.com_id = c.com_id)

select distinct name_sales as name
from first
where name_sales not in (select name_sales
    from first
    where name_com = 'RED')
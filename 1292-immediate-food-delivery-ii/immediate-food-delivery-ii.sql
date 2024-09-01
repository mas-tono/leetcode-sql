/* Write your T-SQL query statement below */
with firstt as (select *, 
    rank() over(partition by customer_id order by order_date) as first_order,
    case
        when order_date = customer_pref_delivery_date then 1 else 0
    end as stat_immediate
from Delivery),

secondd as (select customer_id, first_order, stat_immediate, case
        when first_order = stat_immediate then 1 else 0
    end as final_stat_imme
from firstt)

select round((select sum(final_stat_imme ) from secondd) * 100.0 / (select sum(first_order) from secondd
    where first_order = 1), 2) as immediate_percentage 
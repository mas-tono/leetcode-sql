/* Write your T-SQL query statement below */

-- we use firstt, secondd, thirdd to find new_price BEFORE and AT 2019-08-16
-- we use fourthh to find unique product_id
-- we use left join query to join all unique product_id and their price (before, at) 2019-08-16, if product_id aren't found in thirdd, which is AFTER 2019-08-16, then we use 10 as their price

with firstt as (select *, 
                case
                    when change_date <= '2019-08-16' then 1 else 0
                end as cek_date,
                row_number() over(partition by product_id order by change_date) as rn
                from Products),

secondd as (select *, 
                    sum(cek_date) over(partition by product_id) as sum_cek_date            
            from firstt),

thirdd as (select *
            from secondd
            where cek_date = 1 and rn = sum_cek_date),

fourthh as (select distinct product_id
            from Products)  -- find distinct product_id

select f.product_id, coalesce(t.new_price, 10) as price
from fourthh f
left join thirdd t
on f.product_id = t.product_id
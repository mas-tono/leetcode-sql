/* Write your T-SQL query statement below */
with firstt as (select *, (coalesce(units, 0) * price) as total
from (
	select *, case
		when (u_purch_date between start_date and end_date) or (u_purch_date is null) then 1 else 0
		end as cek
	from (
		select p.product_id as p_prod_id, p.start_date  as start_date, p.end_date as end_date, p.price as price,
								u.product_id as u_prod_id, u.purchase_date as u_purch_date, u.units
		from Prices p
		left join UnitsSold u
		on u.product_id = p.product_id) a) b
where cek = 1),

secondd as (select p_prod_id , sum(units) as total_units, sum(total) as total_price
    from firstt
    group by p_prod_id)


select p_prod_id as product_id, coalesce(round((1.00*total_price/total_units), 2), 0) as average_price
from secondd
group by p_prod_id, total_price, total_units
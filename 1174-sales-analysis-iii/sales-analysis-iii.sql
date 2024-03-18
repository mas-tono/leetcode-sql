/* Write your T-SQL query statement below */

select product_id, product_name
from Product 
where product_id not in (
    select p.product_id
    from Product p
    left join Sales s
    on p.product_id = s.product_id
    where (s.sale_date not between '2019-01-01' and '2019-03-31') or (s.sale_date is null))

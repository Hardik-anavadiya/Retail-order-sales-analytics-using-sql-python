/* 4) for each category which month had highest sales */


with cte as(
select 
	category,
	format(order_date,'yyyy/MM') as order_year_month,
	sum(sale_price) as sales 
from Retail_order_data
group by category,format(order_date,'yyyy/MM') )

select * from (
select *,
	ROW_NUMBER() over( partition by category order by sales desc ) as rn 
from cte ) ranked
where rn= 1

/* 1) find top 10 highest revenue generating products */

select TOP 10
	product_id, 
	sum(sale_price) as sales
from Retail_order_data
group by product_id
order by sales DESC


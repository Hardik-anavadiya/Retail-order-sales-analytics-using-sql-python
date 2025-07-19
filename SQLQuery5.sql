/* 5) which sub category had highest growth by profit in 2023 compare to 2022 */


WITH cte1 as(
select 
	sub_category,
	year(order_date) as order_year,
	sum(sale_price) as sales
from Retail_order_data
group by sub_category,year(order_date))
, cte2 as (
select sub_category, 
	sum(case when order_year=2022 then sales else 0 end) as sales_2022,
	sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte1 
group by sub_category
)
select top 1 *
,(sales_2023-sales_2022) AS Profit
from  cte2
order by Profit desc
/* 1) Find Top 10 Highest Revenue Generating Products */

SELECT TOP 10
    product_id, 
    SUM(sale_price) AS sales
FROM Retail_order_data
GROUP BY product_id
ORDER BY sales DESC;



/* 2) Find Top 5 Highest Selling Products in Each Region */

WITH CTE AS (
    SELECT
        region,
        product_id,
        SUM(sale_price) AS sales
    FROM Retail_order_data
    GROUP BY region, product_id
)
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY region ORDER BY sales DESC) AS rn
    FROM CTE
) AS ranked
WHERE rn < 5;



/* 3) Find Month-over-Month Growth Comparison for 2022 and 2023 */

WITH cte AS (
    SELECT 
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        ROUND(SUM(sale_price), 2) AS sales
    FROM Retail_order_data
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT 
    order_month,
    SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;



/* 4) For Each Category, Which Month Had the Highest Sales */

WITH cte AS (
    SELECT 
        category,
        FORMAT(order_date, 'yyyy/MM') AS order_year_month,
        SUM(sale_price) AS sales 
    FROM Retail_order_data
    GROUP BY category, FORMAT(order_date, 'yyyy/MM')
)
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rn
    FROM cte
) AS ranked
WHERE rn = 1;



/* 5) Sub-category with the Highest Growth by Profit in 2023 Compared to 2022 */

WITH cte1 AS (
    SELECT 
        sub_category,
        YEAR(order_date) AS order_year,
        SUM(sale_price) AS sales
    FROM Retail_order_data
    GROUP BY sub_category, YEAR(order_date)
),
cte2 AS (
    SELECT 
        sub_category, 
        SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
        SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
    FROM cte1 
    GROUP BY sub_category
)
SELECT TOP 1 *,
       (sales_2023 - sales_2022) AS Profit
FROM cte2
ORDER BY Profit DESC;

/* 2) find top 5 highest selling products in each region */
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
    FROM CTE ) AS ranked
WHERE rn < 5;




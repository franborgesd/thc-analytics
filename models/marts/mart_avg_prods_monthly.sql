-- calculates the avg products per month using the intermediate orders table:
SELECT
    month,
    AVG(qty_product) AS avg_products_per_order
FROM {{ ref('int_orders') }}
GROUP BY month
ORDER BY month

-- Counts the total orders for each year

SELECT
    COUNT (DISTINCT orders_id) AS total_orders,
    EXTRACT(YEAR FROM date) AS year,
FROM {{ ref('int_orders') }}
GROUP BY year

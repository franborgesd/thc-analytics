-- Using the intermediate stage from orders, it counts distinct orders per month and displays them grouped and ordered monthly:
SELECT 
    EXTRACT(MONTH FROM date) AS month,
    COUNT(DISTINCT orders_id) AS total_orders,
FROM {{ ref('int_orders') }}
GROUP BY month
ORDER BY month

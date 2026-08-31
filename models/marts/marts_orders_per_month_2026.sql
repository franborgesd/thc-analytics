SELECT 
    EXTRACT(MONTH FROM date) AS month,
    COUNT(DISTINCT orders_id) AS total_orders,
FROM {{ ref('int_orders') }}
GROUP BY month
ORDER BY month

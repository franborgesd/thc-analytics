-- Joins the staged tables to calculate the total products units acquired in each order. DATE_TRUNC helps future monthly analysis by truncating each order's timestamp to the first day of the month.

SELECT 
    o.orders_id,
    o.date,
    o.customers_id,
    o.net_sales,
    DATE_TRUNC(o.date, MONTH) AS month,
    SUM(s.quantity) AS qty_product
FROM {{ ref('stg_orders')}} AS o 
JOIN {{ ref('stg_sales')}} AS s
    ON o.orders_id = s.orders_id
WHERE o.date >= '2025-01-01'
  AND o.date < '2027-01-01'
GROUP BY
    o.orders_id,
    o.date,
    o.customers_id,
    o.net_sales
ORDER BY o.date 

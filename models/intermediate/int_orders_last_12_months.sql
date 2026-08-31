-- uses the 'int_orders' table to retrieve the orders from 2026 and returns NULL to cases with orders older that a 12 month period.

WITH orders_2026 AS (

    SELECT
        orders_id,
        customers_id,
        date
    FROM {{ ref('int_orders') }}
    WHERE date >= '2026-01-01'
      AND date < '2027-01-01'

)

SELECT
    o.orders_id AS reference_order,
    o.customers_id,
    o.date AS reference_date,
    p.orders_id AS previous_order,
    p.date AS previous_date

FROM orders_2026 AS o

LEFT JOIN {{ ref('int_orders') }} AS p
    ON o.customers_id = p.customers_id
    AND p.date < o.date
    AND p.date >= DATE_SUB(o.date, INTERVAL 12 MONTH)

ORDER BY
    o.customers_id,
    o.date,
    p.date

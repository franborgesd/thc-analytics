SELECT
    reference_order,
    customers_id,
    reference_date,

    COUNT(previous_order) AS order_count_12months,

    CASE
        WHEN COUNT(previous_order) = 0 THEN 'New'
        WHEN COUNT(previous_order) BETWEEN 1 AND 3 THEN 'Returning'
        ELSE 'VIP'
    END AS order_segmentation

FROM {{ ref('int_orders_last_12_months') }}

GROUP BY
    reference_order,
    customers_id,
    reference_date
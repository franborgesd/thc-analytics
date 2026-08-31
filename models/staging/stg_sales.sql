SELECT 
    PARSE_DATE('%Y-%m-%d', date_date) AS date,
    SAFE_CAST (customer_id AS INT64) AS customers_id,
    SAFE_CAST (order_id AS INT64) AS orders_id,
    SAFE_CAST (products_id AS INT64) AS products_id,
    SAFE_CAST (REPLACE (net_sales, ',', '.') as NUMERIC) AS net_sales,
    SAFE_CAST (qty AS INT64) AS quantity
FROM {{ source('thc', 'Sales') }}

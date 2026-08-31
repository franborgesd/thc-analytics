-- # Data preparation for orders file that uses the original 'Orders' file as source. Each column is renamed to mantain coherence between tables and data type are redefined so data can be accurately manipulated and transformed in later steps.
  

SELECT 
    PARSE_DATE('%Y-%m-%d', date_date) AS date,
    SAFE_CAST (customer_id AS INT64) AS customers_id,
    SAFE_CAST (order_id AS INT64) AS orders_id,
    SAFE_CAST (products_id AS INT64) AS products_id,
    SAFE_CAST (REPLACE (net_sales, ',', '.') as NUMERIC) AS net_sales,
    SAFE_CAST (qty AS INT64) AS quantity
FROM {{ source('thc', 'Sales') }}

-- # Data preparation for orders file that uses the original 'Orders' file as source. Each column is renamed to mantain coherence between tables and data type are redefined so data can be accurately manipulated and transformed in later steps.
  
```bash
SELECT 
    PARSE_DATE('%d/%m/%Y', date_date) AS date,
    SAFE_CAST (customers_id as INT64) AS customers_id,
    SAFE_CAST (orders_id as INT64) AS orders_id,
    SAFE_CAST (REPLACE (net_sales, ',', '.') as NUMERIC) AS net_sales
FROM {{ source('thc', 'Orders') }}
```

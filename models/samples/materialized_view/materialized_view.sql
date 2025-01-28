{{ config(materialized='materialized_view') }}

SELECT 
    RECEIPT_DATE,
    SUM(base_price) AS total_sales
FROM {{ ref('order_items') }}
GROUP BY 1
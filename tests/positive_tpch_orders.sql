Select *
FROM {{ ref('stg_orders') }}
WHERE total_price<0
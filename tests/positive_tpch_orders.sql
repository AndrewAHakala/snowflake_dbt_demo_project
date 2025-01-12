Select *
FROM {{ ref('stg_orders') }}
WHERE o_totalprice<0
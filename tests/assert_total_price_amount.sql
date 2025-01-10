Select o_orderkey
,sum(o_totalprice) as agg_price
FROM {{ ref('dim_customer_orders') }}
GROUP BY 1
HAVING sum(o_totalprice)<0
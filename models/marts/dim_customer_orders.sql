SELECT
    c.c_custkey,
    c.c_name,
    o.o_orderkey,
    o.o_orderdate,
    o.o_totalprice
  FROM {{ ref('stg_customer') }} c
    JOIN  {{ ref('stg_orders') }} o ON c.c_custkey = o.o_custkey
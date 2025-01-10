SELECT
    c.c_custkey,
    c.c_name,
    c.o_orderkey,
    c.o_orderdate,
    c.o_totalprice,
    li.l_linenumber,
    li.l_partkey,
    li.l_quantity,
    li.l_extendedprice
  FROM {{ ref('dim_customer_orders') }} c
    JOIN {{ ref('stg_line_items') }} li ON c.o_orderkey = li.l_orderkey
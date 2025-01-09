SELECT
    customer_orders.c_custkey,
    customer_orders.c_name,
    customer_orders.o_orderkey,
    customer_orders.o_orderdate,
    customer_orders.o_totalprice,
    lineitem.l_linenumber,
    lineitem.l_partkey,
    lineitem.l_quantity,
    lineitem.l_extendedprice
  FROM {{ ref('customer_orders') }} c
    JOIN {{ ref('line_items') }} li ON c.o_orderkey = li.l_orderkey
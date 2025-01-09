SELECT
    c.c_custkey,
    c.c_name,
    o.o_orderkey,
    o.o_orderdate,
    o.o_totalprice
  FROM tpch_data.customer c
    JOIN  tpch_data.orders o ON c.c_custkey = o.o_custkey
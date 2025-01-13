SELECT
  oli.o_custkey,
  oli.p_name,
  oli.o_orderkey,
  oli.o_orderdate,
  oli.o_totalprice,
  oli.l_linenumber,
  oli.l_partkey,
  oli.l_quantity,
  oli.l_extendedprice,
  SUM(oli.l_extendedprice) OVER (
    PARTITION BY oli.o_custkey
    ORDER BY
      oli.o_orderdate
  ) AS running_total
FROM
  {{ ref('fct_order_items') }} oli
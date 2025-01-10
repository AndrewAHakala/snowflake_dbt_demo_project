SELECT
li.l_orderkey,
li.l_linenumber,
    li.l_partkey,
    li.l_quantity,
    li.l_extendedprice
  FROM {{ source('tpch', 'lineitem') }} li
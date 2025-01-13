--testing template functionality 
SELECT o.o_orderkey
,o.o_custkey
,l.l_partkey
,l.l_suppkey
,o.o_orderstatus
,o.o_totalprice
,o.o_orderdate
,o.o_orderpriority
,l.l_linenumber
,l.l_quantity
,l.l_extendedprice
,l.l_discount
,l.l_tax
,l.l_returnflag
,l.l_shipdate
,l.l_commitdate
,l.l_receiptdate
,l.l_shipinstruct
,o.created_timestamp as order_created_timestamp
,l.created_timestamp as lineitem_created_timestamp
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_line_items') }} l ON o.o_orderkey = l.l_orderkey
WHERE o.o_totalprice > 10
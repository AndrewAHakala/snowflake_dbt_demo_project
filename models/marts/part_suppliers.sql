SELECT ps.ps_partkey
,ps.ps_suppkey
,ps.ps_availqty
,ps.ps_supplycost
,p.p_name
,p.p_mfgr
,p.p_brand
,p.p_type
,p.p_size
,p.p_container
,p.p_retailprice
,p.p_comment
,s.s_name
,s.s_address
,s.s_nationkey
,ps.created_timestamp as ps_created_timestamp
,p.created_timestamp as p_created_timestamp
,s.created_timestamp as s_created_timestamp
FROM {{ ref('stg_partsupp') }} ps
LEFT JOIN {{ ref('stg_part') }} p ON ps.ps_partkey = p.p_partkey 
LEFT JOIN {{ ref('stg_supplier') }} s ON ps.ps_suppkey = s.s_suppkey
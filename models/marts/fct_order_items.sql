  SELECT ps.*
    ,oi.*
    FROM {{ ref('part_suppliers') }} ps 
    JOIN {{ ref('order_items') }} oi ON ps.ps_partkey = oi.l_partkey 
                        AND ps.ps_suppkey = oi.l_suppkey
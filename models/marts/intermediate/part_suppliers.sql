with part as (
    select * from {{ ref('stg_part') }}
),

supplier as (

    select * from {{ ref('stg_supplier') }}

),

part_supplier as (

    select * from {{ ref('stg_partsupp') }}

),

final as (
    select 

    ps.part_supplier_key,
    p.part_key,
    p.name as part_name,
    p.manufacturer,
    p.brand,
    p.type as part_type,
    p.size as part_size,
    p.container,
    p.retail_price,

    s.supplier_key,
    s.supplier_name,
    s.supplier_address,
    s.phone_number,
    s.account_balance,
    s.nation_key,

    ps.available_quantity,
    ps.cost
from
    part p
inner join 
    part_supplier ps
        on p.part_key = ps.part_key
inner join
    supplier s
        on ps.supplier_key = s.supplier_key
order by
    p.part_key
)

select * from final
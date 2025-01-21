{{
    config(
        materialized = 'table',
        transient=false
    )
}}

with customer as (
    select * from {{ ref('stg_tpch_customers') }}
),
nation as (
    select * from {{ ref('stg_tpch_nations') }}
),
region as (
    select * from {{ ref('stg_tpch_regions') }}
),
customer_flags as (
    select * from {{ ref('customer_flags') }}
),

final as (
    select 
        c.customer_key,
        c.name,
        c.address,
        --- Break the contract 
        -- nation.nation_key as nation_key, 
        n.name as nation,
        --- Break the contract again
        -- region.region_key as region_key,
        r.name as region,
        c.phone_number,
        c.account_balance,
        c.market_segment,
        cf.lifetime_value,
        cf.is_high_value,
        cf.is_mid_value,
        cf.is_low_value
    from
        customer c
        inner join nation n
            on c.nation_key = n.nation_key
        inner join region r
            on n.region_key = r.region_key
        left join customer_flags cf
            on c.customer_key = cf.customer_key
)
select 
    *
from
    final
order by
    customer_key
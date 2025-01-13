{{
    config(
        materialized='table'
    )
}}

with customer as (
    select * from {{ ref('stg_customers') }}
),
    orders as (
    select * from {{ ref('stg_orders') }}
),
    
    final as (
    select
        c.customer_key,
        coalesce(sum(o.total_price),0) as lifetime_value,
        iff(lifetime_value > 3000000, 'Y', 'N') as is_high_value,
        iff(lifetime_value between 1000000 and 2999999, 'Y', 'N') as is_mid_value,
        iff(lifetime_value between 0 and 999999, 'Y','N') as is_low_value
    from customer c
        inner join orders o
            on c.customer_key = o.customer_key
    group by 1
)

select * from final
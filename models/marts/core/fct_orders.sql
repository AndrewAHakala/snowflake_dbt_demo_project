{{
    config(
        materialized = 'table',
        tags=['finance']
    )
}}

with orders as (
    select * from {{ ref('stg_orders') }} 
),
order_item as (
    select * from {{ ref('order_items') }}
),
order_item_summary as (

    select 
        order_key,
        sum(gross_item_sales_amount) as gross_item_sales_amount,
        sum(item_discount_amount) as item_discount_amount,
        sum(item_tax_amount) as item_tax_amount,
        sum(net_item_sales_amount) as net_item_sales_amount,
        count_if( is_return = true ) as return_count
    from order_item
    group by
        1
),
final as (

    select 

        o.order_key, 
        o.order_date,
        --o.order_time,
        o.customer_key,
        o.status_code,
        o.priority_code,
        o.clerk_name,
        o.ship_priority,     
        1 as order_count,
        0 as flag,
        ois.return_count,             
        ois.gross_item_sales_amount,
        ois.item_discount_amount,
        ois.item_tax_amount,
        ois.net_item_sales_amount
    from
        orders o
        inner join order_item_summary ois
            on o.order_key = ois.order_key
)
select 
    *
from
    final

order by
    order_date
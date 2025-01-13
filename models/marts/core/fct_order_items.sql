{{
    config(
        materialized = 'table',
        tags = ['finance']
    )
}}

with order_item as (
    
    select * from {{ ref('order_items') }}

),
part_supplier as (
    
    select * from {{ ref('part_suppliers') }}

),
final as (
    select 
        oi.order_item_key,
        oi.order_key,
        oi.order_date,
        oi.customer_key,
        oi.part_key,
        oi.supplier_key,
        oi.order_item_status_code,
        oi.is_return,
        oi.line_number,
        oi.ship_date,
        oi.commit_date,
        oi.receipt_date,
        oi.ship_mode,
        ps.cost as supplier_cost,
        {# ps.retail_price, #}
        oi.base_price,
        oi.discount_percentage,
        oi.discounted_price,
        oi.tax_rate,
        ps.nation_key,
        1 as order_item_count,
        oi.quantity,
        oi.gross_item_sales_amount,
        oi.discounted_item_sales_amount,
        oi.item_discount_amount,
        oi.item_tax_amount,
        oi.net_item_sales_amount

    from
        order_item oi
        inner join part_supplier ps
            on oi.part_key = ps.part_key and
                oi.supplier_key = ps.supplier_key
)
select 
    *
from
    final
order by
    order_date
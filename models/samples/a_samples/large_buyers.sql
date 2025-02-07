{{
    config(
        materialized='table',
        tags='customer_reporting'
    )
}}

select
    concat_ws(' ', fname, lname) as customer_full_name,
    sum(total_transaction) as customer_lifetime_spend

from {{ ref('customer_purchases') }}
    group by customer_full_name
    having customer_lifetime_spend > {{ var('large_customer_threshold') }}
    order by customer_lifetime_spend desc
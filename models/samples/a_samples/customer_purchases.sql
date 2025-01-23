{{
    config(
        materialized='table',
        tags='customer_reporting'
    )
}}

with purchases_fct as (

    Select * from {{ ref('stg_purchases_fct') }}


),

customer_dim as ( Select * from {{ ref('stg_customer_dim') }} )


Select 
    a.customer_id,
    b.fname,
    b.lname,
    b.customer_join_date,
    SUM(transaction_amount) as total_transaction
From purchases_fct a
    left join customer_dim b 
        on a.customer_id = b.customer_id
group by 
    a.customer_id,
    b.fname,
    b.lname,
    b.customer_join_date
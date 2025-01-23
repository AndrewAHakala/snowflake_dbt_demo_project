{% macro customer_lifetime_value_macro(customer_id) -%}


    select 
    customer_id,
    concat_ws(' ', fname, lname) as customer_name,
    TRIM(to_varchar(total_transaction::decimal(16,3),'$999,999,999,999.00')) as customer_lifetime_value,
    datediff(month, customer_join_date, current_date()) as number_of_months_as_customer,
    TRIM(to_varchar((total_transaction / datediff(month, customer_join_date, current_date()))::decimal(16,3),'$999,999,999,999.00')) as customer_spend_per_month,
    customer_join_date

from {{ ref('customer_purchases') }}
where customer_id = {{ customer_id }}



{%- endmacro %}
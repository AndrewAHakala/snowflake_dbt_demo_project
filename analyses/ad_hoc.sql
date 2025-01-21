Select count(distinct name)
from {{ ref('stg_tpch_customers') }}
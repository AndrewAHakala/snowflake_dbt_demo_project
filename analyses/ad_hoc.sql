Select count(distinct name)
from {{ ref('stg_customer') }}
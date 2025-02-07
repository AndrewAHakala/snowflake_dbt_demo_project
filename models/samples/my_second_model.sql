select *
,10 as new_column
,'this is my second great column' as new_column_two
from {{ ref('my_first_model') }}

with
    table_one as (
        select
            'this is great!' as my_frist_column,
            1 / 565 as a_simple_calculation,
            current_timestamp() as current_time_ts
    ),

    table_two as (
        select
            'this is great!' as my_frist_column,
            1 / 60000 as a_simple_calculation,
            current_timestamp() as current_time_ts
    )

select *
from table_one
union all
select *
from table_two
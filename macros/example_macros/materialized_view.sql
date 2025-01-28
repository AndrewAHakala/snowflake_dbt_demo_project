{% materialization materialized_view, adapter='snowflake' %}
    {%- set identifier = model['alias'] -%}
    {%- set target_relation = api.Relation.create(
        identifier=identifier,
        schema=schema,
        database=database,
        type='view'
    ) -%}

    {{ run_hooks(pre_hooks) }}

    -- drop the existing materialized view
    {% call statement('drop_materialized_view') -%}
        DROP MATERIALIZED VIEW IF EXISTS {{ target_relation }}
    {%- endcall %}

    -- create the materialized view
    {% call statement('main') -%}
        CREATE MATERIALIZED VIEW {{ target_relation }} AS (
            {{ sql }}
        )
    {%- endcall %}

    {{ run_hooks(post_hooks) }}

    {% do persist_docs(target_relation, model) %}

    {{ return({'relations': [target_relation]}) }}
{% endmaterialization %}
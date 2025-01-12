SELECT *
  FROM {{ source('tpch', 'lineitem') }} li
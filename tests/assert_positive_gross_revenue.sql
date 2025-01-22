Select *
FROM {{ ref('monthly_gross_revenue') }}
WHERE gross_revenue<0
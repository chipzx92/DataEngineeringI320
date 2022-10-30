{{ config(
    materialized="table",
    indexes=[
      {'columns': ['venue_name']},
      {'columns': ['performance_id']},
    ]
) }}
SELECT f.venue_id,
       v.venue_name,
       f.performance_id,
       p.performance_start AS performance_date,
       f.person_id,
       f.ticket_price,
       v.capacity
FROM {{ ref('ticket_sales_facts') }} as f
JOIN {{ ref('venues_dimension') }} AS v USING (venue_id)
JOIN {{ ref('performances_dimension') }} AS p USING (performance_id)

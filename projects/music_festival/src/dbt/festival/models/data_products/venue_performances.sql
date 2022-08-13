{{ config(
    materialized="table"
) }}
SELECT f.venue_id,
       v.venue_name,
       f.performance_id,
       f.people_id,
       f.ticket_price,
       v.capacity
FROM {{ ref('band_performance_facts') }} as f
JOIN {{ ref('venues_dimension') }} AS v USING (venue_id)
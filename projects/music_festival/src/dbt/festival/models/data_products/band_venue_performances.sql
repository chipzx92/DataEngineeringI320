{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['band_name']},
      {'columns': ['venue_name']},
      {'columns': ['performance_id']},
    ]

)}}
SELECT b.band_id,
       b.band_name,
       v.venue_id,
       v.venue_name,
       p.performance_id,
       p.performance_start AS performance_date,
       v.capacity,
       bdf.ticket_price
FROM   {{ ref('band_performance_facts') }} AS bdf
JOIN   {{ ref('bands_dimension') }} AS b USING (band_id)
JOIN   {{ ref('performances_dimension') }} AS p USING (performance_id)
JOIN   {{ ref('venues_dimension') }} AS v USING (venue_id)

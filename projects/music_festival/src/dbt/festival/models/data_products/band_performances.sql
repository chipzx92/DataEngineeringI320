{{ config(
    materialized="table",
    indexes=[
      {'columns': ['band_name']},
      {'columns': ['performance_id']},
    ]
) }}
SELECT b.band_id,
       b.band_name,
       f.performance_id,
       TO_DATE(TO_CHAR(performance_start, 'YYYY-MM-DD'), 'YYYY-MM-DD') AS performance_date,
       f.ticket_price
FROM {{ ref('band_performance_facts') }} AS f
JOIN {{ ref('bands_dimension') }} AS b USING (band_id)
JOIN {{ ref('performances_dimension') }} AS p USING (performance_id)

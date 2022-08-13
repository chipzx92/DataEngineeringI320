{{ config(
    materialized="table"
) }}
SELECT id AS performance_id,
       performance_start,
       performance_end
FROM   festival.performances

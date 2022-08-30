{{ config(
    materialized="table"
) }}
SELECT id AS performance_id,
       performance_start
FROM   festival.performances

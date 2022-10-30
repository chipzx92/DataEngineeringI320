{{ config(
    materialized="table"
) }}
SELECT id AS venue_id,
       name AS venue_name,
       capacity
FROM   festival.venues

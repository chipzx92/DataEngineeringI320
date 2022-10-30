{{ config(
    materialized="table"
) }}
SELECT id AS band_id,
       name AS band_name,
       fee AS band_fee
FROM   festival.bands

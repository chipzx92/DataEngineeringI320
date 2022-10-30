{{ config(
    materialized="table"
) }}
SELECT id AS purchase_id,
       purchase_date AS purchase_date
FROM   festival.purchases

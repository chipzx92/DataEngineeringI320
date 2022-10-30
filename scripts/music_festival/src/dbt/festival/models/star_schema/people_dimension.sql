{{ config(
    materialized="table"
) }}
SELECT id as person_id, 
       name AS person_name
FROM   festival.people

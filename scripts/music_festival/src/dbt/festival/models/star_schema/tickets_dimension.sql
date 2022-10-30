{{ config(
    materialized="table"
) }}
SELECT id AS ticket_id,
       ticketnum
FROM   festival.tickets

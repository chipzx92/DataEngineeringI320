{{
   config(
     materialized="table"
   )
}}
SELECT b.band_id,
       b.band_name,
       v.venue_id,
       v.venue_name,
       AVG(t.ticket_price) AS average_ticket_price
FROM   {{ ref('ticket_sales_facts') }} AS t
JOIN   {{ ref('bands_dimension') }} AS b ON (t.band_id = b.band_id)
JOIN   {{ ref('venues_dimension') }} AS v ON (t.venue_id = v.venue_id)
GROUP BY b.band_id, b.band_name, v.venue_id, v.venue_name
HAVING AVG(t.ticket_price) >= 25
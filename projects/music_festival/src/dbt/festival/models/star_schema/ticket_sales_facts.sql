{{ config(
    materialized="table"
) }}
SELECT b.band_id,
       v.venue_id,
       f.id AS performance_id,
       c.id AS purchase_id,
       t.id AS ticket_id,
       p.person_id,
       t.price AS ticket_price       
FROM   festival.performances AS f
JOIN   festival.tickets AS t ON (t.performance_id = f.id)
JOIN   festival.purchases AS c ON (c.id = t.purchase_id)
JOIN   {{ ref('bands_dimension') }} AS b ON (f.band_id = b.band_id)
JOIN   {{ ref('venues_dimension') }} AS v ON (v.venue_id = f.venue_id)
JOIN   {{ ref('people_dimension') }} AS p ON (p.person_id = c.person_id)


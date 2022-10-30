{{ config(
    materialized="table"
) }}
SELECT b.id AS band_id, 
       v.id AS venue_id,
       f.id AS performance_id,
       c.id AS purchase_id,
       t.id AS ticket_id,
       p.id AS people_id,
       t.price AS ticket_price       
FROM   festival.bands AS b
LEFT OUTER JOIN   festival.performances AS f ON (b.id = f.band_id)
JOIN   festival.venues AS v ON (v.id = f.venue_id)
JOIN   festival.tickets AS t ON (t.performance_id = f.id)
LEFT OUTER JOIN   festival.purchases AS c ON (c.id = t.purchase_id)
LEFT OUTER JOIN   festival.people AS p ON (p.id = c.person_id)

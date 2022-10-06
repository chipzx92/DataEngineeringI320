# Class 4: Live demo pipeline

1. Chip logs in, demos full pipeline (15m, 15)
2. Send invite to James, James accepts on screen, sets up and logs in runs pipeline (10m, 25)
3. Invites out to the students (not Dhanny) (5m, 30)
4. Walk around make sure students are and where they need to be (15m, 45)
5. Walk students through running the work flow. (15,60)
6. Release and Introduce the homework (10,70)

-------------

SELECT *
FROM ticket_facts;

SELECT SUM(price) AS all_time_revenue
FROM ticket_facts;


SELECT venue_id, SUM(price) AS all_time_revenue_per_venue
FROM ticket_facts
GROUP BY venue_id

-- lookup the venue name for each row.
SELECT venue_name, 
       SUM(price) AS all_time_revenue_per_venue
FROM ticket_facts AS f
  JOIN venue_dimension AS v ON f.venue_id = v.id  
GROUP BY venue_id

SELECT band_id, SUM(price) AS  all_time_revenue_per_band
FROM ticket_facts AS f
GROUP BY band_id

SELECT band_id, SUM(price) AS  all_time_revenue_per_band
FROM ticket_facts AS f
  JOIN band_dimension AS v ON f.band_id = b.id  
GROUP BY band_id

-- revenue by band and venue.
SELECT *
FROM ticket_facts AS f;

SELECT venue_id, band_id, SUM(price) AS all_time_revenue
FROM ticket_facts AS f
GROUP BY venue_id, band_id;

-- do lookups for venues/bands
SELECT venue_id, band_id, SUM(price) AS all_time_revenue
FROM ticket_facts AS f
  JOIN venue_dimension AS v ON f.venue_id = v.id
  JOIN band_dimension AS b ON f.band_id = b.id
GROUP BY venue_id, band_id;

-- ticketsales:
SELECT venue_id, band_id, COUNT(*) AS all_time_ticket_sales
FROM ticket_facts AS f
  JOIN venue_dimension AS v ON f.venue_id = v.id
  JOIN band_dimension AS b ON f.band_id = b.id
GROUP BY venue_id, band_id;

SELECT *
FROM ticket_facts AS f;

-- look up time of purchase
SELECT *
FROM ticket_facts AS f
  JOIN purchase_dimension AS p ON f.purchase_id = p.id

-- Now we can extract the Year and Month.
SELECT EXTRACT(YEAR FROM purchase_date) AS purchase_year,
       EXTRACT(MONTH FROM purchase_date) AS purchase_month,
       SUM(price) as revenue,
       *
FROM ticket_facts AS f
  JOIN purchase_dimension AS p ON f.purchase_id = p.id
GROUP BY EXTRACT(YEAR FROM purchase_date) AS purchase_year,
         EXTRACT(MONTH FROM purchase_date) AS purchase_month

-- can now add venue/band groupings.

time_dimension.by_quarter ("2011-Q1")


telematics

cars owned by dealers by brand





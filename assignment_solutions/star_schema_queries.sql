-- Which venues were the most popular? Return the the id and name of the venue
-- by number of tickets sold
-- by revenue (ticket sales)

-- Aggregate function - counts all records
SELECT COUNT(*) as tickets_sold
FROM   ticket_sales_facts AS t;

-- Join to venues dimension - counts all records
SELECT COUNT(*) as tickets_sold
FROM   ticket_sales_facts AS t
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id);

-- Group by venue_id - groups counts by venue
SELECT v.venue_id, COUNT(*) as tickets_sold
FROM   ticket_sales_facts AS t
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP  BY v.venue_id;

-- Add venue_name
SELECT v.venue_id, v.venue_name, COUNT(*) as tickets_sold
FROM   ticket_sales_facts AS t
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP  BY v.venue_id, v.venue_name;

-- Order by highest to lowest
SELECT v.venue_id, v.venue_name, COUNT(*) as tickets_sold
FROM   ticket_sales_facts AS t
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP  BY v.venue_id, v.venue_name
ORDER BY tickets_sold DESC;

-- by revenue

SELECT v.venue_id, v.venue_name, COUNT(*) AS tickets_sold
FROM   ticket_sales_facts AS t
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP BY v.venue_id, v.venue_name
ORDER BY tickets_sold DESC;

SELECT v.venue_id, v.venue_name, SUM(t.ticket_price) AS ticket_sales
FROM   ticket_sales_facts AS t
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP BY v.venue_id, v.venue_name
ORDER BY ticket_sales DESC;

-- What were the top 10 most popular bands? Return the id and name of the band
-- by number of tickets sold
-- by revenue (ticket sales)
SELECT b.band_id, b.band_name, COUNT(*) AS tickets_sold
FROM   ticket_sales_facts AS t
JOIN   bands_dimension AS b ON (t.band_id = b.band_id)
GROUP BY b.band_id, b.band_name
ORDER BY tickets_sold DESC
LIMIT 10;

SELECT b.band_id, b.band_name, SUM(ticket_price) AS ticket_sales
FROM   ticket_sales_facts AS t
JOIN   bands_dimension AS b ON (t.band_id = b.band_id)
GROUP BY b.band_id, b.band_name
ORDER BY ticket_sales DESC
LIMIT 10;

-- What were the top 10 performances? (this is the combination of band and venue)
-- by number of tickets sold
-- by revenue (ticket sales)
SELECT b.band_id, b.band_name, v.venue_id, v.venue_name, COUNT(*) as tickets_sold
FROM   ticket_sales_facts AS t
JOIN   bands_dimension AS b ON (t.band_id = b.band_id)
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP  BY b.band_id, b.band_name, v.venue_id, v.venue_name
ORDER BY tickets_sold DESC
LIMIT 10;

SELECT b.band_id, b.band_name, v.venue_id, v.venue_name, SUM(ticket_price) AS ticket_sales
FROM   ticket_sales_facts AS t
JOIN   bands_dimension AS b ON (t.band_id = b.band_id)
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP  BY b.band_id, b.band_name, v.venue_id, v.venue_name
ORDER BY ticket_sales DESC
LIMIT 10;

-- What was the highest, lowest, and average price of a ticket? Order it by average ticket price
-- by band (top 10)
-- by venue
-- by performance (top 10)

SELECT b.band_id,
       b.band_name,
       MAX(ticket_price) AS highest_ticket_price,
       MIN(ticket_price) AS lowest_ticket_price,
       AVG(ticket_price) AS average_ticket_price
FROM   ticket_sales_facts AS t
JOIN   bands_dimension AS b ON (t.band_id = b.band_id)
GROUP BY b.band_id, b.band_name
ORDER BY average_ticket_price DESC
LIMIT 10;

SELECT v.venue_id,
       v.venue_name,
       MAX(ticket_price) AS highest_ticket_price,
       MIN(ticket_price) AS lowest_ticket_price,
       AVG(ticket_price) AS average_ticket_price
FROM   ticket_sales_facts AS t
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP BY v.venue_id, v.venue_name
ORDER BY average_ticket_price DESC;

SELECT b.band_id,
       b.band_name,
       v.venue_id,
       v.venue_name,
       MAX(ticket_price) AS highest_ticket_price,
       MIN(ticket_price) AS lowest_ticket_price,
       AVG(ticket_price) AS average_ticket_price
FROM   ticket_sales_facts AS t
JOIN   bands_dimension AS b ON (t.band_id = b.band_id)
JOIN   venues_dimension AS v ON (t.venue_id = v.venue_id)
GROUP BY b.band_id, b.band_name, v.venue_id, v.venue_name
ORDER BY average_ticket_price DESC
LIMIT 10;

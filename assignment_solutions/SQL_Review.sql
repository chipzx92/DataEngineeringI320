--Question 1
SELECT fee
FROM   bands
WHERE  name = 'Cut Copy';
-- 200

-- Question 2
SELECT price
FROM   tickets
WHERE  ticketnum = 'TT00000024794196';
-- 10

-- Question 3
SELECT *
FROM   purchases
WHERE  purchase_date BETWEEN '2010-01-01' AND '2010-12-31'
ORDER  BY purchase_date
LIMIT  1;
-- 687998 2010-04-08%09:00:00+00:00 35

-- Question 4
SELECT name,
       capacity
FROM   venues
ORDER  BY capacity
LIMIT 3;
-- La Zona Rosa 500
-- Austin Music Hall 600
-- AMD 700

-- Question 5
SELECT DISTINCT price
FROM   tickets
ORDER BY price DESC;
-- 40 35 30 25 20 15 10

-- Question 6
-- Change COUNT(band_name) TO COUNT(DISTINCT band_name)
SELECT EXTRACT(YEAR from performance_date), COUNT(DISTINCT band_name)
FROM band_performances
GROUP BY EXTRACT(YEAR from performance_date);

-- Question 7
SELECT SUM(price) as revenue
FROM   tickets;
--89152630

-- Question 8
SELECT performance_id, AVG(price) AS average_ticket_price
FROM   tickets
GROUP  BY performance_id
ORDER  BY average_ticket_price DESC
LIMIT  1;
-- 175 26.673866090712743

-- Question 9
SELECT performance_id, COUNT(*) AS tickets_sold
FROM   tickets
GROUP BY performance_id
ORDER BY tickets_sold DESC
LIMIT 1;
-- 566 2819

-- Question 10
-- Because the 3 bands had a total of 8 performances (or words to that affect)

-- Question 11
SELECT COUNT(DISTINCT band_id) AS count_of_bands
FROM   performances;
-- or
SELECT COUNT(DISTINCT b.name) AS count_of_bands
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id);
-- 1417

-- Question 12
SELECT COUNT(DISTINCT b.name) AS count_of_bands
FROM   performances AS p
JOIN   bands AS b ON (b.id = p.band_id)
JOIN   venues AS v ON (v.id = p.venue_id)
WHERE  p.performance_start < '2011-01-01'
  AND  v.name IN ('BMI', 'Honda', 'Austin Kiddie Limits');
-- 205

-- Question 13
SELECT b.name
FROM   bands AS b
LEFT JOIN   performances AS p ON (b.id = p.band_id)
WHERE performance_start IS NULL;
-- Dua Lipa, Taylor Swift, Beyonce, Rolling Stones

-- Question 14
SELECT v.name
FROM   venues AS v
LEFT JOIN performances AS p ON (v.id = p.venue_id)
WHERE performance_start IS NULL;
-- La Zona Rosa, Austin Music Hall

-- Question 15
SELECT b.name AS band_name, v.name AS venue_name
FROM   performances AS p
FULL JOIN venues AS v ON (v.id = p.venue_id)
FULL JOIN bands AS b ON (b.id = p.band_id)
WHERE performance_start IS NULL;
-- band name: Dua Lipa, Taylor Swift, Beyonce, Rolling Stones
-- venue_name: La Zona Rosa, Austin Music Hall

-- Question 16: How many different bands played in each venue in 2012?
SELECT v.name AS venue_name, COUNT(DISTINCT b.name) AS count_of_bands
FROM   performances AS p
JOIN   bands AS b ON (b.id = p.band_id)
JOIN   venues AS v ON (v.id = p.venue_id)
WHERE  performance_start BETWEEN '2012-01-01' AND '2012-12-31'
GROUP BY venue_name;
-- AMD 9, Auditorium Shores 9, Austin Kiddie Limits 9, Austin Ventures 9,
-- BMI 7, Bud Light 6, Google+ 12, Honda 9, Vista Equity 7

-- Question 17: What band has had the highest revenue in the history of the festival?
SELECT b.name AS band_name, SUM(price) AS ticket_sales_revenue
FROM   bands AS b
JOIN   performances AS p ON (b.id = p.band_id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY band_name
ORDER BY ticket_sales_revenue DESC
LIMIT 1;
-- Asleep at the Wheel 701585

-- Question 18: What 4 bands have played the most performances across the history of the festival?
SELECT b.name AS band_name, COUNT(DISTINCT p.id) AS performances
FROM   bands AS b
JOIN   performances AS p ON (b.id = p.band_id)
GROUP BY band_name
ORDER BY performances DESC
LIMIT 4;
-- Asleep at the Wheel 20; Gary Clark Jr 8; Spoon 8; School of Rock 7

-- Question 19: Which 3 venues had the highest overall revenue in 2019?
SELECT v.name AS venue_name, SUM(price) AS ticket_sales_revenue
FROM   venues AS v
JOIN   performances AS p ON (v.id = p.venue_id)
JOIN   tickets AS t ON (t.performance_id = p.id)
WHERE  performance_start BETWEEN '2019-01-01' AND '2019-12-31'
GROUP  BY venue_name
ORDER BY ticket_sales_revenue DESC
LIMIT 3;
-- Vista Equity: 1071225
-- Google+: 1064575
-- Austin Ventures: 1049965

-- Question 20: What 5 performances had the highest revenue in the history of the festival?
SELECT v.name AS venue_name,
       b.name AS band_name,
       p.performance_start,
       SUM(t.price) AS ticket_sales_revenue
FROM   performances AS p
JOIN   bands AS b ON (b.id = p.band_id)
JOIN   venues AS v ON (v.id = p.venue_id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY v.name, b.name, p.performance_start
ORDER BY ticket_sales_revenue DESC
LIMIT 5;
-- Austin Kiddie Limits presented by H-E-B	Dave Matthews Band	  2009-10-03T21:00:00+00:00	69045
-- Austin Kiddie Limits presented by H-E-B	Phoenix	              2018-10-07T18:00:00+00:00	67400
-- Austin Ventures	                        Modest Mouse.       	2004-09-18T20:00:00+00:00	67230
-- Austin Kiddie Limits presented by H-E-B	Indigo Girls	        2007-09-15T17:00:00+00:00	67190
-- Austin Kiddie Limits presented by H-E-B	The Wind and the Wave	2015-10-03T16:00:00+00:00	64815

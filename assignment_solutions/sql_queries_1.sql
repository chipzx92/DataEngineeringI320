-- 2.1 What fee does Cut Copy charge?
--> 200
SELECT *
FROM bands

SELECT *
FROM bands
WHERE bands.name = 'Cut Copy'

SELECT bands.fee
FROM bands
WHERE bands.name = 'Cut Copy'

-- 2.2 What was the price of ticket number TT00000024794196?
--> 10
SELECT *
FROM tickets

SELECT *
FROM tickets
WHERE tickets.ticketnum = 'TT00000024794196'

SELECT tickets.price
FROM tickets
WHERE tickets.ticketnum = 'TT00000024794196'

-- 2.3 Which venues have capacities greater than 2000?
--> Austin Kiddie Limits, 3
SELECT *
FROM venues

SELECT *
FROM venues
WHERE venues.capacity > 2000

SELECT venues.name, venues.id
FROM venues
WHERE venues.capacity > 2000


--2.4 When was the first ticket purchased in 2010?  Use BETWEEN in the WHERE clause to filter for just the 2010 purchases
--> 2010-04-08T09:00:00+00:00
SELECT *
FROM purchases

SELECT *
FROM purchases
WHERE purchase_date BETWEEN '2010-01-01' AND '2010-12-31 '

SELECT *
FROM purchases
WHERE purchase_date BETWEEN '2010-01-01' AND '2010-12-31'
ORDER BY purchase_date ASC
LIMIT 1

--2.5 How many different prices were used for tickets, across all festival years?
--> 7

SELECT *
FROM tickets

SELECT DISTINCT price
FROM tickets

SELECT COUNT(DISTINCT price)
FROM tickets

--2.6 How many different bands played across the whole festival?  Use the analytics.band_venue_performances table.
--> 1417

SELECT *
FROM band_venue_performances

SELECT DISTINCT band_name
FROM band_venue_performances

SELECT COUNT(DISTINCT band_name) -- or band_id
FROM band_venue_performances

--2.6 How many different bands played in either the BMI, Honda, or Austin Kiddie Limits venues in the period before 2011.  (review class notes about alternative values, near where we discussed OR)
--> 205

SELECT *
FROM band_venue_performances

SELECT *
FROM band_venue_performances
WHERE venue_name IN ('BMI', 'Honda', 'Austin Kiddie Limits')

-- can validate that no typos in your IN list:
-- SELECT DISTINCT venue_name
-- FROM band_venue_performances
-- WHERE venue_name IN ('BMI', 'Honda', 'Austin Kiddie Limits')

SELECT *
FROM band_venue_performances
WHERE venue_name IN ('BMI', 'Honda', 'Austin Kiddie Limits')
  AND performance_date < '2010-12-31'

SELECT COUNT(DISTINCT band_name)
FROM band_venue_performances
WHERE venue_name IN ('BMI', 'Honda', 'Austin Kiddie Limits')
  AND performance_date < '2010-12-31'

-- 2.7 How many different bands played in each venue in 2012?  Use band_venue_performances
-- AMD	9
-- Auditorium Shores	9
-- Austin Kiddie Limits	9
-- Austin Ventures	9
-- BMI	7
-- Bud Light	6
-- Google+	12
-- Honda	9
-- Vista Equity	7
SELECT *
FROM band_venue_performances

SELECT *
FROM band_venue_performances
WHERE performance_date BETWEEN '2012-01-01' AND '2012-12-31'
--> 115402 because there is one row per ticket

SELECT *
FROM band_venue_performances
WHERE performance_date BETWEEN '2012-01-01' AND '2012-12-31'
ORDER BY venue_name

SELECT venue_name, COUNT(DISTINCT band_name)
FROM band_venue_performances
WHERE performance_date BETWEEN '2012-01-01' AND '2012-12-31'
GROUP BY venue_name

-- AMD	9
-- Auditorium Shores	9
-- Austin Kiddie Limits	9
-- Austin Ventures	9
-- BMI	7
-- Bud Light	6
-- Google+	12
-- Honda	9
-- Vista Equity	7

-- 2.8 What was the revenue received across the whole of the history of the festival? revenue is the money received from ticket sales.

--> 89152630

SELECT *
FROM band_venue_performances

SELECT SUM(ticket_price) AS total_revenue
FROM band_venue_performances


-- 2.9 Which 3 venues have the highest overall revenue?

SELECT *
FROM band_venue_performances

SELECT *
FROM band_venue_performances
ORDER BY venue_name DESC

SELECT venue_name, SUM(ticket_price) AS total_revenue
FROM band_venue_performances
GROUP BY venue_name DESC

/*
AMD	3984250
Auditorium Shores	10656280
Austin Kiddie Limits	11390025
Austin Ventures	11171200
BMI	10544285
Bud Light	9940415
Google+	11261225
Honda	9921670
Vista Equity	10283280
*/

SELECT venue_name, SUM(ticket_price) AS total_revenue
FROM band_venue_performances
GROUP BY venue_name
ORDER BY total_revenue DESC
LIMIT 3

/*
AMD	3984250
Honda	9921670
Bud Light	9940415
*/


-- 2.10 Fix the error in the query below
-- Intention is: How many bands played each year?

SELECT EXTRACT(YEAR from performance_date), COUNT(band_name)
FROM band_performances
GROUP BY EXTRACT(YEAR from performance_date)


/*
2002	72635
2003	139874
2004	130275
2005	76656
2006	109206
2007	113309
2008	141224
2009	141126
2010	139352
2011	139715
2012	115402
2013	222901
2014	272240
2015	320278
2016	312752
2017	276075
2018	269340
2019	315593
2021	282455
*/

Should be:

/*
2002	53
2003	93
2004	87
2005	49
2006	75
2007	75
2008	96
2009	91
2010	92
2011	95
2012	77
2013	96
2014	106
2015	135
2016	142
2017	119
2018	120
2019	143
2021	129
*/


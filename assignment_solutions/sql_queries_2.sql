-- 1. What years did 'Beardyman' play in the festival? Use SELECT EXTRACT(YEAR from performance_start) in final step

SELECT *
FROM bands;

SELECT *
FROM bands
WHERE name = 'Beardyman';

SELECT *
FROM bands 
  INNER JOIN performances ON bands.id = performances.band_id
WHERE name = 'Beardyman';

SELECT EXTRACT(YEAR FROM performance_start)
FROM bands 
  JOIN performances ON bands.id = performances.band_id
WHERE name = 'Beardyman';

--> 2011

-- 2. Which bands played in the 'BMI' venue in 2012 or after?

SELECT *
FROM venues;

SELECT *
FROM venues
WHERE name = 'BMI';

SELECT *
FROM venues
  JOIN performances ON venues.id = performances.venue_id
WHERE name = 'BMI';

SELECT *
FROM venues
  JOIN performances ON venues.id = performances.venue_id
  JOIN bands ON performances.band_id = bands.id 
WHERE venues.name = 'BMI';

SELECT DISTINCT bands.name
FROM venues
  JOIN performances ON venues.id = performances.venue_id
  JOIN bands ON performances.band_id = bands.id
WHERE venues.name = 'BMI'
  AND performance.performance_start >= '2012-01-01';

-- If you add ORDER name LIMIT 6 you'll get:
/*
070 Shake
A Thousand Horses
A$AP Ferg
A$AP Rocky
AFI
AG Club
*/

-- 3. The query below gets the earliest ticket purchase in 2018. Using two steps:
-- Add a JOIN to get the name of the person that made this purchase.
-- Alter the SELECT to only show the name of the person.

SELECT *
FROM purchases
WHERE EXTRACT(YEAR from purchase_date) = 2018
ORDER BY purchase_date ASC
LIMIT 1

SELECT *
FROM purchases
  JOIN people ON purchases.person_id = people.id
WHERE EXTRACT(YEAR from purchase_date) = 2018
ORDER BY purchase_date ASC
LIMIT 1

SELECT people.name AS person_name
FROM purchases
  JOIN people ON purchases.person_id = people.id
WHERE EXTRACT(YEAR from purchase_date) = 2018
ORDER BY purchase_date ASC
LIMIT 1

/* Query can return different names, since there are lots of ties here
Note that the database has a quirk such that everyone that buys a ticket at 9:00am
on each day.  That's an artifact of how I simulated the data, see: */

SELECT purchase_date, COUNT(*)
FROM people 
  JOIN purchases ON purchases.person_id = people.id
WHERE purchase_date BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY purchase_date
ORDER BY purchase_date ASC 


--4 Get a list of ticketholder names for performance_id = 1407

-- To test your answer, if you add ORDER BY people.name ASC LIMIT 6 you will get:

/*
Abandia Silkstride
Abier Sunham
Abirt Gloryhelm
Adral Gamaire
Adral Leruth
Adralys Hawkwood
*/

SELECT *
FROM performances 
WHERE performances.id = 1407;

SELECT *
FROM performances 
  JOIN tickets ON performances.id = tickets.performance_id
WHERE performances.id = 1407;

SELECT *
FROM performances 
  JOIN tickets ON performances.id = tickets.performance_id
  JOIN purchases ON tickets.purchase_id = purchases.id
WHERE performances.id = 1407;

SELECT *
FROM performances 
  JOIN tickets ON performances.id = tickets.performance_id
  JOIN purchases ON tickets.purchase_id = purchases.id
  JOIN people ON purchases.person_id = people.id
WHERE performances.id = 1407;

SELECT people.name AS ticketholder
FROM performances 
  JOIN tickets ON performances.id = tickets.performance_id
  JOIN purchases ON tickets.purchase_id = purchases.id
  JOIN people ON purchases.person_id = people.id
WHERE performances.id = 1407
ORDER BY people.name ASC
LIMIT 12

--5. In words, explain why the number of rows goes up in the second of these two queries.

SELECT *
FROM bands
WHERE bands.name IN ('Reckless Kelly', 'The Jayhawks', 'Los Lobos')
--> 3 rows

SELECT *
FROM bands
  JOIN performances ON bands.id = performances.band_id
WHERE bands.name IN ('Reckless Kelly', 'The Jayhawks', 'Los Lobos')
--> 8 rows.  

Why does the number of rows go up?

--6. This query does an inner join between tickets and performances. 

SELECT *
FROM tickets
  JOIN performances ON tickets.performance_id = performances.id

-- Remember that a INNER JOIN can drop rows from the left table. If I changed JOIN to LEFT JOIN, what change would I check to see if there were any tickets in the tickets table not linked to a valid performance?

-- Write a query which counts the number of tickets not linked to a valid performance. In this database that number is 0, so your query should produce 0. It will help to imagine a row in the tickets table which has a performance_id of 10000 (which is invalid, there is no matching row in the performances table)


SELECT COUNT(*)
FROM tickets
  LEFT JOIN performances ON tickets.performance_id = performances.id
WHERE performances.id IS NULL
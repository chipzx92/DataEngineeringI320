--Question 1:
SELECT *
FROM cars
WHERE year = 2008
  AND cylinders = 4

--Question 2:
SELECT *
FROM cars
WHERE year = 2008
  AND cylinders = 4
ORDER BY manufacturer

--Question 3:
Answer: 'The query returned no data'
This was the case because there was no cars that had the model year of 2000 and had 4 cylinders in the dataset.

--Question 4:
SELECT *
FROM cars
ORDER BY city_mpg DESC
LIMIT 5

--Question 5:
SELECT *
FROM cars
ORDER BY hwy_mpg
LIMIT 5

--Question 6:
SELECT *
FROM cars
WHERE (model = 'mustang' AND manufacturer = 'ford')
OR (model = 'a6 quattro' AND manufacturer = 'audi')

-- OR

SELECT *
FROM cars
WHERE model = 'mustang'
OR model = 'a6 quattro'
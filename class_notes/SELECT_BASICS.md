# SELECT basics class notes

We didn't take off points for these things, but we will in the future:
* semi-colons must end all SQL statements.
* keywords (SELECT, FROM, WHERE, ORDER BY, LIMIT, GROUP BY) must be on separate lines and be capitalized.
* table and column names must be in lower case

1. Write a query that returns all the cars with a model year of 2008 that have 4 cylinders.
```sql
SELECT *
FROM cars
WHERE year = 2008
  AND cylinders = 4;
```

2. Write the same query, but order it by manufacturer.
```sql
SELECT *
FROM cars
WHERE year = 2008
  AND cylinders = 4
ORDER BY manufacturer;
```

3. Change the model year to 2000. What does the query return and why?
```sql
SELECT *
FROM cars
WHERE year = 2000
  AND cylinders = 4
ORDER BY manufacturer;
```
Answer: 'The query returned no data'
This was the case because there were no cars that had the model year of 2000 **and had 4 cylinders in the dataset**.

I took off 1/2 point if you only said that there were no cars that had the model year of 2000 and
left out "and had 4 cylinders".

Why am I being do picky?

4. Write a query that returns the 5 cars with the highest city_mpg.
```sql
SELECT *
FROM cars
ORDER BY city_mpg DESC
LIMIT 5;
```

5. Write a query that returns the 5 cars with the lowest hwy_mpg.
```sql
SELECT *
FROM cars
ORDER BY hwy_mpg
LIMIT 5;
```

6.Write a query that returns all of the cars that either are ford mustangs or audi a6 quattros.
```sql
SELECT *
FROM cars
WHERE (model = 'mustang' AND manufacturer = 'ford')
OR (model = 'a6 quattro' AND manufacturer = 'audi');
```
**or**
```sql
SELECT *
FROM cars
WHERE model = 'mustang'
OR model = 'a6 quattro';
```
**or**
```sql
SELECT *
FROM cars
WHERE model IN ('mustang', 'a6 quattro');
```
**or**
```sql
SELECT *
FROM cars
WHERE manufacturer IN ('ford', 'audi')
  AND model IN ('mustang', 'a6 quattro');
```

Took a point off if you forgot parentheses
Took a point off if you capitalized the names
Remember, it's important to run your queries and make sure you get the right answer!
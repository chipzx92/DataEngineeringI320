#GROUP BY: using aggregate functions on sub-sets of tables

In the previous presentation we learned about aggregate functions, which let us 'collapse' a table 
(or a column in a table) down to a single value. We learned about :

* `SUM(column)` which collapses a column of numbers down by adding them together;
* `AVG(column)`, which gives use the averaged value of the numbers in a column;
* `COUNT(*)` which shows us the number of rows in a table;
* `MAX(column)` which gives us the maximum value in a column
* `MIN(column)` which gives us the minimum value in a column

We also learned about `DISTINCT`, which gives us the distinct set of values in a column.

Often we want to do these things, but rather than doing them on a whole table, we want to split the 
table up into sections, then use `SUM`, `AVG`, or `COUNT` on each of those sections.  In this way 
the `GROUP BY` clause lets us divide the table into multiple parts, then use an aggregate function 
on each part.  The parts are defined by having the same value in one of the columns.

Again using our small slice of the `tickets` table, let's say that we want to know three things:
* How much did each performance make in ticket sales?
* What was the average ticket price for each performance?
* How many tickets where sold for each performance?

## GROUP BY with SUM
*How much did each performance make in ticket sales?* 

The `tickets` table contains the `price` column and the `performance_id` column. So we can SUM up 
ticket `price` for each performance if we GROUP BY `performance_id`.

You can do this in the following steps:

1. Choose the table to use in the FROM clause:
```sql
SELECT *
FROM   tickets;
```
2. Choose the column you want to SUM:
```sql
SELECT SUM(price)
FROM   tickets;
```
3. Now choose the column you want to group the SUMs on. In this case we want to total the ticket sales revenue for each performance:
```sql
SELECT performance_id, SUM(price)
FROM   tickets;
```

But now we need to tell the database to group on that column, so we add the GROUP BY clause:
```sql
SELECT performance_id, SUM(price)
FROM tickets
GROUP BY performance_id;
```

![](images/GroupByTickets.drawio.png)

Notice that we get one row for each performance_id with the price added up for that performance.  

![](images/sum_price_group_by.png)

So `GROUP BY` allows us to split up a table into groups that share a value in a particular column, 
and then apply aggregate functions to get a single value by 'collapsing' the group. The aggregate 
functions work exactly the same as they do on a whole table, but operate only on the rows in each 
group. You will always get back one row for each group.

## GROUP BY with AVG
*What was the average ticket price for each performance?*
![](images/AvgTickets.drawio.png)

We get the average price in the same way we got the sum - we group by performance_id:

![](images/avg_price_by_performance.png)

Notice again that we get one row for each performance_id with the price averaged for each 
performance.  

# GROUP BY with COUNT
* How many tickets where sold for each performance?*   

![](images/CountTickets.drawio.png)

Notice here that we're counting rows:

![](images/count_tickets_group_by.png)

Exercises:
1. What happens if you add ticket_id to any of the SQL statements above and run it?
2. How would you get the top 10 performances by ticket sales revenue?
3. How would you get the 5 lowest average ticket prices?
4. How would you get the top 5 performances by number of tickets sold?

## GROUP BY with JOINs

We can join tables together to get additional information using GROUP BY. For example, we can find
out how many performances each band has played at the festival by joining the `performances` and
`bands` tables together. Let's do this step-by-step:
1. Choose the tables:
```sql
SELECT *
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id);
```
2. Choose the columns :
```sql
SELECT b.name AS band_name, COUNT(*) AS performances
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id);
```
3. Add in the GROUP BY:
```sql
SELECT b.name AS band_name, COUNT(*) AS performances
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
GROUP BY band_name;
```

4. And let's order it by band name:
```sql
SELECT b.name AS band_name, COUNT(*) AS performances
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
GROUP BY band_name
ORDER BY band_name;
```

Note the order of the clauses in the SQL statement:  
SELECT  
FROM (+ JOIN)  
WHERE  
GROUP BY  
ORDER BY  
LIMIT  

Exercise: How would we get the number of performances at each venue?

# GROUP BY with JOINs filtered by WHERE

Let's say we want to find out how many times a particular band has played at the festival. To do
this, we need to add a WHERE clause to our GROUP BY:

```sql
SELECT b.name AS band_name, COUNT(*) AS performances
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
WHERE  band_name = 'Asleep at the Wheel'
GROUP BY band_name;
```

Let's look again at the order of execution in the SQL statement with GROUP BY:
FROM
WHERE
SELECT
GROUP BY
ORDER BY
LIMIT

We would really like to know what bands played at a performance and what venue the performance was
at. To be able to do that, we're going to need to join multiple tables together to get that 
information.

What tables do we need to join to tickets to get band and venue names?

![](images/FestivalERD.drawio.png)

Exercises
1. What are the band names and ticket sales revenue for the top 10 bands? 
```sql
SELECT b.name AS band_name, SUM(price) AS ticket_sales_revenue
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY band_name
ORDER BY ticket_sales_revenue DESC
LIMIT 10;
```
2. What was the average ticket price for the top 5 bands? (select band name, ticket sales revenue, and average ticket price)
```sql
SELECT b.name AS band_name, 
       SUM(price) AS ticket_sales_revenue,
       AVG(price) AS average_ticket_price
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY band_name
ORDER BY ticket_sales_revenue DESC
LIMIT 5;
```
3. How many tickets were sold byt the top 5 bands? (select band name, ticket sales revenue, avg ticket price, and # of tickets)
```sql
SELECT b.name AS band_name, 
       SUM(price) AS ticket_sales_revenue,
       AVG(price) AS average_ticket_price,
       COUNT(*) AS tickets_sold
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY band_name
ORDER BY ticket_sales_revenue DESC
LIMIT 5;
```
4. How many times did those top 5 bands perform? (select the band name, ticket sales revenue, avg ticket price, # of tickets and # of performances)
```sql
SELECT b.name AS band_name, 
       SUM(price) AS ticket_sales_revenue,
       AVG(price) AS average_ticket_price,
       COUNT(*) AS tickets_sold,
       COUNT(DISTINCT performance_id) AS performances
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY band_name
ORDER BY ticket_sales_revenue DESC
LIMIT 5;
```
5. What was the average revenue per performance for the top 5 bands (select all the columns plus average revenue per performance)?
```sql
SELECT b.name AS band_name, 
       SUM(price) AS ticket_sales_revenue,
       AVG(price) AS average_ticket_price,
       COUNT(*) AS tickets_sold,
       COUNT(DISTINCT performance_id) AS performances,
       SUM(price)/(COUNT(DISTINCT performance_id)*1.0) AS average_revenue_per_performance
FROM   bands AS b
JOIN   performances AS p ON (p.band_id = b.id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY band_name
ORDER BY ticket_sales_revenue DESC
LIMIT 5;
```
6. What were the top 5 bands in terms of average revenue per performance per venue?
```sql
SELECT b.name AS band_name,
       v.name AS venue_name,
       COUNT(DISTINCT performance_id) AS performances,
       SUM(price)/(COUNT(DISTINCT performance_id)*1.0) AS average_revenue_per_performance
FROM   performances AS p 
JOIN   bands AS b ON (p.band_id = b.id)
JOIN   venues AS v ON (p.venue_id = v.id)
JOIN   tickets AS t ON (t.performance_id = p.id)
GROUP BY band_name, venue_name
ORDER BY average_revenue_per_performance DESC
LIMIT 5;
```

### How Does Group By Work?

Imagine the following query against a tickets table with these 6 rows. We want to get the
COUNT of tickets for each performance, the SUM of the ticket sales for each performance, and the 
AVG price of a ticket for each performance.

![](images/GroupByExplanation1.drawio.png)

When we run the query, it executes the group by reading each row from the source table. In the result
table, it creates a new row for each distinct value of the column we're grouping by. The row in 
the result table will have a column for each aggregate function.

Read row 1: ticket_id=1 performance_id=11 price=35
We create a new row for performance_id=11, count the row, and set the sum and average to 35.

|  performance_id |  COUNT |   SUM   |   AVG   |
| --------------- | ------ | ------- | ------- |
|       11        |    1   |   35    |    35   |

Read row 2: ticket_id=2 performance_id=13 price=17
We create a new row for performance_id=13, count the row, and set the sum and average to 17

|  performance_id | COUNT | SUM | AVG |
| --------------- |-------|-----|-----|
|       11        | 1     | 35  | 35  |
|       13        | 1     | 17  | 17  |

Read row 3: ticket_id=3 performance_id=11 price=20
We add one to the count, add 20 to the sum, and get the average of 35+20 for performance_id=11

|  performance_id | COUNT | SUM | AVG  |
| --------------- |-------|-----|------|
|       11        | 2     | 55  | 27.5 |
|       13        | 1     | 17  | 17  |

Read row 4: ticket_id=4 performance_id=12 price=28
We create a new row for performance_id=12, count the row, and set the sum and average to 28

|  performance_id | COUNT | SUM | AVG  |
| --------------- |-------|-----|------|
|       11        | 2     | 55  | 27.5 |
 |       13       |  1    | 17  |   17 |
|       12       | 1     | 28  | 28   |

Read row 5: ticket_id=5 performance_id=11 price=27
We add one to the count, add 27 to the sum, and get the average of 35+20+27 for performance_id = 11

|  performance_id | COUNT | SUM | AVG  |
| --------------- |-------|-----|------|
|       11        | 3     | 82  | 27.3 |
|       13       | 1     | 17  | 17   |
|       12       | 1     | 28  | 28   |

Read row 6: ticket_id=6 performance_id=13 price=27
We add one to the count, add 27 to the sum, and get the average of 27+17 for performance_id = 13
|  performance_id | COUNT | SUM | AVG  |
| --------------- |-------|-----|------|
|       11        | 3     | 82  | 27.3 |
|       13       | 2     | 44  | 22   |
|       12       | 1     | 28  | 28   |

## HAVING

What if we only want to see purchases that included more than 10 tickets?

That is difficult because of the order that the clauses execute. `GROUP BY` 
(and therefore `COUNT(*)`) happens _after_ `WHERE`, so we don't have the count of tickets in a 
purchase at the time that `WHERE` executes. Since we don't have it yet, we can't use it in 
the `WHERE`.

We want to eliminate some rows from our _results_ table, just as `LIMIT` does. SQL accommodates 
this common use case with an additional keyword: `HAVING`. The syntax is exactly the same as `WHERE` 
clause had our results been a table in the database.

Thus to get only purchases that included more than 10 tickets we can do:

```sql
SELECT *
FROM tickets

SELECT *
FROM tickets
ORDER BY purchase_id

SELECT purchase_id, COUNT(*) as tickets_per_purchase
FROM tickets
GROUP BY purchase_id

-- Now add a HAVING clause to filter these results
SELECT purchase_id, COUNT(*) as tickets_per_purchase
FROM tickets
GROUP BY purchase_id
HAVING COUNT(*) > 10
```

Note that we cannot say `HAVING tickets_per_purchase > 10` we cannot use the alias from the SELECT 
clause in the HAVING clause. This has to do with the order that things execute, HAVING executes 
after `GROUP BY` but before `SELECT`. 

![](images/alias_in_having.png)

This is fairly annoying, especially if the expression we want to filter by is complicated (because 
it then has to be repeated in the SELECT and in the HAVING).

## GROUP BY on more than one column

Sometimes we want to group by one than one field.  In the data below there are two genders shown, but it's important for me to emphasize that there could be additional values for gender beyond 'man' and 'woman'. In fact Facebook, famously, eventually [was shamed into introducing a free-form text field for gender](https://www.huffpost.com/entry/facebook-gender-free-form-field-_n_6762458?guccounter=1).  

While I do only use 'man' and 'woman' below, using a freeform text field, rather than codes like 1 or 2, or a set of prespecified values from a drop-down is bad practice.  Free-form is much better than the category 'other,' because it is inaccurate and painful, as described by Bowker and Star (from the Information School world) in their book ['Sorting things out: classification and its consequences.'](https://mitpress.mit.edu/9780262522953/sorting-things-out/).

However, in this database we have two values, 'man' and 'woman'. And we might want to know the average age for those that chose each label, broken down by the zip code in which they live.

Just as we can use more than one column with `ORDER BY` (using a second column to 'split ties' from our first column), we can use more than one column with `GROUP BY`.

The same procedure as above works with two (or more columns). The key is to realize that the groups are based on _unique combinations of the grouping variables_. You might think of the first grouping variable as the 'outer' variable and the second as the 'inner' variable.  Remember that the grouping variables always come at the start of the SELECT, if you use two grouping variables, then you have to ask for both at the start, in the same order. If you follow the three steps from above you can't go wrong.

![](images/people.png)

Now sort by the first variable (`gender`):

![](images/first_sort.png)

Then sort by the second variable (`zip`). This picture shows the second groups with a dotted line. Note that `zip` is in order only within each group from `gender`, but not if you simply read down the `zip` column (78701 shows up twice, once at the top of the female group, once at the top of the male group.)

![](images/second_sort.png)

Finally we can do our three group by steps, only difference being that we copy both terms from the `ORDER BY` to `SELECT`

1. move grouping terms to `SELECT`
2. change `ORDER BY` to `GROUP BY`
3. add aggregate function with `AS` alias.

```sql
SELECT *
FROM people
ORDER BY people.gender, people.zip

SELECT people.gender, people.zip, AVG(people.age) AS avg_age_by_gender_and_zip
FROM people
GROUP BY people.gender, people.zip
```

![](images/people_grouped.png)

### Exercise

If we reverse the order of the terms in the `GROUP BY` will the answers change?

![](images/reversed_order_group.png)

You may find the exercises 6-8 on [SUM and COUNT on SQLZoo](http://sqlzoo.net/wiki/SUM_and_COUNT) useful.

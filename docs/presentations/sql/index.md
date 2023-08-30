# SQL for data engineering

SQL is the language we will use for data engineering.

SQL queries have two main jobs:

1. They communicate our intentions with our colleagues (and our future self)
2. They tell the computer what to do.

The order of those functions is important. What want to write straightforward SQL that humans can understand and can edit and improve. It is never enough to write queries that run and produce the correct answer. They must be understandable by people. 

You might be familiar with trade offs between simplicity and performance, such that writing things in a difficult to understand way makes the computer run more quickly, while writing things in a way that is easy to understand makes the computer run slowly.

Happily there is almost never a trade off for SQL, because SQL is understood by a part of the SQL engine called the "optimizer" the SQL engines and re-written internally to use the fastest approach available.

For us in this class this means two things:

1. The layout and formatting of a query matters. We will teach a particular way to format a query and we will deduct points if that format isn't used, even if the query runs correctly.

2. You are expected to use the approaches we teach, and not other approaches, even if they produce the same answers. There can be multiple ways to get things done in SQL but for teams to understand, check, and building on each other's work, it is much easier when people use standardized approaches.


Here is an index of the topics we will cover.

1. [CREATE table, Inserting data, and Datatypes.](create_table)
    
2. [SELECT/WHERE and boolean logic and SELECT clause transformations](select_basics)

3. [Aggregate functions](aggregate_functions) and [GROUP BY](grouping)

4. [Combining data with JOIN](joins)

Additional topics:

    - sub-query
    - EXISTS

## Resources for learning SQL

The [DataCamp: SQL fundamentals track](https://app.datacamp.com/learn/skill-tracks/sql-fundamentals) is a useful resource, well aligned with the approaches taught in this class.  We have sent you an invitation for DataCamp so you should have zero-cost access to that full track, let us know if that isn't the case.

There are quite a few different "flavors" of SQL, as well as many levels of complexity, so searching can be difficult.  Words to add to your online searches:

- "postgres" or "postgresql" (which is the database we are using)
- "tutorial"

Stackoverflow has useful Q&A with answers updated as the underlying technologies change. You will find the [sql](https://stackoverflow.com/questions/tagged/sql) and the [postgresql]](https://stackoverflow.com/questions/tagged/postgresql) tags most useful.

# Creating databases using SQL

The first SQL we will learn is used to create tables in SQL.

In our string database exercise to hold information about our red mug, red pen, green highligher, and green vase we created three tables, one for objects, one for colors, and one for functions.

You created these on the physical tables in class and they looked like this:

[](images/objects_tables.png)

We will now learn the SQL statements to create these tables and insert these rows of data.

```sql

--CREATE DATABASE class_objects;

DROP TABLE IF EXISTS colors
DROP TABLE IF EXISTS functions;
DROP TABLE IF EXISTS objects;


CREATE TABLE IF NOT EXISTS colors (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE IF NOT EXISTS functions (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE IF NOT EXISTS objects (
    id SERIAL PRIMARY KEY,
    name TEXT,
    color_id INTEGER,
    function_id INTEGER
);

```

First we delete the tables using `DROP`; this ensures our pipeline will be "idempotent" (run from the start even if we've run into an error).

We then have three separate CREATE statements (one for a table called `colors`, one for a table called `functions` and one for `objects`). 

The statement starts with `CREATE TABLE` and ends with a semi-colon `;`.

We use `IF NOT EXISTS` to protect against a typo in our `DROP`; we want an error if we try to create a table we haven't already dropped.

The name of the table (e.g., `colors`) is next; we avoid capital letters and spaces (we use `a_way_of_writing_called_snake_case`)

Each statement has an list of columns inside some parens `(` and `)`. 

On each line inside the parens we have the name of a column and it's datatype. e.g.,


```sql
name TEXT,
```

Creates a column called `name` which has the datatype `TEXT`. 

Other datatypes we will see in this course include:

- `INTEGER` which means whole numbers (like `5` and `2300`)
- `FLOAT` which means numbers with decimals (like `5.5` and `2300.78`)
- `DATETIME` which means calendar dates (like `2022-09-08 11:00:00`)

The database will ensure that any data in these columns has a matching format, throwing an error if it does not. (Note that this is unlike spreadsheets which can very easily have mixed datatypes within a single column).

The first column in each table is the `id` column, which has the special datatype `SERIAL PRIMARY KEY`. A `PRIMARY KEY` means that the value for each row must be unique to that table (no duplicates). The primary key is like a handle for the row. `SERIAL` means that the database will create a value if we don't provide one.

The `objects` table has two additional columns:

```sql
    color_id INTEGER,
    function_id INTEGER
```

These are foreign keys that reference the `id` column in `colors` and `functions` respectively.

That's it.

Exercise:

- Use SQL Lab to create a class_objects.sql database.

The login for SQL Lab is `admin` with password `DEI320D_student!`.


# Inserting data

Once we have created tables we need to add data. Later in the course we will use a `\copy` command to suck in whole CSV files, but for now we will use `INSERT` for just a little data.


```sql
INSERT INTO colors(id, name) VALUES (1,'red');
INSERT INTO colors(id, name) VALUES (2,'green');
INSERT INTO functions(id, name) VALUES (1,'writes');
INSERT INTO functions(id, name) VALUES (2,'holds');
```

Insert statements start with `INSERT INTO` then the name of the table followed by a list of column names inside parens (`(id, name)`) then the word `VALUES` followed by the data you want to go into each column.  The order and number of the data and the list of column names must match.

Note for the data, numbers (like `1` and `2`) are just written, but data for a `TEXT` column needs to be surrounded by single quotes `'` not double quotes `"`.

The database responds by saying how many rows of data were inserted. Note, though, that if you copy the commands above all together the message you see will say that only 1 row was inserted. That is coming from just the last `INSERT` (for "holds"), the messages from the first three are hidden by the last one.

Exercise:
- Run these inserts statements and use `Preview colors` in SQL Lab to see that the data was inserted.

## Multi-row INSERT

We can also insert more than one row of data per `INSERT`. We do this by sending more than one chunks of data inside parens. We put each row of data on its own line, separated by commas.

The `INSERT` below will create each of our objects and tie them together with their color and function, using the `color_id` foreign key column to point to either the `red` or `green` row in `colors`, and the `function_id` foreign key column to point to either the `writes` or `holds` row in the `functions` table.

```sql
INSERT INTO objects(name, color_id, function_id) 
  VALUES ('highlighter', 2, 1),
         ('pen', 1, 1),
         ('mug', 1, 2),
         ('vase', 2, 2);  
```

Exercise:

- execute this `INSERT` query. Inspect via `Preview Objects`.
- Use Jupyter to create a text file and write `INSERT` statements to add additional data to your database so you can represent:
    - A silver fork
    - A pink mug
    - two green cups

## Differences between database tables and spreadsheets

Tables are `tabular`, which means they are made up of columns and rows. In some ways they are similar to spreadsheets, like Excel Worksheets or Google Sheets. But there are some important differences, here are some:

1. Database tables only contain columns and rows. You cannot store notes or figures like you can on an Excel Worksheet.
2. Database columns must have a name that you provide, there is no concept of 'column A or column DD'. 
3. Database tables strictly enforce datatypes. Excel can "format column" and have a datatype specified, but those can be changed and even mixed.
4. Only the columns you create exist, there is no concept of an empty or unnamed column.
5. Database tables only have the rows that you create. The `PRIMARY KEY` column cannot be empty. 

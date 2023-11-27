
# Terminologia y estructuras de consultas

## DDL - Data Definition Language

__DDL__, or __Data Definition Language__, is a subset of SQL used to define and manage all structures of a database, including tables, indexes, and relationships between tables. The most common __DDL__ commands include `CREATE`, `ALTER`, `DROP`, and `TRUNCATE`, which are used to create, modify, and delete database structures, respectively. Unlike other SQL commands, DDL commands cannot be undone with `ROLLBACK`.

## DML - Data Manipulation Language

__DML__, or __Data Manipulation Language__, is a subset of SQL used for adding, updating, and deleting data within tables. The most common DML commands include `INSERT`, `UPDATE`, and `DELETE`. Unlike DDL commands, DML commands can be rolled back (undone), meaning if you make a mistake, you can use the ROLLBACK command to undo these changes. DML is crucial for managing data within tables and is used frequently in day-to-day SQL operations.

## TCL - Transaction Control Language

__TCL__, or __Transaction Control Language__, is a subset of SQL used to manage transactions within a database. The most common TCL commands include `BEGIN TRANSACTION`, `COMMIT`, and ``ROLLBACK``. `BEGIN TRANSACTION` is used to start a new transaction. `COMMIT` is used to save the changes made in the current transaction to the database. `ROLLBACK` is used to undo the changes made in the current transaction. TCL commands are crucial for ensuring data integrity and consistency in database operations.

## DQL - Data Query Language
__DQL__, or __Data Query Language__, is a subset of SQL used to retrieve data from a database. The most common DQL command is `SELECT`, which is used to query data from one or more tables in the database. DQL commands can include conditions, aggregations, sorting, and joining, allowing for complex queries to be built to extract the exact data needed. Unlike __DDL__ and __DML__, __DQL__ does not modify the data or the database structure, it only retrieves data.

## Aggregate Functions in SQL

Aggregate functions in SQL are used to perform calculations on a set of values and return a single value. Here are the most common ones:

- `COUNT()`: This function returns the number of rows that matches a specified criterion.

    ```sql
    SELECT COUNT(column_name) FROM table_name;
    ```

- `SUM()`: This function returns the total sum of a numeric column.

    ```sql
    SELECT SUM(column_name) FROM table_name;
    ```

- `AVG()`: This function returns the average value of a numeric column.

    ```sql
    SELECT AVG(column_name) FROM table_name;
    ```

- `MIN()`: This function returns the smallest value of the selected column.

    ```sql
    SELECT MIN(column_name) FROM table_name;
    ```

- `MAX()`: This function returns the largest value of the selected column.

    ```sql
    SELECT MAX(column_name) FROM table_name;
    ```

- `GROUP BY` statement is often used with aggregate functions (`COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`) to group the result-set by one or more columns.

    ```sql
    SELECT column_name(s), aggregate_function(column_name)
    FROM table_name
    WHERE condition
    GROUP BY column_name(s);
    ```
- The `HAVING` clause was added to SQL because the `WHERE` keyword could not be used with aggregate functions. `HAVING` is typically used with the `GROUP BY` clause to filter the results of the group by.

    ```sql
    SELECT column_name(s), aggregate_function(column_name)
    FROM table_name
    WHERE condition
    GROUP BY column_name(s)
    HAVING condition_on_aggregate_function;
    ```

>Remember, aggregate functions ignore `NULL` values.## Data Filtering in SQL

## Data Filtering in SQL
SQL provides several ways to filter data. Here are some of the most common ones:

- `WHERE`: This keyword is used to filter records.

    ```sql
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition;
    ```

- `AND` and `OR`: These operators are used to filter records based on more than one condition.

    ```sql
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition1 AND condition2;
    ```

- `IN`: This operator allows you to specify multiple values in a `WHERE` clause.

    ```sql
    SELECT column_name(s)
    FROM table_name
    WHERE column_name IN (value1, value2, ...);
    ```

- `LIKE`: This operator is used in a `WHERE` clause to search for a specified pattern in a column.

    ```sql
    SELECT column1, column2, ...
    FROM table_name
    WHERE columnN LIKE pattern;
    ```

- `BETWEEN`: This operator selects values within a given range inclusive.

    ```sql
    SELECT column_name(s)
    FROM table_name
    WHERE column_name BETWEEN value1 AND value2;
    ```

- `IS NULL` and `IS NOT NULL`: These operators are used to test for empty values.

    ```sql
    SELECT column_name(s)
    FROM table_name
    WHERE column_name IS NULL;
    ```

    ```sql
    SELECT column_name(s)
    FROM table_name
    WHERE column_name IS NOT NULL;
    ```

## General Structure of a SELECT Statement in SQL

The `SELECT` statement is used to select data from a database. The data returned is stored in a result table, called the result-set.

Here is the basic syntax:

    ```sql
    SELECT *, fields, alias, functions, ...
    FROM table_name
    WHERE condition
    JOIN ......
    GROUP BY aggregated_field, all
    HAVING condition_on_aggregate_function
    ORDER BY column1, column2, ... ASC|DESC
    LIMIT value, all
    OFFSET start_point;
    ```

    - SELECT: Specifies the columns that should be returned.
    - FROM: Specifies the table from which to retrieve the data.
    - WHERE: Filters the results based on a condition.
    - GROUP BY: Groups the results by one or more columns.
    - HAVING: Filters the results of the grouping.
    - ORDER BY: Sorts the results in ascending (ASC) or descending (DESC) order.
    - Each of these clauses is optional, except for SELECT and FROM.
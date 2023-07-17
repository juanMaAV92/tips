# Data Manipulation Languaje (Insert, Update, Delete, Select)

```sql
INSERT INTO db_name.table_name ( field_1, .... field_n )
VALUES  (value_field_1, ....., value_field_n ),
        .......
        (value_field_1, ....., value_field_n );
```

```sql
UPDATE  db_name.table_name 
SET field_1='blabla', ...., field_n='blabla'
WHERE fild_x = condition;
```

```sql
DELETE FROM  db_name.table_name 
WHERE fild_x = condition;

/* Borrar toda la tabla */
DELETE FROM  db_name.table_name;
```

## SELECT query basic structure


```sql
SELECT  field_1, field_2, ...., field_n AS alias_n
FROM table_name
WHERE conditionals
GROUP BY field_x
HAVING conditionals2
ORDER BY field_x1 DESC LIMIT #
```
- SELECT * returns all the fields (columns) of the queried table

- The name of the columns or fields that we are consulting can be changed using AS after the name of the field and putting the new one that we want to have

- There is a SELECT function to be able to COUNT(*) the number of records. That information (a number) will be the result of the query

- GROUP_CONCAT(field) takes the result of the query and puts it as a comma-separated field

- FROM indicates where the data should be from and can help make complex statements and filters when you want to join tables. The companion statement that helps us with this process is JOIN.

<div align="center">
    <image src="https://ingenieriadesoftware.es/wp-content/uploads/2018/07/sqljoin.jpeg" alt="Descripción de la imagen" width="60%" height="60%">
</div>

- WHERE is the statement that helps us filter tuples or records depending on the characteristics we choose
    * The LIKE property helps us fetch records for which we know only part of the information '%some intermediate string%' o 'start with%'o 'end with%'.

    * The BETWEEN property is used to return records that are in the middle of two. For example records with id between 20 and 30.

- HAVING is very similar to WHERE, however the use of them depends on the order. When you want to select grouped tuples, you can only do it with HAVING.

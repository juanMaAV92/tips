# Seccion 9: Vistas, vistas materializadas, CTE y CTE recursivas


> Nota:  crear una base de datos llamada `medium` y volcar la base de datos mediante el archivo `./Ejercicios/population_data/medium-database-01` desde pgAdmin.

## Vistas

Las vistas son tablas virtuales que se crean a partir de una consulta SQL. Las vistas se utilizan para simplificar las consultas complejas y también se utilizan para ocultar la complejidad de las consultas a los usuarios. Las vistas también se utilizan para reutilizar las consultas y para ocultar la estructura de la tabla.

- La siguient consulta filtra la cantidad de posts y claps por semana
```sql
SELECT
    date_trunc('week', created_at) AS weeks,
    COUNT( distinct posts.post_id) AS number_of_posts,
    SUM(claps.counter) AS total_claps
FROM
    posts
    INNER JOIN claps ON posts.post_id = claps.post_id
GROUP BY weeks
ORDER BY weeks desc;
```

- Crear una vista con la consulta anterior
```sql
CREATE OR REPLACE VIEW posts_claps_weekly AS
SELECT
    date_trunc('week', created_at) AS weeks,
    COUNT( distinct posts.post_id) AS number_of_posts,
    SUM(claps.counter) AS total_claps
FROM
    posts
    INNER JOIN claps ON posts.post_id = claps.post_id
GROUP BY weeks
ORDER BY weeks desc;
```

- Consultar la vista creada
```sql
SELECT * FROM posts_claps_weekly;
```

- Eliminar la vista creada
```sql
DROP VIEW posts_claps_weekly;
```

## Vistas materializadas

Las vistas materializadas son vistas que almacenan los resultados de la consulta en la tabla. Las vistas materializadas se utilizan para mejorar el rendimiento de las consultas. Estas vistas no se actualizan automáticamente, por lo que es necesario actualizarlas manualmente.

```sql
CREATE MATERIALIZED VIEW posts_claps_weekly AS
SELECT
    date_trunc('week', created_at) AS weeks,
    COUNT( distinct posts.post_id) AS number_of_posts,
    SUM(claps.counter) AS total_claps
FROM
    posts
    INNER JOIN claps ON posts.post_id = claps.post_id
GROUP BY weeks
ORDER BY weeks desc;
```

- actualizar la vista materializada
```sql
REFRESH MATERIALIZED VIEW posts_claps_weekly;
```

## CTE: Common Table Expression

Casos en los que se puede usar:

1.   Simplificar queries complejas. (se puede tambien resolver con vistas)

```sql
WITH posts_week_2024 as (
    SELECT date_trunc('week'::text, posts.created_at) AS weeks,
        sum(claps.counter) AS total_claps,
        count(DISTINCT posts.post_id) AS number_of_posts,
        count(*) AS number_of_claps
    FROM posts
        JOIN claps ON claps.post_id = posts.post_id
    GROUP BY (date_trunc('week'::text, posts.created_at))
    ORDER BY (date_trunc('week'::text, posts.created_at)) DESC;
)

SELECT * FROM posts_week_2024 WHERE weeks BETWEEN '2024-01-01' AND '2024-12-31' AND total_claps > 600;
```

Multiple CTEs

```sql
WITH claps_per_post AS (
    SELECT post_id, sum(counter) AS total_claps FROM claps GROUP BY post_id
), posts_from_2023 AS (
    SELECT * FROM posts WHERE created_at BETWEEN '2023-01-01' AND '2023-12-31'
)
SELECT * FROM claps_per_post 
WHERE claps_per_post.post_id IN (SELECT post_id FROM posts_from_2023);
```

2.  Consultas recursivas

```sql
-- nombre de la tabla en memoria
-- campos que vamos a tener
WITH RECURSIVE countdown( val ) AS (
    -- inicializacion la variable
        select 5 as val,
    UNION 
    -- consulta recursiva
        select val - 1 from countdown where val > 0
)
-- consulta final
select * from countdown;
```

Ejercicio teorico, tabla de multiplicar
```sql
WITH RECURSIVE multiplication_table(base, val, result) as (
        select 5 as base, 1 as val, 5*1 as result
    UNION
        select base, val + 1, base*(val + 1) from multiplication_table where val < 10
)
SELECT * FROM multiplication_table;
```


Para el siguiente ejercicio de estructura organizacional, se tiene la siguiente tabla `employees`:
```sql
CREATE TABLE employees (
    id serial PRIMARY KEY,
    name VARCHAR(100),
    reports_to INT
);

INSERT INTO employees (name, reports_to) 
VALUES ('Jefe Carlos', NULL), ('Subjefe Susana', 1), ('Subjefe Juan', 1), ('Gerente Pedro', 3), ('Gerente Melissa', 3), ('Gerente Carmen', 2), ('Subgerente Ramiro', 5), ('Programador Fernando', 7), ('Programador Maria', 7), ('Presidente Kari', NULL);
```

```sql
WITH RECURSIVE bosses AS (
        SELECT id, name, reports_to, 1 as depth from employees WHERE id = 1
    UNION
        SELECT employees.id, employees.name, employees.reports_to, depth + 1 from employees 
            INNER JOIN bosses ON employees.reports_to = bosses.id
        WHERE depth < 4
)
SELECT bosses.*, employees.name as report_to_name FROM bosses
    LEFT JOIN employees ON bosses.reports_to = employees.id
    ORDER BY depth;
```
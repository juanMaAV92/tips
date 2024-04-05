# Joins

>Nota: Popular las tablas country, city y countrylanguage desde el script `./Ejercicios/population_data/worlddbplus.sql`


## INNER JOIN

La unión interna (INNER JOIN) es una operación que combina registros de dos tablas relacionadas en función de una condición de unión. La unión interna devuelve solo los registros que tienen valores coincidentes en ambas tablas.


```sql
SELECT
    a.name as country,
    b.name as continent
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
ORDER BY
    a.name ASC;
```

## FULL OUTER JOIN

La unión externa completa (FULL OUTER JOIN) es una operación que combina registros de dos tablas relacionadas en función de una condición de unión. La unión externa completa devuelve un conjunto de registros que incluye todos los registros de ambas tablas, con valores coincidentes de ambas tablas cuando están disponibles. Cuando no hay una coincidencia, la tabla externa completa devuelve NULL en las columnas de la tabla interna.

> Nota: por temas didacticos agregar los siguientes registros a la tabla continent : "North Asia", "Central Asia" y "South Asia".

```sql
SELECT 
    a.name as country,
    a.continent as continentCode,
    b.name as continentName
FROM
    country a
    FULL OUTER JOIN continent b ON a.continent = b.code
ORDER BY
    a.name DESC;
```

```sql
SELECT
    count(*),
    a.continent as continentCode,
    b.name as continentName
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
GROUP BY
    a.continent
ORDER BY
    count(*) ASC;
```


## RIGHT OUTER JOIN 

La unión derecha (RIGHT JOIN) es una operación que combina registros de dos tablas relacionadas en función de una condición de unión. La unión externa derecha devuelve un conjunto de registros que incluye todos los registros de la tabla de la derecha y los registros coincidentes de la tabla de la izquierda. Cuando no hay una coincidencia, la tabla de la izquierda devuelve NULL en las columnas de la tabla de la derecha.

    ```sql
    SELECT
        a.name as country,
        b.name as continent
    FROM
        country a
        RIGHT JOIN continent b ON a.continent = b.code
    ORDER BY
        a.name ASC;
    ```

 - Con exclusion, traer los registros que no tienen relacion con la tabla de la izquierda.

    ```sql
    SELECT
        a.name as country,
        b.name as continent
    FROM
        country a
        RIGHT JOIN continent b ON a.continent = b.code
    WHERE
        a.continent IS NULL
    ORDER BY
        a.name ASC;
    ```
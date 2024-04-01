# Separacion de datos en tablas

## Objetivo

- Crear una tabla de lenguajes
- Crear una tabla de continente

## Paso a paso

- Popular las tablas country, city y countrylanguage desde el script `./Ejercicios/population_data/world-db.sql`

- Tabla continente

    ```sql
    CREATE TABLE continent (
        code SERIAL PRIMARY KEY,
        name TEXT NOT NULL
    );

    SELECT DISTINCT continent FROM country ORDER BY continent asc;

    INSERT INTO continent (name) 
        SELECT DISTINCT continent FROM country ORDER BY continent ASC;
    ```

    - Hacer drop del check de continente en la tabla country

        ```sql
        ALTER TABLE country DROP CONSTRAINT country_continent_check;
        ```

    - Actualizacion masiva
        > Nota: a y b son alias de las tablas country y continent respectivamente.
        ```sql
        UPDATE country a SET continent = (SELECT code FROM continent b WHERE b.name = a.continent);
        ``` 

    - Cambio de tipo de dato y llave foranea
        ```sql
        ALTER TABLE country ALTER COLUMN continent TYPE int4 USING continent::INTEGER;

        ALTER TABLE country ADD CONSTRAINT fk_country_continent FOREIGN KEY (continent) REFERENCES continent(code);
        ```
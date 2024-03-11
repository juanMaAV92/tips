# Generalidades

> Nota: los valores de los string deben ir en comillas simples, las comillas dobles son para los nombres de las columnas y/o tablas


- Crear una tabla
```sql
CREATE TABLE
    users (name VARCHAR(10) UNIQUE);
```

- Insertar datos
```sql
INSERT INTO
    users (name)
VALUES
    ('Berlin'),
    ('Iris'),
    ('Invasor');
```

- Actualizar datos
```sql
UPDATE users
SET
    name = 'Berlincho'
WHERE
    name = 'Berlin';
```

- Seleccionar datos con __limit__ y __offset__
    - Limit: Cantidad de registros a mostrar
    - Offset: Cantidad de registros a saltar
```sql
SELECT
    *
FROM
    users
LIMIT
    2
OFFSET
    1;
```

- Eliminar datos
```sql
DELETE FROM
    users
WHERE
    name = 'Invasor';
```

## Clausula __WHERE__

La clausula __WHERE__ se utiliza para filtrar los registros de una tabla.

> Nota: las busquedas son case sensitive
```sql
SELECT
    *
FROM
    user
WHERE
    name = 'Berlin';
```

- Like (buscar por patrones)
    - %: Cualquier cantidad de caracteres
    - _: Un solo caracter
```sql
SELECT
    *
FROM
    user
WHERE
    name LIKE 'Ber%';
```

## Drop vs Truncate

- __Drop__: Elimina la tabla y su estructura

```sql
DROP TABLE
    users;
```

- __Truncate__: Elimina los registros de la tabla, pero no la estructura

```sql  
TRUNCATE TABLE
    users;
```

## Operadores de Strings y funciones
> Nota: ejecutar el archivo usuarios.sql para crear la tabla y los datos

```sql
SELECT
    id,
    UPPER(name) as upper_name,
    LOWER(name) as lower_name,
    LENGTH(name) as length,
    CONCAT( id, ' ', name),
    name
FROM
    users;
```
> Esta consulta no afecta la base de datos

### Substrings

- Separar el nombre y el apellido de la columna __name__
```sql
SELECT
    name,
    SUBSTRING(name, 0, POSITION(' ' in name)) as first_name,
    SUBSTRING(name, POSITION(' ' in name) + 1) as last_name
FROM
    users;
```


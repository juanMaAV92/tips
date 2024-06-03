# Seccion 6. Fechas

> Nota:  crear y popular las tablas con los script ubicados`./Ejercicios/population_data/*.sql`

## Funciones de fecha y hora 
> [Docs oficial](https://www.postgresql.org/docs/8.1/functions-datetime.html)

- `now()`: fecha y hora actual
- `current_date`: fecha actual
- `current_time`: hora actual
- `date_part('part', date)`: extrae una parte de la fecha almacenada en la columna date. part puede ser 'year', 'month', 'day', 'hour', 'minute', 'second', 'millisecond', 'microsecond', 'doy', 'epoch', 'timezone_hour', 'timezone_minute'

## Consultas

```sql
SELECT * FROM employees WHERE hire_date > '1998-01-01'
ORDER BY hire_date DESC;
```
> Nota: tener cuidado con el formato de la fecha, en este caso es 'YYYY-MM-DD' ya que es el formato con el que se almacenó en la base de datos.

```sql
SELECT 
    MAX(hire_date),
    MIN(hire_date),    
FROM employees;
```

```sql
SELECT * FROM employees WHERE hire_date BETWEEN '1998-01-01' AND '1999-01-01'
ORDER BY hire_date DESC;
```

## Intervalos

```sql
SELECT 
    MAX(hire_date) + INTERVAL '1 days' as days,
    MAX(hire_date) + INTERVAL '1 months' as months,
    MAX(hire_date) + INTERVAL '1 years' as years,
    MAX(hire_date) + INTERVAL '1 years' + INTERVAL '1 days' as hours,
    MAX(hire_date) + MAKE_INTERVAL( YEART := 23 ) 
FROM employees;
```

# Diferencias entre fechas y actualizaciones

```sql
SELECT 
    hire_date,
    MAKE_INTERVAL( YEARS := 2023 - EXTRACT( YEARS FROM hire_date )::integer ) as manual_year,
    MAKE_INTERVAL( YEARS := date_part('years', CURRENT_DATE)::integer - EXTRACT( YEARS FROM hire_date )::integer )  as computed_year
FROM employees
ORDER BY hire_date DESC;
```

- Ejercicio: se debe sumar al hire_date la cantidad de años correspondiente al año actual

    ```sql
    SELECT 
        hire_date,
        hire_date + MAKE_INTERVAL( YEARS := date_part('years', CURRENT_DATE)::integer)  as new_hire_date
    FROM employees

    UPDATE employees
    SET hire_date = hire_date + MAKE_INTERVAL( YEARS := date_part('years', CURRENT_DATE)::integer);
    ```

## Clausula CASE - THEN

```sql
SELECT
    first_name,
    last_name,
    hire_date,
    CASE
        WHEN hire_date > now() - INTERVAL '1 year' THEN '1 año o menos'
        WHEN hire_date > now() - INTERVAL '5 year' THEN '1 a 5 años'
        ELSE 'Mas de 5 años'
    END as range_age
FROM employees
ORDER BY hire_date DESC;
```
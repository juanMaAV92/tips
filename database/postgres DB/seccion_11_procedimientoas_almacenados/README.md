# Seccion 11: procedimientos almacenados

> Nota:  correr el script`./Ejercicios/population_data/employee.sql`.

## Funcion que regresa una tabla

```sql

SELECT country_id, country_name, region_name FROM countries
INNER join regions on countries.region_id = regions.region_id;

CREATE OR REPLACE FUNCTION country_region()
    RETURNS TABLE( id CHARACTER(2), name VARCHAR(40), region VARCHAR(25)) 
    AS $$
        BEGIN
            RETURN query
            SELECT country_id, country_name, region_name FROM countries
            INNER join regions on countries.region_id = regions.region_id;
        END;
    $$ LANGUAGE plpgsql;


select * from country_region();
```

## Procedimiento almacenado

```sql
CREATE OR REPLACE PROCEDURE insert_region_proc( int, varchar )
    as $$
        BEGIN
            INSERT INTO regions( region_id, region_name)
            values ($1, $2)

            COMMIT;
        END;
    $$ LANGUAGE plpgsql;

CALL insert_region_proc( 5, 'Central America');

SELECT * FROM regions;

```
> Nota: cuando los argumento de la funcion no tienen nombre, se referencian por `$1`


# Procedimiento almacenado de aumento salarial


> Nota: Crear una nueva tabla en la base de datos `employees` con el script `./Ejercicios/population_data/raise_history
.sql`.

```sql
-- percentage 5.2%
CREATE OR REPLACE PROCEDURE raise_salary_proc( percentage NUMERIC(4,2) )
    as $$
        DECLARE
            real_percentage NUMERIC(8,2);
            total_employees INT;
        BEGIN
            raise notice 'Aumento de salario en un %', percentage;
            real_percentage = percentage / 100; --5% = 0.05 

            -- Mantener el historico
            INSERT into raise_history( date, employee_id, base_salary, amount, percentage)
                SELECT
                    CURRENT_DATE as "date",
                    employee_id,
                    salary,
                    max_raise( employee_id ) * real_percentage as amount,
                    percentage
                FROM employees;

            -- Impactar la tabla de empleados
            UPDATE employees
                SET salary = salary + max_raise( employee_id ) * real_percentage


            COMMIT;

            SELECT count(*) INTO total_employees FROM employees;

            raise notice 'Salarios actualizados %', total_employees;

            COMMIT;
        END;
    $$ LANGUAGE plpgsql;

CALL raise_salary_proc( 10 );
```
> Nota: La funcion `max_raise` fue creada en la seccion 10.



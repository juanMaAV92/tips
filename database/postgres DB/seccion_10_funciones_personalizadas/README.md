# Seccion 10: Funciones personalizadas

> Nota:  correr el script`./Ejercicios/population_data/employee.sql`.

## Creando funciones

```sql
CREATE OR REPLACE FUNCTION greet_employee(employee_name VARCHAR)
RETURN TEXT AS $$
BEGIN
    RETURN 'Hello ' || employee_name;
END;
$$ LANGUAGE plpgsql;

-- llamando la función
SELECT greet_employee('Juan Ma');

SELECT first_name, greet_employee(first_name) FROM employees;
```

## Caso de ejemplo: determinar el posible aumento de salario de un empleado

```sql
CREATE OR REPLACE FUNCTION max_raise(empl_id INT)
RETURNS NUMERIC(8,2) AS $$
DECLARE
    possible_raise NUMERIC(8,2);
BEGIN
    SELECT max_salary - salary into possible_raise
    FROM employees
    INNER JOIN jobs on jobs.job_id = employees.job_id
    WHERE employee_id = empl_id;

    RETURN possible_raise;
END;
$$ LANGUAGE plpgsql;


-- otra forma de hacerlo
CREATE OR REPLACE FUNCTION max_raise_2(empl_id INT)
RETURNS NUMERIC(8,2) AS $$
DECLARE
    employee_job_id int;
    current_salary NUMERIC(8,2);
    job_max_salary NUMERIC(8,2);
    possible_raise NUMERIC(8,2);
BEGIN
    -- obtener el id del trabajo y el salario actual del empleado
    SELECT job_id, salary into employee_job_id, current_salary
    FROM employees WHERE employee_id = empl_id;

    -- obtener el salario máximo del trabajo
    SELECT max_salary into job_max_salary FROM jobs WHERE job_id = employee_job_id;

    -- Calcular el aumento posible
    possible_raise = job_max_salary - current_salary;

    RETURN possible_raise;

END;
$$ LANGUAGE plpgsql;
```

## IF, THEN, ELSE

Si el salario actual es menor al salario máximo, entonces se le puede dar un aumento. Si no, no se le puede dar un aumento.

```sql
-- otra forma de hacerlo
CREATE OR REPLACE FUNCTION max_raise_3(empl_id INT)
RETURNS NUMERIC(8,2) AS $$
DECLARE
    employee_job_id int;
    current_salary NUMERIC(8,2);
    job_max_salary NUMERIC(8,2);
    possible_raise NUMERIC(8,2);
BEGIN
    -- obtener el id del trabajo y el salario actual del empleado
    SELECT job_id, salary into employee_job_id, current_salary
    FROM employees WHERE employee_id = empl_id;

    -- obtener el salario máximo del trabajo
    SELECT max_salary into job_max_salary FROM jobs WHERE job_id = employee_job_id;

    -- Calcular el aumento posible
    IF current_salary < job_max_salary THEN
        possible_raise = job_max_salary - current_salary;
    ELSE
        -- possible_raise = 0;
        RAISE EXCEPTION 'Persona con id % no puede recibir un aumento', empl_id;
    END IF;

    RETURN possible_raise;

END;
$$ LANGUAGE plpgsql;
```

## RowType

El `RowType` es un tipo de dato que se puede usar para devolver un conjunto de datos de una función.

```sql
-- otra forma de hacerlo
CREATE OR REPLACE FUNCTION max_raise_3(empl_id INT)
RETURNS NUMERIC(8,2) AS $$
DECLARE
    selected_employee employees%ROWTYPE;
    selected_job jobs%ROWTYPE;
    possible_raise NUMERIC(8,2);
BEGIN
    -- obtener el id del trabajo y el salario actual del empleado
    SELECT * into selected_employee
    FROM employees WHERE employee_id = empl_id;

    -- obtener el salario máximo del trabajo
    SELECT * into selected_job FROM jobs WHERE job_id = selected_employee.job_id;

    -- Calcular el aumento posible
    IF selected_employee.current_salary < selected_job.job_max_salary THEN
        possible_raise = selected_job.job_max_salary - selected_employee.current_salary;
    ELSE
        -- possible_raise = 0;
        RAISE EXCEPTION 'El empleado % con id % no puede recibir un aumento',selected_employee.first_name, empl_id;
    END IF;

    RETURN possible_raise;

END;
$$ LANGUAGE plpgsql;
```
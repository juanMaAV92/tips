# Terminología y estructuras de consultas

## DDL - Data Definition Language

__DDL__ es un subconjunto de SQL utilizado para definir y gestionar todas las estructuras de una base de datos, incluidas las tablas, los índices y las relaciones entre tablas. Los comandos __DDL__ más comunes incluyen `CREATE`, `ALTER`, `DROP` y `TRUNCATE`, que se utilizan para crear, modificar y eliminar estructuras de bases de datos, respectivamente. 

A diferencia de otros comandos SQL, los comandos __DDL__ no se pueden deshacer con `ROLLBACK`.

## DML - Data Manipulation Language

__DML__ es un subconjunto de SQL utilizado para agregar, actualizar y eliminar datos dentro de las tablas. Los comandos __DML__ más comunes incluyen `INSERT`, `UPDATE` y `DELETE`. A diferencia de los comandos __DDL__, los comandos __DML__ se pueden deshacer, lo que significa que si cometes un error, puedes usar el comando `ROLLBACK` para deshacer estos cambios. 

__DML__ es crucial para administrar datos dentro de las tablas y se utiliza con frecuencia en las operaciones diarias de SQL.

## TCL - Transaction Control Language

__TCL__ es un subconjunto de SQL utilizado para administrar transacciones dentro de una base de datos. Los comandos __TCL__ más comunes incluyen `BEGIN TRANSACTION`, `COMMIT` y `ROLLBACK`. `BEGIN TRANSACTION` se utiliza para iniciar una nueva transacción. `COMMIT` se utiliza para guardar los cambios realizados en la transacción actual en la base de datos. `ROLLBACK` se utiliza para deshacer los cambios realizados en la transacción actual.

Los comandos __TCL__ son cruciales para garantizar la integridad y la consistencia de los datos en las operaciones de la base de datos.

> Nota: una transacción es un conjunto de operaciones que se realizan como una sola unidad. Si una de las operaciones falla, la transacción se deshace y se restaura el estado anterior a la transacción.

## DQL - Data Query Language

__DQL__ es un subconjunto de SQL utilizado para recuperar datos de una base de datos. El comando __DQL__ más común es `SELECT`, que se utiliza para consultar datos de una o más tablas en la base de datos. 

Los comandos __DQL__ pueden incluir condiciones, agregaciones, ordenación y unión, lo que permite construir consultas complejas para extraer los datos exactos necesarios.


 - Estrucutra de una consulta SQL:
 ```sql
SELECT DISTINCT
    *,
    campos,
    alias,
    funciones
FROM
    tabla
WHERE
    condicion,
    condiciones,
    operadores,
    JOINS
GROUP BY
    campo_agrupador,
    ALL
HAVING
    condicion_agrupador
ORDER BY
    campo_ordenador ASC / DESC
LIMIT
    cantidad, all
OFFSET
    cantidad;
```


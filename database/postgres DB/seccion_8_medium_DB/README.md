# Seccion 6. Base de datos Medium Application

> Nota:  crear y popular las tablas con los script ubicados`./Ejercicios/population_data/medium-database-sqls.sql` o volcar la base de datos mediante el archivo `./Ejercicios/population_data/medium-database-01` en pgAdmin.


## Ejercicio de funcion a nivel de base de datos

1. Convertiremos el siguiente query en una funcion
```sql
select json_agg(
            json_build_object(
                'user', comments.user_id,
                'comment', comments.content
            )
        )
from comments
where comment_parent_id = 1
```

2. Crear la funcion `comment_replies` que reciba un parametro `parent_id` y retorne el json con los comentarios.
```sql
CREATE OR REPLACE FUNCTION comment_replies(parent_id integer)
RETURNS json 
AS 
$$
DECLARE
    result json;
BEGIN
    select json_agg(
            json_build_object(
                'user', comments.user_id,
                'comment', comments.content
            )
        ) into result
    from comments
    where comment_parent_id = id

    return result;
END
$$
LANGUAGE plpgsql;
```
> Nota: el `$$` es el delimitador de la funcion, todo lo que este dentro de los `$$` es el cuerpo de la funcion.


3. Ejecutar la funcion `comment_replies` con el parametro `15`
```sql
select comment_replies(15);
```
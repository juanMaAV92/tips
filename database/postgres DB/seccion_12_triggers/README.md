# Seccion 12: triggers + funciones + procedimientos almacenados


> nota: crear una tabla `user` con los campos id, username(VARCHAR), password(VARCHAR), last_login(timestamp) tabla `session_failed` con los campos id, username(VARCHAR), when(timestamp).

## Encriptar y verificar contraseña. [PGCRYPTO](https://www.postgresql.org/docs/current/pgcrypto.html)

```sql
CREATE EXTENSION pgcrypto;

INSERT into "user" (username, password) 
values ('user1', crypt('password1', gen_salt('bf')));

SELECT * from "user" 
WHERE username = 'user1' and password = crypt('password1', password);
```


## Procedimiento almacenado - user_login

```sql
CREATE OR REPLACE FUNCTION user_login(user_name VARCHAR, user_password VARCHAR)
AS $$
    DECLARE
        was_found BOOLEAN;
    BEGIN
        SELECT count(*) into was_found from "user" 
        WHERE username = user_name and password = crypt(user_password, password);
    
        if ( was_found = false ) THEN
            INSERT INTO session_failed (username, when) VALUES (user_name, now());
            COMMIT; -- al levantar una excepcion se hace un rollback, por lo que se debe hacer un commit antes de levantar la excepcion
            RAISE EXCEPTION 'Usuario o contraseña incorrecta';
        END IF;

        UPDATE "user" SET last_login = now() WHERE username = user_name;

        COMMIT;
    END;
$$ LANGUAGE plpgsql;

CALL user_login('user1', 'password1');
```

## Trigger - user_login

> nota: crear una tabla `session` con los campos id, user_id(int), last_login(timestamp).

```sql
CREATE OR REPLACE TRIGGER create_session_trigger AFTER UPDATE on "user"
    FOR EACH ROW 
    WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login)
    EXECUTE FUNCTION create_session_log();

CREATE OR REPLACE FUNCTION create_session_log()
RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO "session" (user_id, last_login) VALUES (NEW.id, now());
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CALL user_login('user1', 'password1');
```
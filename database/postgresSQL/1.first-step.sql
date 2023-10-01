
CREATE TABLE users(
    name VARCHAR(100) UNIQUE
);

INSERT INTO users (name) 
VALUES ('Juan'), ('Vanessa'), ('Berlin'), ('Iris'), ('Leo'), ('nn');

--  Se recomienda desactivar el autocommit para poder hacer rollback 

UPDATE users
SET name = 'JuanMaAV92'
WHERE name = 'Juan';

SELECT * FROM users LIMIT 2 OFFSET 2;

SELECT * FROM users WHERE name = 'Berlin';

DELETE FROM users WHERE name = 'nn';

DELETE FROM users;

-- Elimina la tabla y todos los datos que contiene, sin embargo, puede presentar problemas con constraints y relaciones
DROP TABLE users;

-- Elimina todos los datos de la tabla, pero no la tabla en sí
TRUNCATE TABLE users;
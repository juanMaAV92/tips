
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


-- Operadores de Strings y funciones
SELECT
	id,
	UPPER(name) AS upper_name,
	LOWER(name) AS lower_name,
	LENGTH(name) as LENGTH,
	(20 * 2) as constante,
	'*'||id||'-'|| name||'*' as barcode,
	CONCAT( '*',id,'-', name,'*' ),
	name
FROM
	users;

-- Substring and position
SELECT
	name,
	-- 	SUBSTRING( name, 0, 5 ),
	-- 	POSITION( ' ' in name ),
	SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,
	SUBSTRING(name, POSITION(' ' IN name) + 1) AS last_name
	-- 	TRIM(SUBSTRING( name, POSITION( ' ' in name ) )) as trimmed_last_name
FROM
	users;

-- Seperar el nombre en dos columnas first_name y last_name
UPDATE
	users
SET
	first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
	last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);
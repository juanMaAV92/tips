
-- Create a table named 'users' with a single column 'name' of type VARCHAR(100) and UNIQUE constraint
CREATE TABLE users(
    name VARCHAR(100) UNIQUE
);

-- Insert some initial data into the 'users' table
INSERT INTO users (name) 
VALUES ('Juan'), ('Vanessa'), ('Berlin'), ('Iris'), ('Leo'), ('nn');

--  Se recomienda desactivar el autocommit para poder hacer rollback 

-- Update the name of a user from 'Juan' to 'JuanMaAV92'
UPDATE users
SET name = 'JuanMaAV92'
WHERE name = 'Juan';

-- Select the third and fourth users from the 'users' table
SELECT * FROM users LIMIT 2 OFFSET 2;

-- Select the user with the name 'Berlin' from the 'users' table
SELECT * FROM users WHERE name = 'Berlin';

-- Delete the user with the name 'nn' from the 'users' table
DELETE FROM users WHERE name = 'nn';

-- Delete all users from the 'users' table
DELETE FROM users;

-- Drop the 'users' table along with all its data
DROP TABLE users;

-- Delete all data from the 'users' table but keep the table structure
TRUNCATE TABLE users;ß


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

-- Select some data from the 'users' table and apply some string functions and operators
SELECT
    id,
    UPPER(name) AS upper_name,  -- Convert the name to uppercase
    LOWER(name) AS lower_name,  -- Convert the name to lowercase
    LENGTH(name) as LENGTH,  -- Get the length of the name
    (20 * 2) as constante,  -- Calculate a constant value
    '*'||id||'-'|| name||'*' as barcode,  -- Concatenate some values to form a barcode
    CONCAT( '*',id,'-', name,'*' ),  -- Another way to concatenate values
    name
FROM
	users;

-- Select the name from the 'users' table and split it into first_name and last_name using the space character as the separator
SELECT
    name,
    SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,  -- Get the first name
    SUBSTRING(name, POSITION(' ' IN name) + 1) AS last_name  -- Get the last name
FROM
    users;

-- Update the 'users' table by splitting the name into first_name and last_name
UPDATE
    users
SET
    first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),  -- Set the first name
    last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);  -- Set the last name

-- Select the name from the 'users' table, split it into first_name and last_name, and trim the last name
select 
    name,
    SUBSTRING( name, 0, 5 ),  -- Get the first 5 characters of the name
    POSITION( ' ' in name ),  -- Get the position of the space character in the name
    SUBSTRING( name, 0, POSITION( ' ' in name ) ) as first_name,  -- Get the first name
SELECT * FROM users;

-- Operador BETWEEN
SELECT 
    first_name, 
    last_name, 
    followers 
FROM 
    users 
WHERE 
    -- followers > 4600 and followers < 4700
    followers between 4600 and 4700
order by
    followers desc;

-- Funciones de agregación
SELECT 
    count(*) as total_users, 
    MIN(followers) as min_followers,
    MAX(followers) as max_followers,
    ROUND(AVG(followers)) as avg_followers,
    SUM(followers)/count(*) as avg_followers_manual
FROM 
    users;

-- Group by
SELECT
    count(*),
    followers
FROM
    users
WHERE
    followers = 4 or followers = 4999
GROUP BY
    followers
ORDER BY
    followers desc;

-- having
SELECT
    count(*),
    country
FROM
    users
GROUP BY
    country
HAVING
    count(*) > 5
ORDER BY
    country asc;

-- distinct, muestra valores unicos no repetidos
SELECT distinct country FROM users;

-- consulta para extraer el dominio de los correos
SELECT
    SUBSTRING(email, POSITION('@' in email) + 1) as domain
FROM
    users
group by
    domain
HAVING
    count(*) > 1;  




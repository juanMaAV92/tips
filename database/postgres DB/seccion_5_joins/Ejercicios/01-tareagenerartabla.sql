

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

(SELECT
    COUNT(*) AS Total,
    b.name AS Continent
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
WHERE
    b.name NOT IN ('North America', 'South America', 'Central America')
GROUP BY
    b.name
)
UNION
(
SELECT
    COUNT(*) AS Total,
    'America' AS Continent
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
WHERE
    b.name IN ('North America', 'South America', 'Central America')
GROUP BY
    'America'
)
ORDER BY
    Total ASC;

-- Demostrar cual es el pais con mas ciudades
-- campos: total de ciudades y nombre del pais

SELECT
    COUNT(*) AS Total,
    b.name AS Country
FROM 
    city a
    INNER JOIN country b ON a.countrycode s = b.code
GROUP BY
    b.name
ORDER BY
    Total DESC
LIMIT 1;

-- Conocer los idiomas oficiales que se hablan en cada continente

SELECT * FROM countrylanguage WHERE isofficial = true;

SELECT * FROM country;

SELECT * FROM continent;

SELECT DISTINCT a."language", c."name" FROM countrylanguage a 
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
WHERE isofficial = true;

-- Conocer cuantos idiomas oficiales que se hablan en cada continente
SELECT
    COUNT(*) AS Total,
    continent
(   SELECT a."language", c."name" as continent FROM countrylanguage a 
    INNER JOIN country b ON a.countrycode = b.code
    INNER JOIN continent c ON b.continent = c.code
    WHERE isofficial = true
)
GROUP BY
   continent;

-- No usar el a.languaje ya que se debe usar la relacion con la tabla lenguaje
SELECT DISTINCT a."language", c."name" FROM countrylanguage a 
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
INNER JOIN language d ON a.language = d.code
WHERE isofficial = true;


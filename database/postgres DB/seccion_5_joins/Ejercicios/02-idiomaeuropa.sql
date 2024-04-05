

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

SELECT * from countrylanguage where isofficial = true;

SELECT * from country;

SELECT * from continent;

SELECT 
    count(*) as Total,
    b.lenguajecode,
    b."language"
FROM 
    country a
    INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE 
    a.continent = 'Europe'  AND
    b.isofficial = true
GROUP BY
   b.lenguajecode, b."language"
ORDER BY Total DESC
LIMIT 1;


-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)








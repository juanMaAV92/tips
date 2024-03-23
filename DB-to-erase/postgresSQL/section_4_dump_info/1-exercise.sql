-- create a continent table and create de relation with country table
CREATE TABLE  "public"."continent" (
    "code"  serial NOT NULL,
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- insert data into continent table
INSERT INTO continent (name) SELECT DISTINCT continent FROM country order by continent asc; 

-- drop the check constraint in country table
ALTER TABLE country DROP CONSTRAINT country_continent_check;

-- check the data in country table, "a" is a alias for country table and "b" is a alias for continent table
SELECT
    a.name,
    a.continent,
    ( SELECT "code" FROM continent b WHERE b.name = a.continent )
FROM
    country a;

-- update the continent column in country table with the continent code
UPDATE country a
SET
    continent = (
        SELECT
            "code"
        FROM
            continent b
        WHERE
            b.name = a.continent
    )

-- change de type of continent column in country table
ALTER TABLE country 
    ALTER COLUMN continent TYPE int4 
    USING continent::integer;

-- add the foreign key in country table
ALTER TABLE country ADD FOREIGN KEY ("continent") REFERENCES continent ("code"); 

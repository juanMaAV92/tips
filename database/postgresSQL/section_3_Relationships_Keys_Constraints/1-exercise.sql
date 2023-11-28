
SELECT * FROM country;

-- 1. Add a primary key to the country table called code.
ALTER TABLE country ADD PRIMARY KEY (code);

-- The DB has duplicate rows for the Netherlands. Delete the one with the code2 value of NA.
SELECT * FROM country WHERE code = 'NLD';
DELETE FROM country WHERE code = 'NLD' AND code2 = 'NA';

ALTER TABLE country ADD PRIMARY KEY (code);

-- 2. Check constraints, verify one o more fields
ALTER TABLE country ADD CHECK(surfacearea >= 0);

SELECT DISTINCT continent FROM country;
ALTER TABLE country ADD CHECK(continent IN ('Asia', 'Europe', 'North America', 'Africa', 'Oceania', 'Antarctica', 'South America'));

-- Add Central America to the list of continents and update the continent field for all countries in Central America region.
ALTER TABLE country DROP CONSTRAINT "country_continent_check";
ALTER TABLE country ADD CHECK(continent IN ('Asia', 'Europe', 'North America', 'Africa', 'Oceania', 'Antarctica', 'South America', 'Central America'));
UPDATE country SET continent = 'Central America' WHERE region = 'Central America' AND continent = 'North America';

-- 3. Create Indexes
CREATE UNIQUE INDEX "unique_country_name" ON country (name);

CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (name, countrycode, district);
CREATE index "index_district" on city(district)

-- Foreign key
ALTER TABLE city ADD CONSTRAINT fk_contry_code 
    FOREIGN KEY ( countrycode )
    REFERENCES country( code );

-- In country table missing a country with code = 'AFG'
INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');


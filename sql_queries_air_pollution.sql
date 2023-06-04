CREATE TABLE air_pollutant_2000 AS
SELECT * FROM public.air_pollutant 
WHERE year > 2000

DROP TABLE IF EXISTS country_allpollutants_2020;
SELECT co2_emmission.country,co2_emmission.country_code,co2_emmission.year,nitrogen_oxide,sulphur_dioxide,voc,co2 FROM co2_emmission
INNER JOIN air_pollutant_2000
ON co2_emmission.country = air_pollutant_2000.country AND co2_emmission.year = air_pollutant_2000.year

DROP TABLE IF EXISTS country_allpollutants_2020;
CREATE TABLE country_allpollutants_2020 AS 
SELECT co2_emmission.country,co2_emmission.country_code,co2_emmission.year,nitrogen_oxide,sulphur_dioxide,voc,co2 FROM co2_emmission
INNER JOIN air_pollutant_2000
ON co2_emmission.country = air_pollutant_2000.country AND co2_emmission.year = air_pollutant_2000.year

DROP TABLE IF EXISTS airpollution_superpowers;
CREATE TABLE airpollution_superpowers AS
SELECT 
	co2_emmission.country,
	co2_emmission.country_code,
	co2_emmission.year,
	co2,
	death_rate,
	airp.nitrogen_oxide,
	airp.sulphur_dioxide,
	airp.voc
FROM co2_emmission
INNER JOIN airpollution_deathrate
	ON co2_emmission.country = airpollution_deathrate.country
	AND co2_emmission.year = airpollution_deathrate.year
INNER JOIN air_pollutant AS airp
	ON co2_emmission.country = airp.country
	AND co2_emmission.year = airp.year
	
ALTER TABLE allpollutants_2000
RENAME TO pollutants_2000

ALTER TABLE co2_emmission
RENAME TO co2_allcountries

ALTER TABLE airpollution_deathrate
RENAME TO deathrate_all

ALTER TABLE co2_allcountries
RENAME TO co2_all

ALTER TABLE airpollution_superpowers
RENAME TO airpollution_sp

ALTER TABLE airpollutant_superpower 
RENAME TO airpollutant_sp

alter table pollutants_2000
RENAME TO pollutants_sp
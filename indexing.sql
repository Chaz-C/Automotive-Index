DROP USER IF EXISTS indexed_cars_user;
DROP DATABASE IF EXISTS indexed_cars;
DROP TABLE IF EXISTS car_models;
CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;

\c indexed_cars;

\i scripts/car_models.sql

\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql

DROP INDEX IF EXISTS lam_index;
DROP INDEX IF EXISTS nissan_title;
DROP INDEX IF EXISTS lam_info;
DROP INDEX IF EXISTS cars_2010to2015;
DROP INDEX IF EXISTS cars_in_2010;

SELECT DISTINCT make_title
FROM car_models
WHERE make_code = 'LAM'; -- 30.579 ms

SELECT DISTINCT model_title
FROM car_models
WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; -- 25.889 ms

SELECT make_code, model_code, model_title, year
FROM car_models
WHERE make_code = 'LAM'; -- 25.273 ms

SELECT *
FROM car_models
WHERE year BETWEEN 2010 AND 2015; -- 75.128 ms

SELECT *
FROM car_models
WHERE year = 2010; -- 31.439 ms



CREATE INDEX lam_index
ON car_models
(make_title)
WHERE make_code ='LAM';

CREATE INDEX nissan_title
ON car_models
(model_title)
WHERE make_code = 'NISSAN' AND model_code = 'GT-R';

CREATE INDEX lam_info
ON car_models
(make_code, model_code, model_title, year)
WHERE make_code = 'LAM';

CREATE INDEX cars_2010to2015
ON car_models
(make_code, make_title, model_code, model_title, year)
WHERE year BETWEEN 2010 AND 2015;

CREATE INDEX cars_in_2010
ON car_models
(make_code, make_title, model_code, model_title, year)
WHERE year = 2010;



SELECT DISTINCT make_title
FROM car_models
WHERE make_code = 'LAM'; -- 1.015 ms

SELECT DISTINCT model_title
FROM car_models
WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; -- 0.389 ms

SELECT make_code, model_code, model_title, year
FROM car_models
WHERE make_code = 'LAM'; -- 0.990 ms

SELECT *
FROM car_models
WHERE year BETWEEN 2010 AND 2015; -- 73.566 ms

SELECT *
FROM car_models
WHERE year = 2010; -- 11.294 ms

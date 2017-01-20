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

SELECT DISTINCT make_title
FROM car_models
WHERE make_code = 'LAM'; -- time: 2.889 ms w/index _____ 144.549 ms w/out index

SELECT DISTINCT model_title
FROM car_models
WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; -- time: 1.071 ms w/index _____ 144.208 ms w/out index

SELECT make_code, model_code, model_title, year
FROM car_models
WHERE make_code = 'LAM'; -- time: 5.601 ms w/index ___ 145.201 ms w/out index __ 419.151 ms w/out index

SELECT *
FROM car_models
WHERE year BETWEEN 2010 AND 2015; -- time: 277.521 ms w/index ___ 417.868 ms w/out index

SELECT *
FROM car_models
WHERE year = 2010; -- time: 51.615 ms w/index __ 194.930 ms w/out index

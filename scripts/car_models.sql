-- db indexed_cars

CREATE TABLE IF NOT EXISTS car_models
(
 id serial,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 PRIMARY KEY (id)
);


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

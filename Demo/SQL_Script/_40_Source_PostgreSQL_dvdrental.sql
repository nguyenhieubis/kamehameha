-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// actor //------------------------- --
-- PROCEDURE: sp_select_actor
DROP FUNCTION IF EXISTS "sp_select_actor"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_actor"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("actor_id" integer,
"first_name" character varying,
"last_name" character varying,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "actor_id",
"first_name",
"last_name",
"last_update"
FROM actor
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// store //------------------------- --
-- PROCEDURE: sp_select_store
DROP FUNCTION IF EXISTS "sp_select_store"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_store"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("store_id" integer,
"manager_staff_id" smallint,
"address_id" smallint,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "store_id",
"manager_staff_id",
"address_id",
"last_update"
FROM store
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// address //------------------------- --
-- PROCEDURE: sp_select_address
DROP FUNCTION IF EXISTS "sp_select_address"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_address"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("address_id" integer,
"address" character varying,
"address2" character varying,
"district" character varying,
"city_id" smallint,
"postal_code" character varying,
"phone" character varying,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "address_id",
"address",
"address2",
"district",
"city_id",
"postal_code",
"phone",
"last_update"
FROM address
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// category //------------------------- --
-- PROCEDURE: sp_select_category
DROP FUNCTION IF EXISTS "sp_select_category"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_category"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("category_id" integer,
"name" character varying,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "category_id",
"name",
"last_update"
FROM category
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// city //------------------------- --
-- PROCEDURE: sp_select_city
DROP FUNCTION IF EXISTS "sp_select_city"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_city"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("city_id" integer,
"city" character varying,
"country_id" smallint,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "city_id",
"city",
"country_id",
"last_update"
FROM city
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// country //------------------------- --
-- PROCEDURE: sp_select_country
DROP FUNCTION IF EXISTS "sp_select_country"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_country"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("country_id" integer,
"country" character varying,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "country_id",
"country",
"last_update"
FROM country
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// customer //------------------------- --
-- PROCEDURE: sp_select_customer
DROP FUNCTION IF EXISTS "sp_select_customer"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_customer"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("customer_id" integer,
"store_id" smallint,
"first_name" character varying,
"last_name" character varying,
"email" character varying,
"address_id" smallint,
"activebool" boolean,
"create_date" date,
"last_update" timestamp without time zone,
"active" integer
)
LANGUAGE 'sql'
AS $BODY$
SELECT "customer_id",
"store_id",
"first_name",
"last_name",
"email",
"address_id",
"activebool",
"create_date",
"last_update",
"active"
FROM customer
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// film_actor //------------------------- --
-- PROCEDURE: sp_select_film_actor
DROP FUNCTION IF EXISTS "sp_select_film_actor"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_film_actor"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("actor_id" smallint,
"film_id" smallint,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "actor_id",
"film_id",
"last_update"
FROM film_actor
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// film_category //------------------------- --
-- PROCEDURE: sp_select_film_category
DROP FUNCTION IF EXISTS "sp_select_film_category"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_film_category"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("film_id" smallint,
"category_id" smallint,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "film_id",
"category_id",
"last_update"
FROM film_category
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// inventory //------------------------- --
-- PROCEDURE: sp_select_inventory
DROP FUNCTION IF EXISTS "sp_select_inventory"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_inventory"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("inventory_id" integer,
"film_id" smallint,
"store_id" smallint,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "inventory_id",
"film_id",
"store_id",
"last_update"
FROM inventory
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// language //------------------------- --
-- PROCEDURE: sp_select_language
DROP FUNCTION IF EXISTS "sp_select_language"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_language"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("language_id" integer,
"name" character,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "language_id",
"name",
"last_update"
FROM language
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// rental //------------------------- --
-- PROCEDURE: sp_select_rental
DROP FUNCTION IF EXISTS "sp_select_rental"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_rental"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("rental_id" integer,
"rental_date" timestamp without time zone,
"inventory_id" integer,
"customer_id" smallint,
"return_date" timestamp without time zone,
"staff_id" smallint,
"last_update" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "rental_id",
"rental_date",
"inventory_id",
"customer_id",
"return_date",
"staff_id",
"last_update"
FROM rental
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// staff //------------------------- --
-- PROCEDURE: sp_select_staff
DROP FUNCTION IF EXISTS "sp_select_staff"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_staff"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("staff_id" integer,
"first_name" character varying,
"last_name" character varying,
"address_id" smallint,
"email" character varying,
"store_id" smallint,
"active" boolean,
"username" character varying,
"password" character varying,
"last_update" timestamp without time zone,
"picture" bytea
)
LANGUAGE 'sql'
AS $BODY$
SELECT "staff_id",
"first_name",
"last_name",
"address_id",
"email",
"store_id",
"active",
"username",
"password",
"last_update",
"picture"
FROM staff
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// payment //------------------------- --
-- PROCEDURE: sp_select_payment
DROP FUNCTION IF EXISTS "sp_select_payment"();

CREATE FUNCTION "sp_select_payment"()
RETURNS TABLE("payment_id" integer,
"customer_id" smallint,
"staff_id" smallint,
"rental_id" integer,
"amount" numeric,
"payment_date" timestamp without time zone
)
LANGUAGE 'sql'
AS $BODY$
SELECT "payment_id",
"customer_id",
"staff_id",
"rental_id",
"amount",
"payment_date"
FROM payment;
$BODY$;


-- --// PostgreSQL - localhost - dvdrental //-- --
-- -------------------------// film //------------------------- --
-- PROCEDURE: sp_select_film
DROP FUNCTION IF EXISTS "sp_select_film"(WatermarkValue timestamp, NewWatermarkValue timestamp);

CREATE FUNCTION "sp_select_film"(WatermarkValue timestamp, NewWatermarkValue timestamp)
RETURNS TABLE("film_id" integer,
"title" character varying,
"description" text,
"release_year" integer,
"language_id" smallint,
"rental_duration" smallint,
"rental_rate" numeric,
"length" smallint,
"replacement_cost" numeric,
"rating" mpaa_rating,
"last_update" timestamp without time zone,
"special_features" _text,
"fulltext" tsvector
)
LANGUAGE 'sql'
AS $BODY$
SELECT "film_id",
"title",
"description",
"release_year",
"language_id",
"rental_duration",
"rental_rate",
"length",
"replacement_cost",
"rating",
"last_update",
"special_features",
"fulltext"
FROM film
WHERE "last_update" >= WatermarkValue AND "last_update" <= NewWatermarkValue;
$BODY$;



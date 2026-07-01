DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers (
    id INT, name VARCHAR(50), country VARCHAR(5),
    phone VARCHAR(20), email VARCHAR(100), region VARCHAR(10)
);
INSERT INTO customers VALUES
    (1, ' Asha ',  'us', '555-0101', 'a@shop.com', 'West'),
    (2, 'Ben',     'Us', '617-0102', 'b@mail.io',  NULL),
    (3, ' Carmen', 'uK', '207-0103', 'c@shop.com', 'West');

CREATE TABLE staging (row_id INT, raw_amount VARCHAR(20));
INSERT INTO staging VALUES (1,'100.50'), (2,'250.00'), (3,'N/A');   -- row 3 is bad

SELECT TRIM(name)                       AS clean_name,
       UPPER(country)                   AS clean_country,
       SUBSTR(phone, 1, 3)              AS area_code,
       REPLACE(phone, '-', '')          AS clean_phone,
       SPLIT_PART(email, '@', 2)        AS email_domain,
       'Ms.' || TRIM(name)              AS full_name
FROM customers;

SELECT 5 / 2                   AS int_div,   -- = 2   (integer division!)
       5.0 / 2                 AS dec_div,   -- = 2.5
       CAST(5 AS NUMERIC) / 2  AS safe_div;  -- = 2.5 (cast first)


SELECT CURRENT_DATE AS today,
       DATE_PART('year', CURRENT_DATE) AS this_year,
       DATE_PART('month', CURRENT_DATE) AS this_month,
       DATE_PART('day', CURRENT_DATE) AS this_day,
       DATE_PART('dow', CURRENT_DATE) AS this_dow,
       DATE_PART('doy', CURRENT_DATE) AS this_doy,
       DATE_PART('week', CURRENT_DATE) AS this_week,
       DATE_PART('hour', CURRENT_DATE) AS this_hour,
       DATE_PART('minute', CURRENT_DATE) AS this_minute,
       DATE_PART('second', CURRENT_DATE) AS this_second,
       EXTRACT(YEAR FROM CURRENT_DATE) AS this_year,
       EXTRACT(MONTH FROM CURRENT_DATE) AS this_month,
       EXTRACT(DAY FROM CURRENT_DATE) AS this_day,
       DATE_TRUNC('year', CURRENT_DATE) AS start_of_year,
       DATE_TRUNC('month', CURRENT_DATE) AS start_of_month,
       DATE_TRUNC('day', CURRENT_DATE) AS start_of_day,
       DATE_TRUNC('hour', CURRENT_DATE) AS start_of_hour,
       DATE_TRUNC('minute', CURRENT_DATE) AS start_of_minute,
       DATE_TRUNC('second', CURRENT_DATE) AS start_of_second,
       CURRENT_DATE + INTERVAL '30 days' AS ADD_30_DAYS;

SELECT * FROM orders;

SELECT CASE 
WHEN amount > 250 THEN 'High'
WHEN amount > 100 THEN 'Medium'
WHEN amount > 80 THEN 'Low'
ELSE 'Very Low'
END AS order_size
FROM orders;

select id,
case when region is null then 'Unknown'
else region
end as region
from customers;

select id, coalesce(region, 'Unknown') as region from customers;

SELECT CAST('2026-01-15' AS DATE) AS d, '3.14'::NUMERIC AS pi;

select cast(3.14 as INT), 3.14::INT, cast(3.14 as NUMERIC(5,2)), 3.14::NUMERIC(5,2);

select * from staging;

select cast(raw_amount as NUMERIC) from staging; -- ERROR as 'N/A' cannot be cast to NUMERIC

select try_cast(raw_amount as NUMERIC) as AMOUNT from staging; -- returns NULL for 'N/A'
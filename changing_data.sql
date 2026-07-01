DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;

CREATE TABLE departments (dept_id INT PRIMARY KEY, dept_name VARCHAR(50));
INSERT INTO departments VALUES (10,'Engineering'),(20,'Sales'),(30,'Support');

CREATE TABLE customers (customer_id INT PRIMARY KEY, name VARCHAR(50), region VARCHAR(10));
INSERT INTO customers VALUES (42,'Asha','West'),(43,'Ben','East'),(44,'Carmen','West');

CREATE TABLE orders (
    order_id    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT,
    amount      NUMERIC(10,2),
    status      VARCHAR(20),
    region      VARCHAR(10)
);
INSERT INTO orders (customer_id, amount, status, region) VALUES
    (42,100.00,'packed', NULL),
    (43,250.00,'packed', NULL),
    (44, 75.00,'shipped',NULL),
    (42,300.00,'packed', NULL);



BEGIN;
UPDATE orders AS o SET region = (
    SELECT c.region
    FROM customers c
    WHERE c.customer_id = o.customer_id
) 
WHERE EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.customer_id = o.customer_id
);
COMMIT;

ROLLBACK;

SELECT * FROM orders;

INSERT INTO orders (customer_id, amount) VALUES (42, 100.00)
RETURNING order_id, customer_id;       -- e.g. → 1005, 2026-06-29 10:00:00

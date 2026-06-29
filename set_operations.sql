CREATE TABLE web_orders   (order_id VARCHAR(4) PRIMARY KEY, customer_id INT);
CREATE TABLE store_orders (order_id VARCHAR(4) PRIMARY KEY, customer_id INT);

INSERT INTO web_orders VALUES
    ('W1',101),('W2',102),('W3',102),('W4',103),('W5',104);   -- 102 appears twice
INSERT INTO store_orders VALUES
    ('S1',102),('S2',104),('S3',105),('S4',106),('S5',102);   -- 102 appears twice

SELECT customer_id FROM web_orders
UNION ALL
SELECT customer_id FROM store_orders;

SELECT customer_id FROM web_orders
UNION
SELECT customer_id FROM store_orders;

SELECT customer_id FROM web_orders
INTERSECT
SELECT customer_id FROM store_orders;

SELECT customer_id FROM web_orders
EXCEPT                  -- MINUS in Oracle
SELECT customer_id FROM store_orders;

-- Name comes from 1st query

SELECT customer_id, 'web' AS channel FROM web_orders
UNION ALL
SELECT customer_id, 'store'         FROM store_orders   -- 'store' label, name ignored
ORDER BY customer_id;                                -- one ORDER BY, applies to all

select e.name, d.dept_name from employees e JOIN
departments d ON e.dept_id = d.dept_id;

select e.name, d.dept_name from employees e JOIN
departments d USING (dept_id);

select e.name, d.dept_name from employees e NATURAL JOIN
departments d

EXPLAIN (select e.name, d.dept_name from employees e NATURAL JOIN
departments d)

-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- 1. Create the Customers Table (The "Small" Side)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);

-- 2. Create the Orders Table (The "Large" Side)
-- NOTICE: We purposefully DO NOT add an index on customer_id yet!
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount NUMERIC
);

-- 3. Insert 10,000 Dummy Customers
INSERT INTO customers (customer_id, customer_name, country)
SELECT 
    i, 
    'Customer_' || i, 
    (ARRAY['US', 'IN', 'UK', 'CA'])[floor(random() * 4) + 1]
FROM generate_series(1, 10000) AS i;

-- 4. Insert 100,000 Dummy Orders (Linked back to our 10,000 customers)
INSERT INTO orders (order_id, customer_id, order_date, amount)
SELECT 
    i, 
    floor(random() * 10000) + 1, -- Picks a customer between 1 and 10,000
    CURRENT_DATE - (random() * 365)::INT,
    (random() * 500)::NUMERIC(10,2)
FROM generate_series(1, 100000) AS i;

-- 5. Force Postgres to update its internal statistics about table sizes
ANALYZE customers;
ANALYZE orders;

EXPLAIN (ANALYZE, COSTS FALSE, TIMING FALSE)
SELECT * 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;


-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- Note: No NOT NULL constraint here
    order_date DATE,
    amount NUMERIC(10,2)
);

-- Insert 5 specific customers
INSERT INTO customers (customer_id, customer_name, country) VALUES
(1, 'Amit Sharma',  'IN'), -- Has multiple orders (tests duplication)
(2, 'John Doe',     'US'), -- Has one order above 450 (tests high-value)
(3, 'Sarah Jenkins', 'UK'), -- Has one small order 
(4, 'Ravi Kumar',   'IN'), -- Has NO orders (tests anti-join)
(5, 'Jane Smith',    'CA'); -- Has NO orders (tests anti-join)

-- Insert specific orders (including a NULL customer_id trap)
INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1,    '2026-06-01', 150.00), -- Amit Order 1
(102, 1,    '2026-06-02', 200.00), -- Amit Order 2 (Duplication check)
(103, 2,    '2026-06-03', 480.00), -- John Order (High-value check > 450)
(104, 3,    '2026-06-04',  50.00), -- Sarah Order (Small value)
(105, NULL, '2026-06-05',  99.00); -- NULL TRAP (Will break NOT IN, but safe for NOT EXISTS)



-- Find all customers from the 'US' or 'IN' who have placed at least one order
SELECT * FROM customers c WHERE EXISTS(
    SELECT 1 FROM orders o WHERE c.customer_id = o.customer_id
    AND c.country IN ('US', 'IN')
);

-- Find all customers who have never placed an order, 
-- but ensure your query is completely null-safe so it won't break if a 
-- blank customer_id accidentally slips into the orders table later.

SELECT * FROM customers c WHERE NOT EXISTS(
    SELECT * FROM orders o where c.customer_id = o.customer_id
    AND o.customer_id  is not null
)

-- Select all columns from the customers table for users 
--who have placed an order with an amount greater than 450.00

select * from customers c where EXISTS (
    select * from orders o where o.customer_id = c.customer_id
    and o.amount > 450
)
SELECT CURRENT_DATE;
SELECT CURRENT_TIMESTAMP;

SELECT CURRENT_DATE + 7;
SELECT INTERVAL '2-6' YEAR TO MONTH;
SELECT INTERVAL '0 23:32:22.333' DAY TO SECOND;

SELECT * FROM EMPLOYEES;

INSERT INTO employees (emp_id, name, dept_id, salary, hired_on) VALUES
    (110, NULL, 3, 61000.00, NULL);

ALTER TABLE EMPLOYEES ALTER COLUMN SALARY DROP NOT NULL;
ALTER TABLE EMPLOYEES ALTER COLUMN name DROP NOT NULL;

SELECT * FROM EMPLOYEES ORDER BY NAME NULLS FIRST;

SELECT * FROM employees WHERE (dept_id, salary) > ($1, $2)
ORDER BY dept_id, salary;


-- Create the test table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    status VARCHAR(50)
);

-- Insert sample data (including a NULL status)
INSERT INTO orders (order_id, customer_id, status) VALUES
(1, 101, 'Completed'),
(2, 102, 'Pending'),
(3, 103, NULL),
(4, 104, 'Shipped');

SELECT * FROM orders where status not in (NULL, 'Completed');

SELECT * FROM orders where not exists 
(select NULL UNION ALL select 'Completed');

SELECT * 
FROM orders 
WHERE status NOT IN (
    SELECT NULL
    UNION ALL
    SELECT 'Completed'
);


SELECT o.* 
FROM orders o 
WHERE NOT EXISTS (
    -- 1. Wrap the rows in a subquery with an alias (sub)
    SELECT 1 
    FROM (
        SELECT NULL AS status 
        UNION ALL 
        SELECT 'Completed' AS status
    ) sub
    -- 2. Link the outer table to the inner subquery
    WHERE o.status = sub.status
);

select outt.* from orders as outt
where not exists
(select * from orders as inn 
where outt.status=inn.status and inn.status = 'Completed'
)
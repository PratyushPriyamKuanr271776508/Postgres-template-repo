ALTER TABLE employees ADD email VARCHAR(255);
ALTER TABLE employees ALTER COLUMN salary SET NOT NULL;

CREATE TABLE order_lines(
    order_id INTEGER GENERATED ALWAYS AS IDENTITY,
    -- line_no INTEGER NOT NULL,
    -- product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price INTEGER NOT NULL,
    line_total INTEGER GENERATED ALWAYS AS (quantity * unit_price) STORED
    -- CONSTRAINT pk_order_lines PRIMARY KEY (order_id, line_no),
    -- CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    -- CONSTRAINT chk_qty CHECK (quantity > 0)
);

INSERT INTO order_lines (quantity, unit_price) VALUES
    (2, 10),
    (3, 15),
    (1, 25),
    (5, 8),
    (4, 12);


SELECT SYSDATE FROM DUAL;
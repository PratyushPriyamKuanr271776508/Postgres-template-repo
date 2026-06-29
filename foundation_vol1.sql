CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INTEGER REFERENCES departments(dept_id),
    salary NUMERIC(10, 2),
    hired_on DATE
);

INSERT INTO departments (dept_id, dept_name) VALUES
    (1, 'Engineering'),
    (2, 'Human Resources'),
    (3, 'Marketing'),
    (4, 'Sales');

INSERT INTO employees (emp_id, name, dept_id, salary, hired_on) VALUES
    (101, 'Ava Turner', 1, 95000.00, '2022-04-11'),
    (102, 'Miguel Reed', 1, 88000.00, '2023-01-09'),
    (103, 'Priya Shah', 2, 68000.00, '2021-09-27'),
    (104, 'Jordan Kim', 3, 72000.00, '2024-03-18'),
    (105, 'Sophia Brooks', 4, 79000.00, '2022-11-02');

INTERVAL YEAR TO MONTH
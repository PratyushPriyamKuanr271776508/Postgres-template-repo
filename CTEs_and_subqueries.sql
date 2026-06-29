-- Clean up existing tables
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-- 1. Create Tables
CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO departments VALUES (10,'Engineering'),(20,'Sales'),(30,'Support');

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(50),
    dept_id    INT REFERENCES departments(dept_id),
    salary     INT,
    manager_id INT REFERENCES employees(emp_id)
);
INSERT INTO employees VALUES
    (1,'Asha',   10, 95000, NULL),
    (2,'Ben',    10, 62000, 1),
    (3,'Carmen', 20, 81000, 1),
    (4,'Dan',    20, 58000, 3),
    (5,'Eva',    20, 72000, 3),
    (6,'Faye',   30, 54000, 1),
    (7,'Gita',   30, 48000, 6);


-- SCALAR SUBQUERY: Find employees who earn more than the company-wide average
select * from employees where salary > (select avg(salary) from employees)

-- TABLE SUBQUERY: show each department's name alongside its average salary.
select d.dept_name, e.avg_salary from departments d
join (select dept_id, AVG(salary) as avg_salary FROM employees GROUP BY dept_id) e 
using (dept_id);

-- SCALAR SUBQUERY(select): list each employee with the company average beside them. 
-- The subquery runs (conceptually) for each row, though here it's a constant:
SELECT *, (SELECT AVG(salary) FROM employees) avg_company_salary FROM employees;

-- CORRELATED SUBQUERIES: which employees earn above their own department's average? 
-- Now the comparison value isn't a single company-wide number — 
-- it depends on which department the current employee is in.

SELECT * FROM employees e WHERE e.salary >
(SELECT AVG(d.salary) avg_salary_by_dept FROM employees d 
WHERE e.dept_id=d.dept_id);

-- CTE:  count, per department, 
-- how many employees earn above their department's average. 
-- Watch how it reads as a pipeline of named steps.

WITH dept_avg_sal AS(
SELECT dept_id, AVG(salary) avg_sal_by_dept FROM employees GROUP BY dept_id
),
emp_sal_above_dept_avg AS(
SELECT d1.dept_name, count(*) num_employees_per_dept_with_sal_gt_dept_avg FROM employees e 
JOIN dept_avg_sal d USING (dept_id)
JOIN departments d1 USING (dept_id)
WHERE e.salary > d.avg_sal_by_dept GROUP BY d1.dept_name
)
select * from emp_sal_above_dept_avg;

-- RECIRSIVE CTE: managers and employees under them
WITH RECURSIVE org AS(
    -- Anchor query
    SELECT emp_id, name, manager_id, 1 AS level
    FROM employees
    UNION ALL
    -- Recursive query
    SELECT e.emp_id, e.name, e.manager_id,  o.level + 1 AS level
    FROM employees e JOIN org o ON e.manager_id = o.emp_id 
)
SELECT * FROM org;
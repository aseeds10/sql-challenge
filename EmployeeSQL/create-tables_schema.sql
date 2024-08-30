--Drop schema due to FKs
--find what my schema is
SELECT table_schema
FROM information_schema.tables
WHERE table_name = 'departments';

--drop that schema
DROP SCHEMA IF EXISTS public CASCADE;

-- Create a new schema named 'new_schema'
CREATE SCHEMA public;

-- Drop table if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create new table
CREATE TABLE departments (
dept_no VARCHAR(20) NOT NULL PRIMARY KEY,
dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles (
title_id VARCHAR(40) NOT NULL PRIMARY KEY,
title VARCHAR(40) NOT NULL
);

CREATE TABLE employees (
emp_no int NOT NULL PRIMARY KEY,
emp_title VARCHAR(40) NOT NULL,
birth_date date,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex CHAR(1),
hire_date date,
FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
emp_no int NOT NULL,
dept_no VARCHAR(20) NOT NULL,
PRIMARY KEY(emp_no,dept_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(20) NOT NULL,
emp_no int NOT NULL,
PRIMARY KEY(emp_no,dept_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
emp_no int NOT NULL PRIMARY KEY,
salary int,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- View table columns and datatypes
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
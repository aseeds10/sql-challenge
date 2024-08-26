-- Drop table if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create new table
CREATE TABLE departments (
dept_no VARCHAR,
dept_name VARCHAR
);

CREATE TABLE dept_emp (
emp_no int,
dept_no VARCHAR
);

CREATE TABLE dept_manager (
dept_no VARCHAR,
emp_no int
);

CREATE TABLE employees (
emp_no int,
emp_title VARCHAR,
birth_date date,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date date
);

CREATE TABLE salaries (
emp_no int,
salary int
);

CREATE TABLE titles (
title_id VARCHAR,
title VARCHAR
);

-- View table columns and datatypes
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
-- View table columns and datatypes
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--1. List the employee number, last name, first name, sex, 
--and salary of each employee.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--2. List the first name, last name, 
--and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(year FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
--join dept_manager and departments
SELECT dept_manager.emp_no, employees.last_name, 
	employees.first_name, dept_manager.dept_no, 
	departments.dept_name
FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no 
	WHERE employees.emp_no IN
	(SELECT emp_no 
		FROM dept_manager)

--4. List the department number for each employee along with 
--that employee’s employee number,last name, first name, and department name






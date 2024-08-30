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
SELECT dept_manager.emp_no, employees.last_name, 
	employees.first_name, dept_manager.dept_no, 
	departments.dept_name
FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no 
	WHERE employees.emp_no IN
	(SELECT emp_no 
		FROM dept_manager);

--4. List the department number for each employee along with 
--that employee’s employee number,last name, first name, and department name
SELECT dept_emp.emp_no, employees.last_name, 
	employees.first_name, dept_emp.dept_no, 
	departments.dept_name
FROM dept_emp
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no 
	WHERE employees.emp_no IN
	(SELECT emp_no 
		FROM dept_emp);


--5. List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee 
--number, last name, and first name.
--NOTE: I included managers in Sales department as they are employees too
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(SELECT dept_no
	FROM departments
	WHERE dept_name IN
	(SELECT dept_name
	FROM departments
	WHERE dept_name='Sales')))
UNION ALL
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no
	FROM dept_manager
	WHERE dept_no IN
	(SELECT dept_no
	FROM departments
	WHERE dept_name IN
	(SELECT dept_name
	FROM departments
	WHERE dept_name='Sales')))

--7. List each employee in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.

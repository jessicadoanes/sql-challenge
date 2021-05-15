--Dropping the tables 
DROP TABLE employees;

---Create the employees tables
CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no)
);

--Check data import
SELECT *
FROM employees

--Create the departments table
CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);
--Check data import 
SELECT * 
FROM departments 

--Create the department manager
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
    PRIMARY KEY (dept_no)
);
--Check data import
SELECT * 
FROM dept_manager; 
--Import dept_manager was not successful 

--Create the department employee
CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    PRIMARY KEY (emp_no)
);
--Check data import
SELECT * 
FROM dept_employee; 

--Create titles table
CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);
--Check data import
SELECT * 
FROM titles; 

--Create salaries table
CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    PRIMARY KEY (emp_no)
);

--Check data import
SELECT * 
FROM salaries; 

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--INNER JOIN on the tables 
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.salary;

--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date FROM employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

--3.List the manager of each department with the following information:department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON
departments.dept_no=dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales' OR dept_name = 'Development';

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;
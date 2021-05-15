﻿drop table Employees;
drop table Departments;
drop table Department_Employees;
drop table Department_Manager;
drop table Salaries; 
drop table Titles;

-- Logical
CREATE TABLE "Titles" (
    "title_id" INTEGER   NOT NULL,
    "title" INTEGER   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Department" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Dept_Employee" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dept_Employee" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employees" ("emp_title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department" ADD CONSTRAINT "fk_Department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_Manager" ("dept_no");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

-- DATA ANALYSIS 

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.


-- 2. List first name, last name, and hire date for employees who were hired in 1986.


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
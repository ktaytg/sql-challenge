-- Data Engineering --
-- Drop TABLE if exists
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-- Import CSV Files Into Corresponding SQL Table
-- Create table departments
CREATE TABLE departments (
    dept_no VARCHAR(30) NOT NULL,
    dept_name VARCHAR(100) NOT NULL,
	CONSTRAINT "pk_departments"
    PRIMARY KEY (dept_no)	
);

-- create table dept_emp
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(30) NOT NULL
);

-- create table dept_manager
CREATE TABLE dept_manager (
    dept_no VARCHAR(30) NOT NULL,
    emp_no INT NOT NULL   
);

-- create table employees
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(30) NOT NULL,
    birth_date date NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    sex VARCHAR(10) NOT NULL,
    hire_date date NOT NULL,
	 CONSTRAINT "pk_employees"
    PRIMARY KEY (emp_no)
);

-- create table salaries
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary numeric(10,2) NOT NULL
   
);


-- create table titles
CREATE TABLE titles (
    title_id varchar(30) not null,
    title varchar(100) not null,
	CONSTRAINT "pk_titles"
    PRIMARY KEY (title_id)
);


-- Confirming Data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
	REFERENCES "titles" ("title_id");
	
	ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
	REFERENCES "employees" ("emp_no");
	
	ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
	REFERENCES "departments" ("dept_no");
	
	ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
	REFERENCES "departments" ("dept_no");
	
	ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
	REFERENCES "employees" ("emp_no");
	
	ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
	REFERENCES "employees" ("emp_no");
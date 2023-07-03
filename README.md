# Background

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

# Data Engineering

This is the website, QuickDBD, I used to  design the diagram of the tables.

https://app.quickdatabasediagrams.com/#/

The following Coding was used on QuickDBD to make my tables:

### Departments 
dept_no int pk fk >- Dept_manager.dept_no
dept_name VARCHAR

Dept_emp
emp_no int pk     
dept_no int fk >- Departments.dept_no

### Dept_manager
dept_no int pk
emp_no int fk >- employees.emp_no

### Salaries
emp_no int pk fk >- employees.emp_no
Salary 

### Titles
title_id pk
Staff VARCHAR

### Employees
emp_no int pk 
emp_title_id fk >- Titles.title_id
birth_date DATE	
first_name VARCHAR
last_name VARCHAR	
sex VARCHAR
hire_date DATE

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Module9DBdiagram.png)

I had to change the dates on the employees file to YMD before I could do anything.  I did it in DATA, Test to Number, split the date into 3 columns by / and then I use Date=(year, month, day) and copied the column.  if you get #NUM! for some of the blank lines at the end of the table use crt shift down where the #NUM! start and then delete the rows.  click on the actual row number to highlight the row.

## Make Tables
--Import Data - first drop data so that it is not in the <br />
DROP TABLE IF EXISTS departments; <br />
DROP TABLE IF EXISTS dept_emp; <br />
DROP TABLE IF EXISTS dept_manager; <br />
DROP TABLE IF EXISTS employees; <br />
DROP TABLE IF EXISTS salaries; <br />
DROP TABLE IF EXISTS titles; <br />

--Create Departments Table <br />
create table departments ( <br />
dept_no VARCHAR(30) NOT NULL, <br />
dept_name VARCHAR(45) NOT NULL); <br />

--Create  Department Employee Table
create table dept_emp ( <br />
emp_no Integer NOT NULL, <br />
dept_no VARCHAR(20) NOT NULL); <br />

--create Department Manager Table <br />
create table dept_manager ( <br />
dept_no VARCHAR(20) NOT NULL, <br />
emp_no Integer NOT NULL); <br />

--Create Employee Table <br />
create table employees ( <br />
emp_no Integer NOT NULL, <br />
emp_title VARCHAR(45) NOT NULL, <br />
birth_date DATE NOT NULL, <br />
first_name VARCHAR(45) NOT NULL, <br />
last_name VARCHAR(45) NOT NULL, <br />
sex VARCHAR(10) NOT NULL, <br />
hire_date DATE NOT NULL); <br />

--Create Salaries table <br />
create table salaries ( <br />
emp_no Integer NOT NULL, <br />
salary Integer NOT NULL); <br />

--Create Titles table <br />
create table titles ( <br />
title_id VARCHAR(20) NOT NULL, <br />
staff VARCHAR(45) NOT NULL); <br />


## Assign Keys

ALTER TABLE departments <br />
PRIMARY KEY (dept_no); <br />

ALTER TABLE dept_emp <br />
PRIMARY KEY (emp_no) <br />
FOREIGN KEY (dept_no) REFERENCES departments(dept_no); <br />

ALTER TABLE dept_manager <br />
PRIMARY KEY (dept_no) <br />
FOREIGN KEY (emp_no) REFERENCES employees(emp_no); <br />

ALTER TABLE salaries <br />
PRIMARY KEY (emp_no); <br />

ALTER TABLE titles <br />
PRIMARY KEY (title_id); <br />

ALTER TABLE employees <br />
PRIMARY KEY (emp_no) <br />
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id); <br />

# Data Analysis

#### 1.  List the employee number, last name, first name, sex and salary of each employee

Use employee  and order status table joined on emp_no

CREATE VIEW AS Question1 <br />
SELECT 	e.emp_no AS "Employee Number", <br />
--> e.last_name AS "Last Name", <br />
--> e.first_name AS "First Name", <br />
--> e.sex AS "Sex", <br />
--> o.salary AS "Annual Salary" <br />
FROM employees e <br />
JOIN salaries o <br />
ON (e.emp_no=o.emp_no); <br />

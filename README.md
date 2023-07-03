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

### 1.  List the employee number, last name, first name, sex and salary of each employee

Use employee  and order status table joined on emp_no

CREATE VIEW AS Question1 <br />
SELECT 	e.emp_no AS "Employee Number", <br />
&nbsp; e.last_name AS "Last Name", <br />
&nbsp; e.first_name AS "First Name", <br />
&nbsp; e.sex AS "Sex", <br />
&nbsp; o.salary AS "Annual Salary" <br />
FROM employees e <br />
JOIN salaries o <br />
ON (e.emp_no=o.emp_no); <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question1.png)

### 2. List the first name, last name, and hire date for te employees who were hired in 1986

CREATE VIEW Question2 AS <br />
SELECT 	e.emp_no AS "Employee Number", <br />
&nbsp;		e.first_name AS "First Name", <br />
&nbsp;		e.last_name AS "Last Name", <br />
&nbsp;		e.hire_date AS "Hire Date" <br />
FROM employees e <br />
WHERE hire_date >= '1986-01-01' <br />
AND hire_date <= '1986-12-31'; <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question2.png)

### 3. List the manager of each department along with their department number, department name, employee number, last name and first name.

Employee Number <br />
Manager Name First Last <br />
Department Number <br />
Department Name <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question3_ETRelationship.png)

CREATE VIEW Question3 AS <br />
SELECT	e.emp_no AS "Employee No", <br />
&nbsp;		e.first_name AS "First Name", <br />
&nbsp;		e.last_name AS "Last Name", <br />
&nbsp;		m.dept_no AS "Dept No", <br />
&nbsp;		d.dept_name AS "Department Name" <br />
FROM employees e <br />
JOIN dept_manager m <br />
ON (e.emp_no=m.emp_no) <br />
JOIN departments d <br />
ON (m.dept_no=d.dept_no); <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question3.png)

### 4. List the department number for each employee along with that employee's employee number, last name, first name and department name.

Need <br />
Department Number <br />
Employee Number <br />
Last Name <br />
First Name <br />
Department Name <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question4_ETRelationship.png)

CREATE VIEW Question4 AS <br />
SELECT	de.dept_no AS "Dept No", <br />
&nbsp;		e.emp_no AS "Employee No", <br />
&nbsp;		e.last_name AS "Last Name", <br />
&nbsp;		e.first_name AS "First Name", <br />
&nbsp;		d.dept_name AS "Department Name" <br />
FROM employees e <br />
JOIN dept_emp de <br />
ON (e.emp_no=de.emp_no) <br />
JOIN departments d <br />
ON (de.dept_no=d.dept_no); <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question4.png)

### 5. List first name, last name, sex of each employee whose first name is Hercules and whose last name begins with a B

CREATE VIEW Question5 AS <br /> 
SELECT 	e.emp_no AS "Employee Number", <br />
&nbsp;		        e.first_name AS "First Name", <br />
&nbsp;		        e.last_name AS "Last Name", <br />
&nbsp;		        e.sex AS "Sex" <br />
FROM employees e <br />
WHERE first_name = 'Hercules' <br />
AND last_name LIKE 'B%'; <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question5.png)

### 6. List employees in the Sales department, including their employee number, last name, first name, and department name.  

Need is <br />
Sales Department <br />
Employee Number <br />
Last Name <br />
First Name <br />


Department Name

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question4_ETRelationship.png)

CREATE VIEW Question6 AS  <br />
SELECT	e.emp_no AS "Employee No", <br />
&nbsp;		e.last_name AS "Last Name", <br />
&nbsp;		e.first_name AS "First Name", <br />
&nbsp;		d.dept_name AS "Department Name" <br />
FROM employees e <br />
JOIN dept_emp de <br />
ON (e.emp_no=de.emp_no) <br />
JOIN departments d <br />
ON (de.dept_no=d.dept_no) <br />
Where d.dept_name = 'Sales'; <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question6.png)

### 7. List each employee in the Sales and Developement Departments, including their employee number, last name, first name and department name.

Need <br />
Sales & Developmental Department <br />
Employee no <br />
Last Name <br />
First Name <br />
Department Number <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question4_ETRelationship.png)

CREATE VIEW Question7 AS <br />
SELECT	e.emp_no AS "Employee No", <br />
&nbsp;		e.last_name AS "Last Name", <br />
&nbsp;		e.first_name AS "First Name", <br />
&nbsp;		d.dept_name AS "Department Name" <br />
FROM employees e <br />
JOIN dept_emp de <br />
ON (e.emp_no=de.emp_no) <br />
JOIN departments d <br />
ON (de.dept_no=d.dept_no) <br />
WHERE d.dept_name='Development' <br />
OR d.dept_name = 'Sales'; <br />

![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question7.png)

### 8. List the Frequency Counts, in descending order, of all employees Last Names (That is how many employees share each last name.

SELECT employees.last_name, <br />
    count(employees.last_name) AS "Frequency Count" <br />
   FROM employees <br />
  GROUP BY employees.last_name <br />
  ORDER BY employees.last_name DESC; <br />

 ![](https://github.com/TraceyGeneau/sql-challenge/blob/master/EmployeeSQL/images/Question8.png) 

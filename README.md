#Data Engineering

PK - Primary Key

FK - Foreign Key

https://app.quickdatabasediagrams.com/#/

Departments
--
dept_no int pk fk >- Dept_manager.dept_no
dept_name VARCHAR

Dept_emp
--
emp_no int pk     
dept_no int fk >- Departments.dept_no

Dept_manager
--
dept_no int pk
emp_no int fk >- employees.emp_no

Salaries
--
emp_no int pk fk >- employees.emp_no
Salary 

Titles
-
title_id pk
Staff VARCHAR

employees
--
emp_no int pk 
emp_title_id fk >- Titles.title_id
birth_date DATE	
first_name VARCHAR
last_name VARCHAR	
sex VARCHAR
hire_date DATE

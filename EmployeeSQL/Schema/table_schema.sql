--Import Data - first drop data so that it is not in the 
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--Create Departments Table
create table departments (
dept_no VARCHAR(30) NOT NULL,
dept_name VARCHAR(45) NOT NULL);

--Create  Department Employee Table
create table dept_emp (
emp_no Integer NOT NULL,
dept_no VARCHAR(20) NOT NULL);

--create Department Manager Table
create table dept_manager (
dept_no VARCHAR(20) NOT NULL,
emp_no Integer NOT NULL);

--Create Employee Table
create table employees (
emp_no Integer NOT NULL,
emp_title VARCHAR(45) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
sex VARCHAR(10) NOT NULL,
hire_date DATE NOT NULL);

--Create Salaries table
create table salaries (
emp_no Integer NOT NULL,
salary Integer NOT NULL); 

--Create Titles table
create table titles (
title_id VARCHAR(20) NOT NULL,
staff VARCHAR(45) NOT NULL);
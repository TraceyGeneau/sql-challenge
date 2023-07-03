CREATE VIEW AS Question1
SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.sex AS "Sex",
		o.salary AS "Annual Salary"
FROM employees e
JOIN salaries o
ON (e.emp_no=o.emp_no);


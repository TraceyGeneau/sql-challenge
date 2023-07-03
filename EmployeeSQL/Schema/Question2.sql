CREATE VIEW Question2 AS
SELECT 	e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.hire_date AS "Hire Date"
FROM employees e
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';
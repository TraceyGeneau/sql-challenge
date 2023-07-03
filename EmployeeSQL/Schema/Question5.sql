CREATE VIEW Question5 AS
SELECT 	e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.sex AS "Sex"
FROM employees e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
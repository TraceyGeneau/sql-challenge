CREATE VIEW Question7 AS
SELECT	e.emp_no AS "Employee No",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no=de.emp_no)
JOIN departments d
ON (de.dept_no=d.dept_no)
WHERE d.dept_name='Development'
OR d.dept_name = 'Sales';
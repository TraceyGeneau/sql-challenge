CREATE VIEW Question4 AS
SELECT	de.dept_no AS "Dept No",
		e.emp_no AS "Employee No",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no=de.emp_no)
JOIN departments d
ON (de.dept_no=d.dept_no);


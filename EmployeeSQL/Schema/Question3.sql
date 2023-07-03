CREATE VIEW Question3 AS
SELECT	e.emp_no AS "Employee No",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		m.dept_no AS "Dept No",
		d.dept_name AS "Department Name"
FROM employees e
JOIN dept_manager m
ON (e.emp_no=m.emp_no)
JOIN departments d
ON (m.dept_no=d.dept_no);


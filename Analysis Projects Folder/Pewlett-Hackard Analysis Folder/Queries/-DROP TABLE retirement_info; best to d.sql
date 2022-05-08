-- DROP TABLE retirement_info; best to do when creating a new table
-- or data import has failed.

-- CREATE NEW TABLE for retiring employees

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees as em
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- check work, as this is creating a table, not returning results

SELECT * FROM retirement_info;


--Inner Joining the Departments and Managers tables

SELECT departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_Date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;


-- Left Joining retirement_info and dept_emp tables
--we want to figure out the employees presently employed.

SELECT r_i.emp_no,
	r_i.first_name,
	r_i.last_name,
	d_e.to_date
FROM retirement_info as r_i
LEFT JOIN dept_emp as d_e
ON r_i.emp_no = d_e.emp_no;


--Left joining and creating a table for current employees
SELECT r_i.emp_no,
	r_i.first_name,
	r_i.last_name,
	d_e.to_date
INTO current_emp
FROM retirement_info as r_i
LEFT JOIN dept_emp as d_e
ON r_i.emp_no = d_e.emp_no
WHERE d_e.to_Date =('9999-01-01');



-- employee count by department number

SELECT COUNT(c_e.emp_no), d_e.dept_no
INTO dept_emp_retiring_count
FROM current_emp as c_e
LEFT JOIN dept_emp AS d_e
ON c_e.emp_no = d_e.emp_no
GROUP BY d_e.dept_no
ORDER BY d_e.dept_no;
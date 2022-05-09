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

-- employee information

-- SELECT c_e.emp_no,
-- 	c_e.last_name,
-- 	c_e.first_name,
-- 	em.gender,
-- 	sal.salary
-- FROM current_emp as c_e
-- LEFT JOIN employees as em
-- ON c_e.emp_no = em.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');



-- List of managers

SELECT dm.dept_no,
	d.dept_name,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date

INTO manager_info
FROM dept_manager as dm
	INNER JOIN departments as d
		ON (d.dept_no = dm.dept_no)
	INNER JOIN current_emp as ce
		ON (dm.emp_no = ce.emp_no);


SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp as de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no);

SELECT * FROM retirement_info;

SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
-- INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp as de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no);
-- SALES TEAM


SELECT ri.emp_no, ri.first_name, ri.last_name, d.dept_name
INTO sales_dev_retirement_info
FROM retirement_info as ri
INNER JOIN dept_emp as de
	ON ri.emp_no = de.emp_no
INNER JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE (de.to_date = '9999-01-01')
;


-- SALES and Development only 
--(IN statement is equivelent to COLUMN = 'A' OR COLUMN = 'B' )

SELECT ri.emp_no, ri.first_name, ri.last_name, d.dept_name
INTO sales_dev_retirement_info
FROM retirement_info as ri
INNER JOIN dept_emp as de
	ON ri.emp_no = de.emp_no
INNER JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE (de.to_date = '9999-01-01')
AND dept_name IN ('Development', 'Sales');






-- query retirement by title

SELECT emp.emp_no,
	emp.first_name,
	emp.last_name,
	t.title,
	t.from_date,
	t.to_date

INTO retire_by_title
FROM employees AS emp
	INNER JOIN titles AS t
		ON (emp.emp_no = t.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' and '1955-12-31')
ORDER BY(emp.emp_no)
;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retire_by_title as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;




-- retiring title count


SELECT COUNT (ut.title), ut.title

INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

--Mentorship eligibility

SELECT DISTINCT ON(emp.emp_no) emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	ti.title
-- INTO potential_mentors
FROM employees as emp
	INNER JOIN dept_emp as de
		on (emp.emp_no = de.emp_no)
	INNER JOIN titles as ti
		on (ti.emp_no = emp.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (emp.birth_date BETWEEN '1965-01-01' and '1965-12-31')
ORDER BY emp.emp_no;	



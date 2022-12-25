-- Employees eligible for retirement by title
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
ti.title, 
ti.from_date, 
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Unique titles count
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY count DESC;

-- Create a table for employees eligible to mentor
SELECT DISTINCT ON (e.emp_no) 
e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date,
de.from_date, 
de.to_date, 
ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN department_employees AS de
ON(e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON(e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

-- Create a view table of employees in their first 3 years
-- eligible for mentorship by senior employees
CREATE OR REPLACE VIEW view_emp_to_ment AS
SELECT DISTINCT ON (e.emp_no) 
e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date,
e.hire_date,
de.from_date, 
de.to_date, 
ti.title
FROM employees AS e
INNER JOIN department_employees AS de
ON(e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON(e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (de.from_date BETWEEN '1997-01-01' AND '2000-12-31');

-- Creat table for count of mentors by department
SELECT COUNT(title), title
INTO mentorship_eligibility_count
FROM mentorship_eligibility
GROUP BY title 
ORDER BY count DESC;
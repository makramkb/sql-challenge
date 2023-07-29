--List the employee number, last name, first name, sex, and salary of each employee.
SELECT  e.emp_no,first_name, last_name , sex ,salary FROM employees AS e
JOIN salaries USING(emp_no)
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name,sex,hire_date FROM employees
WHERE hire_date between '1986-01-01' AND '1986-12-31'
--List the manager of each department along with their department number, department name, employee number, 
--last name, and first name.
SELECT dm.dept_no,e.first_name,e.last_name,e.emp_no FROM dept_manager dm
JOIN departments d USING(dept_no)
JOIN employees e USING(emp_no)
--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT d.dept_no,e.emp_no,first_name,last_name,d.dept_name FROM departments d
JOIN dept_emp USING(dept_no)
JOIN employees e USING(emp_no)
--#List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT first_name,last_name,sex FROM employees
WHERE (first_name = 'Hercules' AND last_name LIKE 'B%')
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no,first_name,last_name FROM dept_emp de
JOIN departments USING(dept_no)
JOIN employees e USING(emp_no)
WHERE dept_name='Sales'
--List each employee in the Sales and Development departments, including their employee number, last name,
--first name, and department name.
SELECT de.emp_no,first_name,last_name,dept_name FROM dept_emp de
JOIN departments USING(dept_no)
JOIN employees e USING(emp_no)
WHERE dept_name IN ('Sales','Development')
--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name,COUNT(last_name) AS count_last_name FROM employees
GROUP BY last_name
ORDER BY last_name DESC
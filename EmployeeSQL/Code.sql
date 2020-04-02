/*1.List the following details of each employee: employee number, last name, 
first name, gender, and salary.*/

create view employees_salaries as
select employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
from employees
join salaries on employees.emp_no=salaries.emp_no;
select * from employees_salaries;

/*2.List employees who were hired in 1986.*/

create view emp_hire_year as
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.hire_date
from employees
where hire_date like '1986%';
select * from emp_hire_year;

/* 3. List the manager of each department with the following information: department number, 
department name, the manager's employee number, last name, first name, 
and start and end employment dates.*/

create view dept_mgr_info as
select dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date,
	dept_manager.to_date
from dept_manager
join employees on dept_manager.emp_no=employees.emp_no
join departments on dept_manager.dept_no=departments.dept_no;
select * from dept_mgr_info;

/* 4.List the department of each employee with the following information: employee number,
last name, first name, and department name.*/

create view employees_dept as
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no;
select * from employees_dept;

/* 5.List all employees whose first name is "Hercules" and last names begin with "B."*/

SELECT * FROM employees
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%');

/* 6.List all employees in the Sales department, including their employee number,
last name, first name, and department name.*/

Select
e.emp_no, 
first_name, 
last_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_no = d.emp_no
LEFT JOIN departments
ON d.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales';

/* 7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/

Select
e.emp_no, 
first_name, 
last_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_no = d.emp_no
LEFT JOIN departments
ON d.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales'
OR departments.dept_name LIKE  'Development';

/* 8.In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/

SELECT
last_name,
COUNT(last_name) AS "name_count"
from employees
GROUP BY
last_name
ORDER BY name_count DESC;



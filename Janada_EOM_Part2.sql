use employees;
-- What is the total amount paid in salaries for contracts that ended before December 31,2000?

select sum(salary) as Total_salaries
 from salaries
where to_date < '2000-12-31';

-- How many employees have "Smith" in their last name? (0.5 marks)

select count(last_name) as Number_of_smiths
 from employees
where last_name like '%Smith%';

--  Using the salaries table (2 marks)
-- a. create a column that categorizes employees into salary brackets
select emp_no, salary,
case
when salary > 100000 then 'High'
		when salary between 50000  and 100000 then 'Medium'
           when salary < 50000 then 'Low'
       end as  Categories_of_earners
from salaries
order by salary desc;

-- Create a column that applies a bonus of 10% to salaries below 60,000 and a 5% bonus to others. 
select  emp_no, salary,
case 
when salary < 60000 then salary * 1.10
else salary * 1.05 
end as christmas_bonus
from salaries
order by salary asc;

-- Add a column that displays Active for contracts where to_date is later than today’s date (current_date) and Expired otherwise. 
select emp_no,
salary,
from_date,
to_date,
case 
when to_date > current_date() then 'Active'
else 'Expired'
end as contract_status
from salaries;

-- filter managers based on birth year 1955 inside a subquery.
select emp_no, dept_no, from_date
from dept_manager
where emp_no in (
select emp_no
from employees
where birth_date >= '1955-01-01'
);

-- Retrieve the employee ID, first name, and last name of employees who earn the highest salary. (1 marks) 
select e.emp_no, e.first_name, e.last_name
from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary = (
select max(salary)
from salaries
);

-- listing managers salary on two different ranking columns
SELECT 
    dm.emp_no,
    s.salary,
    ROW_NUMBER() OVER (
        PARTITION BY dm.emp_no 
        ORDER BY s.salary ASC
    ) AS row_num_lowest_to_highest,
    ROW_NUMBER() OVER (
        PARTITION BY dm.emp_no 
        ORDER BY s.salary DESC
    ) AS row_num_highest_to_lowest
FROM dept_manager dm
JOIN salaries s ON dm.emp_no = s.emp_no
ORDER BY s.salary DESC;

SELECT e.emp_no,
       e.first_name,
       e.last_name,
       e.gender,
       e.hire_date,
       t.title AS current_title,
       s.salary AS current_salary,
       d.dept_name,
       m.emp_no AS manager_emp_no,
       m.first_name AS manager_first_name,
       m.last_name AS manager_last_name
FROM employees e
-- Current title
JOIN titles t 
  ON e.emp_no = t.emp_no
 AND t.to_date = '9999-01-01'
-- Current salary
JOIN salaries s
  ON e.emp_no = s.emp_no
 AND s.to_date = '9999-01-01'
-- Department membership
JOIN dept_emp de
  ON e.emp_no = de.emp_no
 AND de.to_date = '9999-01-01'
-- Department info
JOIN departments d
  ON de.dept_no = d.dept_no
-- Department manager
JOIN dept_manager dm
  ON d.dept_no = dm.dept_no
 AND dm.to_date = '9999-01-01'
JOIN employees m
  ON dm.emp_no = m.emp_no
ORDER BY e.emp_no;




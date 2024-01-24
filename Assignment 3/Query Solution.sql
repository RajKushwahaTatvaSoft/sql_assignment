-- Assignment 3

-- Question 1

SELECT Employee.emp_name AS 'Employee Name', Employee.salary AS 'Salary', Department.dept_name AS 'Department' from Employee
INNER JOIN (
	SELECT MAX(Employee.salary) AS max_salary, Department.dept_id AS dept_id from Employee
	INNER JOIN Department ON Employee.dept_id = Department.dept_id
	GROUP BY Department.dept_id ) sub 
ON Employee.dept_id = sub.dept_id AND Employee.salary = sub.max_salary
INNER JOIN Department ON sub.dept_id = Department.dept_id
ORDER BY Employee.salary DESC;


-- Question 2
SELECT Department.dept_name AS 'Department', COUNT(Employee.emp_id) AS 'No. of People' from Employee
RIGHT JOIN Department ON Employee.dept_id = Department.dept_id
GROUP BY Department.dept_name
HAVING COUNT(Employee.emp_id) < 3
ORDER BY COUNT(Employee.emp_id) DESC	;

-- Question 3
SELECT Department.dept_name AS Department,COUNT(Employee.emp_id) AS 'No. of People' from Department
LEFT JOIN Employee ON Employee.dept_id = Department.dept_id
GROUP BY Department.dept_name
ORDER BY COUNT(Employee.emp_id) DESC;

-- Question 4
SELECT Department.dept_name AS Department,SUM(Employee.salary) AS 'No. of People' from Department
LEFT JOIN Employee ON Employee.dept_id = Department.dept_id
GROUP BY Department.dept_name
ORDER BY SUM(Employee.salary) DESC;
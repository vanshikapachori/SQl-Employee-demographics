SELECT *
FROM employee_salary
;

SELECT employee_id, first_name, last_name,  AVG(salary) AS Avg_salary
from employee_salary
GROUP BY employee_id, first_name, last_name
;

SELECT avg(salary)
from employee_salary
Group by employee_id, first_name, last_name;


-- Sub-queries -- A sub-query to find avg salary of all the employees combined, using Sub-Query.

SELECT
employee_id,
first_name,
last_name,
(SELECT AVG(salary) FROM employee_salary) AS Avg_salary
FROM employee_salary;

-- Here, we are using PARTITION method to get the avg salary 


SELECT 
	employee_id, 
	first_name, 
	last_name,
	AVG(salary) 
	OVER () AS Avg_salary
FROM employee_salary;

-- SUB QUERY IN FORM --
SELECT
a.employee_id, Avg_salary
FROM
(SELECT employee_id, first_name, last_name, AVG(salary) 
	OVER () AS Avg_salary FROM employee_salary) AS a
;

SELECT employee_id, occupation, salary
FROM employee_salary
WHERE employee_id IN (SELECT employee_id
		FROM employee_demographics 
        WHERE age > 30)
        ;









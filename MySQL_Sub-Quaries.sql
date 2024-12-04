-- Subquaries --
 SELECT*
 FROM employee_demographics
 WHERE employee_id IN 
					(SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id = 1)
;
SELECT* 
FROM parks_departments
;

SELECT *
FROM employee_salary
;

SELECT first_name, salary,
	(SELECT AVG(salary)
     FROM employee_salary)
FROM employee_salary;
                    
-- GROUP BY DEMOGRAPHICS --
 SELECT gender, AVG(age),MIN(age),MAX(age),COUNT(age)
 FROM employee_demographics
 GROUP BY gender
 ;
 
 SELECT gender, AVG(Max_age)
 FROM 
	(SELECT gender,
    AVG(age) AS Avg_age,
    MAX(age) AS Max_age,
    MIN(age) AS Min_age,
    COUNT(AGE) 
FROM employee_demographics
GROUP BY gender) AS Agg_table
GROUP BY gender
;

    

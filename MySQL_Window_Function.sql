-- WINDOW FUNCTION --

SELECT gender, AVG(salary) AS Avg_salary
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
GROUP BY gender
;

-- OVER & PARTITION BY --(AVG SALARY)
SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id;

-- OVER & PARTITION BY --(SUM OF SALARY)

SELECT dem.first_name, dem.last_name, gender, 
SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;

-- Rolling Total--

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;

-- ROW NUMBER based on GENDER --

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;

-- Ranking Salary --

SELECT dem.first_name, dem.last_name, gender, salary,
	ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_num,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;

-- DENSE RANK--

SELECT dem.first_name, dem.last_name, gender, salary,
	ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_num,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num,
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Dense_Rank_num
FROM employee_demographics dem 
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;

 
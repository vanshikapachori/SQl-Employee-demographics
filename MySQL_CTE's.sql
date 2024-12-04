-- CTE --

-- AVG SALARY --
WITH CTE_01 AS
(
SELECT gender, AVG(salary) AVG_Sal, MAX(salary) Max_salary, MIN(salary) Min_salary, COUNT(salary) Total_Salary
FROM employee_demographics DEM
JOIN employee_salary SAL
	ON DEM.employee_id = SAL.employee_id
GROUP BY gender
)
SELECT AVG(AVG_Sal)
FROM CTE_01
;

-- MULTIPLE CTE --

WITH CTE_01 AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_02 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_01
JOIN CTE_02
	ON CTE_01.employee_id = CTE_02.employee_id
;


WITH CTE_01 (Gender, Avg_Sal, Max_Salary, Min_Salary, Total_Salary) AS
(
SELECT gender, AVG(Salary) Avg_Sal, MAX(Salary) Max_salary, MIN(Salary) Min_Salary, COUNT(Salary) Total_Salary
FROM employee_demographics DEM
JOIN employee_salary SAL
	ON DEM.employee_id = SAL.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_01
;

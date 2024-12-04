-- Case Statements --

SELECT first_name, last_name, age,
	CASE
    WHEN age < 30 THEN 'Young'
    when age BETWEEN 31 AND 50 THEN 'Old'
    when age > 50 THEN "On Death's Door"
END AS 'Age chort'
FROM employee_demographics
;


-- Pay Income Bonus --
-- < 50k = 5% Bonus
-- > 50k = 7% Bonus
-- Finance 10% Bonus

SELECT first_name, last_name,salary,
CASE
    WHEN salary <= 50000 THEN salary + (salary* 0.05)     -- {5/100=0.05} --
    WHEN salary > 50000 THEN salary + (salary* 0.07)
END AS 'New Salary',
CASE
	WHEN dept_id = 6 THEN salary + (salary* 0.10)
    END AS Bonus
FROM employee_salary;

SELECT*
FROM employee_salary;
SELECT * 
FROM parks_departments
;

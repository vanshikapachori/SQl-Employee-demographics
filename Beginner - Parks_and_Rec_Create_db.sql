SELECT * 
FROM parks_and_recreation.employee_salary
WHERE SALARY >= 50000;

-- JOINS --
  
SELECT*
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT emp_dem.employee_id, age, occupation
FROM employee_demographics AS emp_dem
INNER JOIN employee_salary AS emp_sal
   ON  emp_dem.employee_id=emp_sal.employee_id
   ;

-- OUTTER Joins--
-- LEFT/RIGHT Join --

SELECT *
FROM employee_demographics AS emp_dem
RIGHT JOIN employee_salary AS emp_sal
   ON  emp_dem.employee_id=emp_sal.employee_id
   ;

-- SELF-Join--

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_santa,
emp2.first_name AS first_name_santa,
emp2.last_name AS last_name_santa
FROM employee_salary emp1
JOIN employee_salary emp2
    ON emp1.employee_id  + 1 =emp2.employee_id
    ;

-- Multiple Join Together --

SELECT *
FROM employee_demographics AS emp_dem
JOIN employee_salary AS emp_sal
   ON  emp_dem.employee_id = emp_sal.employee_id
INNER JOIN parks_departments AS pd
   ON emp_sal.dept_id = pd.department_id
   ;

SELECT *
FROM parks_departments;

-- UNIONS -- 

SELECT first_name, last_name
FROM employee_demographics
UNION ALL 
SELECT First_name, last_name
FROM employee_salary
;

SELECT first_name, last_name, 'Old Man' AS Lable
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Lable
FROM employee_demographics
WHERE age > 40 AND Gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Lable
FROM employee_salary
WHERE salary > 70000 
ORDER BY first_name, Last_name
;

 SELECT * FROM parks_departments;
 SELECT * FROM employee_demographics;
 SELECT * FROM employee_salary;

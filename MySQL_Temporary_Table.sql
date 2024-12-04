-- Temporary Tables--
 
CREATE TEMPORARY TABLE temp0_table
(First_name VARCHAR(16),
Last_name VARCHAR(16),
Favorite_movie VARCHAR (100)
)
;
SELECT *
FROM temp0_table
;
 INSERT temp0_table 
 VALUES ('Alwin','Lakra','Dark Knight Rises')
 ;
SELECT *
FROM temp0_table;

SELECT * 
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50_k       -- TEMPORARY TABLE DOES NOT WORK AFTER THE SESSION ENDS --
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM salary_over_50k;

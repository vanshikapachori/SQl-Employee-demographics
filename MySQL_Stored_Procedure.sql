-- STORED PROCEDURES --


CREATE PROCEDURE highly_paid()
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

CALL highly_paid();




CREATE PROCEDURE p_pay_partition()
SELECT * 
FROM employee_salary
WHERE salary <= 50000;
SELECT * 
FROM employee_salary
WHERE salary >= 10000; 


-- DEMILIMITER --

DELIMITER $$
CREATE PROCEDURE p_pay_partition()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary <= 50000;
	SELECT * 
	FROM employee_salary
	WHERE salary >= 10000; 
END $$
DELIMITER ;

CALL p_pay_partition(); 

DELIMITER $$
CREATE PROCEDURE large_salary (p_employee_id INT)
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE employee_id = employee_id
	;
END $$
DELIMITER ;

CALL large_salary(1);

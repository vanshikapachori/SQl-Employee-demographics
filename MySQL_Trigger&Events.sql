-- Trigger & Events --

SELECT 
* FROM employee_demographics;

SELECT * 
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
		AFTER INSERT ON employee_salary
		FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUE (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$ 
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Wesly','Snipes','Entertainment','1000000',NULL)
;
SELECT *
FROM employee_salary;

-- EVENTS --
 
SELECT *
FROM employee_demographics
;

delimiter $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 15 SECOND
DO 
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 61;
END $$
delimiter 

SHOW VARIABLES LIKE 'EVENT%';



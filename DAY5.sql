--DAY 5:
-- SUB QUERY IN SQL
-- A QUERY INSIDE ANOTHER QUERY

-- FIND THE MAX SALARY FROM EMPLOYEES TABLE
SELECT  MAX(SALARY)
FROM EMPLOYEES;

--FIND THE FIRST_NAME OF EMPLOYEE THAT MAKE THAT SALARY
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SALARY = 24000;

--WE GOT 24000 BY RUNNING FIRST QUERY
--INSTEAD OF RUNNING 2 QUERY , WE CAN REPLACE 24000 WITH FIRST QUERY SO WE CAN GET THEM IN ONE SHOT

-- sout(someFunctionThatReturnValue) ; this prin the value returned in java

--find out the Employee Name that makes Max Salary
SELECT FIRST_NAME
FROM EMPLOYEES      --- below query returns 24000 
WHERE SALARY = (SELECT  MAX(SALARY)   FROM EMPLOYEES)  ;

--find out the Employee Name that makes Min Salary
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)     FROM EMPLOYEES);


--FIND OUT ALL EMPLOYEE NAMES THAT MAKE MORE THAN AVERAGE SALARY
SELECT AVG(SALARY)   --6477.509433962264150943396226415094339623
FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SALARY > 6478; --AVERAGE SALARY

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)   FROM EMPLOYEES);


--find out the Employee Name that makes Max Salary
SELECT FIRST_NAME
FROM EMPLOYEES      --- below query returns 24000 
WHERE SALARY = (SELECT  MAX(SALARY)   FROM EMPLOYEES)  ;

--find out the Everyone else that does not make Max Salary
SELECT FIRST_NAME , SALARY
FROM EMPLOYEES      --- below query returns 24000 
WHERE SALARY != (SELECT  MAX(SALARY)   FROM EMPLOYEES)  ; -- 105 rows


--- ON TOP OF ABOVE QUERY , FIND OUT MAX SALARY IN THE RESULT FROM ABOVE, just display salary column
SELECT MAX(SALARY)
FROM EMPLOYEES      --- below query returns 24000 
WHERE SALARY != (SELECT  MAX(SALARY)   FROM EMPLOYEES)  ; -- 105 rows


-- FIND OUT EMPLOYEE NAMES IN EXECUTIVE DEPARTMENT
SELECT FIRST_NAME
FROM EMPLOYEES e
INNER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME = 'Executive';

--if we don't use inner join, this is how we might do it manually
--go to departments table to find out department_id of the department with name Executive
--when we know department_id, we can use that department_id to find out the name in Employees table
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (
                    --this returns 90
                    SELECT DEPARTMENT_ID
                    FROM DEPARTMENTS
                    WHERE DEPARTMENT_NAME = 'Executive'
);

--Find out Employee First_name in Executive and Finance Department
--
SELECT DEPARTMENT_ID
                    FROM DEPARTMENTS
                    WHERE DEPARTMENT_NAME IN ('Executive' , 'Finance');

--Now we know department_id, we can use that department_id to find out the name in Employees table
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (90 , 100);

--NOW WE COMBINE THE RESULT
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (
                    --THIS QUERY WILL RETURN 90 , 100
                    SELECT DEPARTMENT_ID
                    FROM DEPARTMENTS
                    WHERE DEPARTMENT_NAME IN ('Executive' , 'Finance')
                    );


--ANOTHER LONGER WAY TO SOLVE IT
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (
    (SELECT DEPARTMENT_ID
    FROM DEPARTMENTS
    WHERE DEPARTMENT_NAME = 'Executive'),
    (SELECT DEPARTMENT_ID
    FROM DEPARTMENTS
    WHERE DEPARTMENT_NAME = 'Finance')
);


--- FIND OUT COUNT OF EMPLOYEES IN EACH DEPARTMENT (JUST DISPLAY COUNT COLUMN)

SELECT COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


---FIND OUT MAX NUMBER OF EMPLOYEES IN ALL DEPARTMENT
 ---FIND OUT MAX   EMP_COUNT FROM THIS RESULT
 
 --YOU CAN ALSO SELECT FROM RESULT OF A SUBQUERY,
 --IT'S ALMOST AS IF WE HAVE A TABLE WITH THE RESULT OF THE SUBQUERY
 --COMPLETELY OPTIONAL  --- ONLY THING TO TAKE FROM HERE IS
 -- YOU CAN SEE YOUR RESULT OF SUBQUERY AS A TABLE AND SELECT FROM IT
SELECT MAX(EMP_COUNT)

        FROM(
                    SELECT DEPARTMENT_ID  ,  COUNT(*) AS EMP_COUNT
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID
                 )
            ;



---EASIER WAY
SELECT MAX(COUNT(*))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

INSERT INTO coworkers (
    employee_id,
    "First Name",
    "Last Name"
) VALUES (
    123,
    'KIMBERLY',
    'JONES'
);

SELECT * FROM COWORKERS;

UPDATE coworkers
SET
    employee_id = 321
WHERE
        employee_id = 123;
        
DELETE FROM coworkers
WHERE
        employee_id = 1;
    

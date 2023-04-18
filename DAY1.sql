-- THIS IS HOW YOU COMMENT
/*
This  is
a
multi line comment 
*/
--This is a simple select statement to select all columns from Employees tables
--SQL statement ends with semi-colon
-- SQL is case-insensitive
-- * asterisk means everything -- all columns
SELECT * FROM EMPLOYEES;
-- you can write in lowercase as well
select * from Employees;
--runs only the line where the cursor is



--If you select any column or tables that does not exist it will throw error - READ
SELECT * FROM BREAKFAST; -- this is not valid table name

--TASKS: Explore to find out all other existing tables
--and display all the content of those tables in Query result by running them

SELECT * FROM COUNTRIES;

SELECT * FROM DEPARTMENTS;

SELECT * FROM JOBS;

SELECT * FROM LOCATIONS;

SELECT * FROM JOB_HISTORY;

--- Selecting specific columns by providing colum names and separating by comma

--  display only first name column of employees table
SELECT FIRST_NAME FROM EMPLOYEES;

--  display only FIRST_NAME, LAST_NAME columns  of employees table

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;

--  display only FIRST_NAME, LAST_NAME, SALARY columns  of employees table

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;

--SQL does not care about white space so you can write it in same or multiple lines
SELECT   FIRST_NAME  ,  LAST_NAME  ,  SALARY 
FROM EMPLOYEES;


SELECT FIRST_NAME,
                LAST_NAME, 
                SALARY 
FROM EMPLOYEES;

--display COUNTRY_NAME and REGION_ID from COUNTRIES TABLE

SELECT COUNTRY_NAME , REGION_ID
FROM COUNTRIES;

--display JOB_ID and JOB_TITLE from JOBS TABLE

SELECT JOB_ID , JOB_TITLE 
FROM JOBS;

-- How to change the column name in the display
-- display the FIRST_NAME and SALARY from Employees table 
-- but show the salary column as Money for column name
--We can give alias or nickname to the column name using AS keyword right after column name
-- the result column name will be whatever you put after AS

SELECT FIRST_NAME , SALARY AS MONEY
FROM EMPLOYEES;

-- display FIRST_NAME and LAST_NAME from Employees table
-- display the columns as GIVEN_NAME , FAMILY_NAME

SELECT FIRST_NAME AS GIVEN_NAME , LAST_NAME AS FAMILY_NAME
FROM EMPLOYEES;

-- ONLY DISPLAYING NON-DUPLICATE (UNIQUE) ROW IN TABLE
--display all unique first names in Employees table

--SELECT FIRST_NAME FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;

--display all unique JOB_ID from Employees table
SELECT DISTINCT JOB_ID 
FROM EMPLOYEES;


-- filtering the row in display using condtions: WHERE

--display FIRST_NAME and LAST_NAME if the name equals Steven

SELECT FIRST_NAME , LAST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME = 'Steven';

-- display FIRST_NAME and LAST_NAME and SALARY 
-- if the SALARY is more than 10000

SELECT FIRST_NAME , LAST_NAME , SALARY
FROM EMPLOYEES
WHERE SALARY > 10000;

-- display FIRST_NAME and EMAIL and SALARY 
-- if the SALARY is LESS than 5000

SELECT FIRST_NAME , EMAIL , SALARY
FROM EMPLOYEES
WHERE SALARY < 5000;

-- display FIRST_NAME and COMMISSION_PCT and SALARY 
-- if the SALARY is more than OR equals to 7000

SELECT FIRST_NAME , COMMISSION_PCT, SALARY
FROM EMPLOYEES
WHERE SALARY >= 7000;

-- display FIRST_NAME and DEPARTMENT_ID and SALARY 
-- if the SALARY is less than OR equals to 5000

SELECT FIRST_NAME , DEPARTMENT_ID , SALARY
FROM EMPLOYEES
WHERE SALARY <= 5000;

-- display FIRST_NAME and LAST_NAME and SALARY 
-- if the SALARY is more than 10000 OR less than 5000

SELECT FIRST_NAME , LAST_NAME , SALARY
FROM EMPLOYEES
WHERE SALARY > 10000 OR SALARY < 5000;

-- display FIRST_NAME and LAST_NAME and SALARY 
-- if the SALARY is less than 10000 OR more than 5000

SELECT FIRST_NAME , LAST_NAME , SALARY
FROM EMPLOYEES
WHERE SALARY > 5000 AND SALARY < 10000;

--display first name last , salary 
-- if the DEPARTMENT_ID is 60 AND SALARY is more than 7000

SELECT FIRST_NAME , SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60 AND SALARY > 7000;

--display first name , salary 
-- if the DEPARTMENT_ID is 60 AND SALARY does not equal 6000

SELECT FIRST_NAME , SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60 AND SALARY <> 6000;   --    <>, != - not equal 

-- display FIRST_NAME and LAST_NAME and SALARY 
-- if the SALARY is less than 10000 OR more than 5000
-- the range of number can be simplified using BETWEEN ... AND ...
--it includes both edge, below query it includes 5000 and 10000

SELECT FIRST_NAME , LAST_NAME , SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 10000;

-- display all employee info if the employee_id is between 110 and 120

SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 110 AND 120;

-- diplay all employees with employee_id of 110, 112, 115, 116

SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = 110
                OR EMPLOYEE_ID = 112 
                OR EMPLOYEE_ID = 115 
                OR EMPLOYEE_ID = 116;
                
-- above query can be written much simpler way using IN (VALUE1, VALUE2, VALUE3,....)
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (110, 112, 115, 116);

-- display FIRST_NAME , JOB_ID from EMPLOYEES
-- if JOB_ID are AD_ASST , FI_MGR  , FI_ACCOUNT
SELECT FIRST_NAME , JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ( 'AD_ASST', 'FI_MGR', 'FI_ACCOUNT');



                



--DAY 2 :

-- Find all employees with salary of 5000, 7000, 11000
SELECT *
FROM EMPLOYEES
WHERE SALARY IN(5000, 7000, 11000);

-- Find all countries with Countr_Id of EG, FR, IL
SELECT * FROM COUNTRIES
WHERE COUNTRY_ID IN ('EG', 'FR', 'IL');

-- How to sort in SQL: ORDER BY COLUMN_NAME OR COLUMN_INDEX (INDEX STARTS WITH 1)
-- ASC for low-to-high and DESC for high-to-low
-- display all jobs information in JOBS table and sort by MAX_SALARY column DESC

SELECT * FROM JOBS
ORDER BY MAX_SALARY DESC;


-- Find any job information with JOB_TITLE end with Manager

SELECT * FROM JOBS
WHERE JOB_TITLE LIKE '%Manager';

-- Find all job information MIN_SALARY more than 8000 and less than 15000
-- and JOB_TITLE doen end with Manager

SELECT * FROM JOBS
WHERE MIN_SALARY BETWEEN 8000 AND 15000 
            AND JOB_TITLE NOT LIKE '%Manager';

-- NULL PRACTICE
-- Find out all employees that does not have department_ID from Employees table

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

--Find all Departments that do not have manager_ID in departments table

SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

--Find all locations in US and UK from locations table

SELECT * FROM LOCATIONS
WHERE COUNTRY_ID IN ('UK' , 'US');

--Find all countries in Region_ID of 1 and Country_Name not Belgium

SELECT * FROM COUNTRIES
WHERE REGION_ID = 1 AND COUNTRY_NAME != 'Belgium';


--- CONCATENATION IN SQL  using  || (we do not use + in SQL for concatenation)

-- you can combine String with anything using || 
-- for example COLUMN1 || COLUMN2    OR   'String here' || 'Another String Here'

-- Find full names of all employees
SELECT FIRST_NAME ||  '  ' ||    LAST_NAME AS FULL_NAME
FROM EMPLOYEES;

-- display the result as below
-- First_Name Makes XXX Money

SELECT FIRST_NAME || ' makes $' || SALARY  AS MONEY
FROM EMPLOYEES;

-- ARITHMETIC OPERATIONS: +  -  *  /


-- Find First_name  , Salary and Salary after $5000 raise from Employees table
SELECT FIRST_NAME , SALARY , SALARY + 5000 AS AFTER_RAISE
FROM EMPLOYEES;

-- Find First_name , Salary and Salary cut by 2000
SELECT FIRST_NAME , SALARY , SALARY - 2000 AS AFTER_CUT
FROM EMPLOYEES;

--Find Yearly Salary of all employees
-- If you want to have more than one word in alias you can use " double quote (ONLY FOR ALIAS)
SELECT FIRST_NAME , SALARY , SALARY * 12 AS "YEARLY SALARY" --- YEARLY_SALARY
FROM EMPLOYEES;




-- Functions in SQL -- Pre-written functionality we can directly use

-- Single Row Functions - gives the results for each and every row

--Here are a few String related functions in SQL
-- UPPER(value)            -        makes value upperCase
-- LOWER(value)          -        makes value lowerCase
-- LENGTH(value)         -        get the count or size of characters

--Get the first_name of Employee table in all caps (UPPERCASE)
SELECT FIRST_NAME , UPPER(FIRST_NAME) ,  LOWER(FIRST_NAME) , LENGTH(FIRST_NAME)
FROM EMPLOYEES;

--Find the employee names with exactly 6 characters
SELECT FIRST_NAME 
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;

-- Find any employee name that has letter 'a' in it, CASE INSENSITIVE
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE LOWER(FIRST_NAME) LIKE '%a%';    
--WHERE FIRST_NAME LIKE '%A%' OR FIRST_NAME LIKE '%a%' - ALTERNATIVE SOLUTION
--WHERE UPPER(FIRST_NAME) LIKE '%A%' - ONE MORE ALTERNATIVE SOLUTION


-- Number related Single row function: Round(number) OR Round(Number , digitCountYouWantToKeep)

--Find First_Name, Salary,  Daily salary of each employee from Employees table
SELECT FIRST_NAME , 
                SALARY , 
                SALARY/30 , 
                ROUND(SALARY/30) AS "DAILY SALARY",
                ROUND(SALARY/30 , 3) --- OVERLOADED FUNCTION: Number 3 defines how many decimal points you want to keep
FROM EMPLOYEES;



-- Multi Row Functions



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
                ROUND(SALARY/30 , 3) -- OVERLOADED FUNCTION: Number 3 defines how many decimal points you want to keep after dot (.)
FROM EMPLOYEES;


-- Multi Row Functions  | Group Function  | Aggregate Function
-- COUNT , MAX , MIN , SUM , AVG
SELECT COUNT(FIRST_NAME) 
FROM EMPLOYEES; --- 106 total row numbers

--SINCE IT DOES NOT MATTER WHAT COLUMN YOU USE TO COUNT THE ROWS (IF IT DOES NOT HAVE NULL VALUE
-- SO WE CAN REPLACE THE COLUMN NAME WITH *

SELECT COUNT(*) AS "EMPLOYEE COUNT"
FROM EMPLOYEES;

---COUNT USING DEPARTMENT_ID COLUMN : COUNT DOES NOT COUNT NULL VALUES
SELECT COUNT(DEPARTMENT_ID) --- 105 ROWS BECAUSE KIMBERLY DOES NOT HAVE DEPARTMENT_ID (NULL)
FROM EMPLOYEES;

---COUNT USING COMMISSION_PCT COLUMN
SELECT COUNT(COMMISSION_PCT) --- 35 ROWS BECAUSE THERE ARE MANY NULL VALUES IN THE COLUMN
FROM EMPLOYEES;

-- IF YOU WANT TO GET ALL ROWS , ALWAYS USE COUNT(*) INSTEAD

--Get max salary , Min salary , Avg and Sum of Salary from employees table

SELECT MAX(SALARY)
FROM EMPLOYEES;

SELECT MIN(SALARY)
FROM EMPLOYEES;

SELECT SUM(SALARY)
FROM EMPLOYEES;

-- Get average and round it up
SELECT AVG(SALARY) , ROUND(AVG(SALARY), 2)
FROM EMPLOYEES;

-- since we are aggregating the result of employees table we can do all in one shot
SELECT COUNT(*) AS "EMPLOYEE COUNT", 
                MAX(SALARY) AS "HIGHEST SALARY", 
                MIN(SALARY) AS "LOWEST SALARY", 
                SUM(SALARY) AS "TOTAL SALARY", 
                ROUND(AVG(SALARY)) AS "AVERAGE SALARY"
FROM EMPLOYEES;

--THIS SENTENCE DOES NOT MAKE SENSE IN ENGLISH!
SELECT FIRST_NAME , MAX(SALARY)
FROM EMPLOYEES;

-- MULTI ROW FUNCTIONS  | GROUP FUNCTION  | AGGREGATE FUNCTION (ALL SAME THING)
--if nothing is specified , group function will return one result for whole table
-- We can however , divide the result using GROUP BY COLUMN_YOU_WANT_GROUP_BY
-- then it will return one result per group
--GROUP BY can only be used along with group functions (COUNT , MAX , MIN , SUM, AVG)

--Find out employee count for each department
SELECT DEPARTMENT_ID , COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
--ORDER THE RESULT BY 1ST COLUMN
ORDER BY 1
;

--Find employee count for each job_id from employees table
SELECT  JOB_ID , COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

--Find max salary of each department in Employees table
SELECT DEPARTMENT_ID , MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

--Find sum of salary of each department in Employees table
SELECT DEPARTMENT_ID , SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

--Find sum of salary of each JOB_ID in Employees table
SELECT JOB_ID , SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

--USING MULTIPLE GROUP FUNCTIONS IN ONE SELECT
SELECT DEPARTMENT_ID , SUM(SALARY) , 
                MAX(SALARY) , 
                MIN(SALARY) , 
                AVG (SALARY) , 
                ROUND(AVG(SALARY) , 2) , 
                COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

--1. Find how many countries in each region using Countries Table
SELECT REGION_ID , COUNT(*)
FROM COUNTRIES
GROUP BY REGION_ID
ORDER BY 1;

--2. Find how many departments in each locations using Departments Table
SELECT DEPARTMENT_NAME , COUNT(*)
FROM DEPARTMENTS
GROUP BY DEPARTMENT_NAME;

-- 3. Find how many Locations in each Country using Locations table
--it should display these 2 columns : Country_ID and count
--3.1. Filter above result only display if the count us more than 3
SELECT COUNTRY_ID , COUNT(*)
FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNT(*) > 3;

--4. Find how many employees each manager has using employees table
SELECT MANAGER_ID , COUNT(*)
FROM EMPLOYEES
GROUP BY MANAGER_ID
ORDER BY 1;


--if we want to further filter already aggregated (grouped) result after the GROUP BY
--WE CAN USE HAVING
--GROUP BY SOME_COLUMN
--HAVING SOME_CONDITION IS TRUE
--HAVING can not be used alone by itself and it must be followed by GROUP BY
--In order to put condition on aggregated result, we must use HAVING instead of WHERE


--FIND OUT THE COUNT OF EMPLOYEE IN EACH DEPARTMENT
-- ONLY DISPLAY THE RESULT IF THE COUNT IS MORE THAN 5
SELECT DEPARTMENT_ID , COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 5; 

--FIND OUT THE SUM OF ALL EMPLOYEE SALARY IN EACH DEPARTMENT
-- ONLY DISPLAY THE RESULT IF THE SUM IS MORE THAN 100000
SELECT DEPARTMENT_ID , SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
WHERE SUM(SALARY) > 100000

--FIND OUT THE AVERAGE OF ALL EMPLOYEE SALARY IN EACH DEPARTMENT
-- ONLY DISPLAY THE RESULT IF THE AVERAGE IS MORE THAN 10000
SELECT DEPARTMENT_ID , ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 10000;

--FIND THE COUNT OF EMPLOYEES MAKES MORE THAN 10000
SELECT COUNT(*) FROM EMPLOYEES
WHERE SALARY > 10000;


--GROUP THE RESULT BY JOB_ID
SELECT JOB_ID , COUNT(*)
FROM EMPLOYEES
WHERE SALARY > 10000 -- If the condition is not related to aggregated result you can just use WHERE
GROUP BY JOB_ID;

--When do we use HAVING ---> When the condition includes an aggregated result
-- Filter above result if employee count is exactly 1
SELECT JOB_ID , COUNT(*)
FROM EMPLOYEES
WHERE SALARY > 10000
GROUP BY JOB_ID
HAVING COUNT(*) = 1;-- If the condition is related to aggregated result you MUST use HAVING

--5. Find  frequency of First_Name in Employees table
--In another term , find out COUNT of each FIRST_NAME in employees table
--Only display FIRST_NAMES that showed up more than once
SELECT FIRST_NAME , COUNT(*)
FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*) > 1;

--GROUP BY and HAVING can only be used if you have group functions in SELECT
-- so the result can be grouped by the column you specified and further filtered using HAVING



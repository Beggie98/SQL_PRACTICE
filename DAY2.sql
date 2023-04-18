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


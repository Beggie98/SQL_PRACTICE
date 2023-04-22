--DAY 3:
--Find average salary of each department in departments table
--remove the null department_id from result
--only display the result if the average salary is more than 8000

SELECT DEPARTMENT_ID , ROUND(AVG(SALARY))
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
--HAVING DEPARTMENT_ID IS NOT NULL; is also possible
HAVING AVG(SALARY) > 8000
ORDER BY 1;

SELECT DEPARTMENT_ID , ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID IS NOT NULL
AND AVG(SALARY) > 6000
ORDER BY 1;

--- LOWER , UPPER , LENGTH
-- find all UPPERCASE FIRST_NAME , LENGTH OF LAST_NAME , LENGTH OF FULL_NAME
-- Sort the result by 3 rd column
SELECT UPPER(FIRST_NAME) , 
                LENGTH(LAST_NAME) , 
                LENGTH(FIRST_NAME ||  LAST_NAME) , 
                FIRST_NAME ||  LAST_NAME AS "FULL NAME"
FROM EMPLOYEES
ORDER BY 3;

--- What if we want to get employees first name and department_name instead of department_id
-- FIRST_NAME is coming from Employees Table
-- DEPARTMENT_NAME is coming from Departments table

SELECT FIRST_NAME , DEPARTMENT_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King';

-- Now use this information to find out the name of department
-- Find the DEPARTMENT_NAME of the department with id of 90
SELECT DEPARTMENT_ID , DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 90;

--- SQL JOIN
--- INNER JOIN - joins matching part in both tables (PRIMARY KEY and FOREIGN KEY relationship)

SELECT EMPLOYEES.FIRST_NAME , EMPLOYEES.DEPARTMENT_ID , DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;
--kimberly with null DEPARTMENT_ID is not included because there is no PRIMARY KEY with null in DEPARTMENTS table

--We can simplify above query by providing alias (nickname) to table
--

SELECT e.FIRST_NAME , e.DEPARTMENT_ID , d.DEPARTMENT_NAME
FROM EMPLOYEES e --- e here is nickname for Employees table (LEFT TABLE)
INNER JOIN DEPARTMENTS d --- d is here nickname for Departments table (RIGHT TABLE)
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID; --- this is the condition using PRIMARY KEY FOREIGN KEY relationship


--- LEFT OUTER JOIN - returns everything that match + those that did not match from left table

--return all employee name department_id and department_name
-- including those employees that don't have department (null)

SELECT e.FIRST_NAME , e.DEPARTMENT_ID , d.DEPARTMENT_NAME
FROM EMPLOYEES e --- e here is nickname for Employees table (LEFT TABLE)
LEFT OUTER JOIN DEPARTMENTS d --- d is here nickname for Departments table (RIGHT TABLE)
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID; --- this is the condition using PRIMARY KEY FOREIGN KEY relationship
--- now KIMBERLY is included


--- RIGHT OUTER JOIN - returns everything that match + those that did not match from right table

--return all employee name department_id and department_name
-- including those departments that don't have any matching employees

SELECT e.FIRST_NAME , e.DEPARTMENT_ID , d.DEPARTMENT_NAME
FROM EMPLOYEES e --- e here is nickname for Employees table (LEFT TABLE)
RIGHT OUTER JOIN DEPARTMENTS d --- d is here nickname for Departments table (RIGHT TABLE)
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID; --- this is the condition using PRIMARY KEY FOREIGN KEY relationship



---FULL OUTER JOIN - returns everything that match from both tables + those that did not match from both tables

--return all employee name department_id and department_name
-- including those employees that don't have department (null)
-- including those departments that don't have any matching employees

SELECT e.FIRST_NAME , e.DEPARTMENT_ID , d.DEPARTMENT_NAME
FROM EMPLOYEES e --- e here is nickname for Employees table (LEFT TABLE)
FULL OUTER JOIN DEPARTMENTS d --- d is here nickname for Departments table (RIGHT TABLE)
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID; --- this is the condition using PRIMARY KEY FOREIGN KEY relationship
-- Exercise 1: String Patterns

-- Query 1
-- Prompt: Retrieve all employees whose address is in Elgin,IL.

SELECT F_NAME,L_NAME 
FROM Employees 
WHERE ADDRESS LIKE '%Elgin,IL' ;

-- Query 2 
-- Prompt: Retrieve all employees who were born during the 1970's.

SELECT F_NAME, L_NAME 
FROM Employees 
WHERE B_DATE BETWEEN 1970-01-01 AND 1979-12-31 ;

-- Above didn't work, any solution fixes possible?

-- BETTER: Use the wildcard char 

SELECT F_NAME, L_NAME 
FROM Employees 
WHERE B_DATE LIKE '197%' ;

-- Query 3
-- Prompt: Retrieve all employees in department 5 whose salary is between 60000 and 70000.

SELECT F_NAME, L_NAME
FROM Employees
WHERE DEP_ID=5 AND (SALARY BETWEEN 60000 and 70000);


-- Exercise 2: Sorting

-- Query 1
-- Prompt: Retrieve a list of employees ordered by department ID.

SELECT F_NAME,L_NAME, DEP_ID
FROM EMPLOYEES
ORDER BY 3;

-- Query 2
-- Prompt: Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.

SELECT F_NAME, L_NAME, DEP_ID
FROM EMPLOYEES
ORDER BY DEP_ID DESC , L_NAME DESC;

-- Query 3
-- Prompt: In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.

-- Advanced problem connecting two different tables

SELECT D.DEP_NAME, E.F_NAME, E.L_NAME
FROM DEPARTMENTS AS D, EMPLOYEES AS E
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;

-- Exercise 3: Grouping

-- Query 1
-- Prompt: For each department ID retrieve the number of employees in the department.

SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

-- Query 2
-- Prompt: For each department retrieve the number of employees in the department, and the average employee salary in the department.

SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

-- Query 3
-- Prompt: Label the computed columns in the result set of SQL problem 2 (Exercise 3 Problem 2) as NUM_EMPLOYEES and AVG_SALARY.

SELECT DEP_ID, 
COUNT(*) AS "NUM_EMPLOYEES",
AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;

-- Query 4
-- Prompt: In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary.

SELECT DEP_ID, 
COUNT(*) AS "NUM_EMPLOYEES",
AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG_SALARY;

-- Query 5
-- Prompt: In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.

SELECT DEP_ID, 
COUNT(*) AS "NUM_EMPLOYEES",
AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING COUNT(*)<4
ORDER BY AVG_SALARY;
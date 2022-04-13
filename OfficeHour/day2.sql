-- 1. write a SQL query to find the first name, last name, department number, and department name for each employee.
SELECT EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
         INNER JOIN DEPARTMENTS
                    ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 2. write a SQL query to find the first name, last name, department name, city, and state province for each employee.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY, L.STATE_PROVINCE
FROM EMPLOYEES E
         JOIN DEPARTMENTS D
              ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
         JOIN LOCATIONS L
              ON D.LOCATION_ID = L.LOCATION_ID;

-- 3. write a SQL query to find the first name, last name, salary, and job grade for all employees.
SELECT EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, EMPLOYEES.SALARY, JOB_GRADES.GRADE
FROM EMPLOYEES
         INNER JOIN JOB_GRADES
                    ON EMPLOYEES.SALARY BETWEEN JOB_GRADES.LOWEST_SAL AND JOB_GRADES.HIGHEST_SAL;

-- 4. write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department id and department name.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES
         JOIN DEPARTMENTS
              ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
WHERE DEPARTMENTS.DEPARTMENT_ID IN (80, 40);


-- 5. write a SQL query to find those employees whose first name contains a letter ‘z’. Return first name, last name, department name, city, and state province.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY, STATE_PROVINCE
FROM EMPLOYEES
         INNER JOIN DEPARTMENTS
    --foreign key               --primary key
                    ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
         INNER JOIN LOCATIONS
                    ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
WHERE EMPLOYEES.FIRST_NAME LIKE '%z%';



-- 6. write a SQL query to find all departments including those without any employee. Return first name, last name, department ID, department name
-- FIRST SOLUTION
SELECT FIRST_NAME, LAST_NAME, EMPLOYEES.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES
         RIGHT OUTER JOIN DEPARTMENTS
                          ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;
-- SECOND SOLUTION
SELECT FIRST_NAME, LAST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
         LEFT OUTER JOIN EMPLOYEES
                         ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;
-- 7. write a SQL query to find those employees who earn less than the employee of ID 182. Return first name, last name and salary.
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY
FROM EMPLOYEES E
         JOIN EMPLOYEES M
              ON E.SALARY < M.SALARY
WHERE m.EMPLOYEE_ID = 182;

--find the salary of 182
SELECT SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 182;


SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT SALARY
                FROM EMPLOYEES
                WHERE EMPLOYEE_ID = 182);


-- 8. write a SQL query to display the department name, city, and state province for each department.

SELECT DEPARTMENT_NAME, CITY, STATE_PROVINCE
FROM DEPARTMENTS
         --INNER JOIN LOCATIONS --SAME
         JOIN LOCATIONS
              ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;

--SAME
SELECT DEPARTMENT_NAME, CITY, STATE_PROVINCE
FROM LOCATIONS
         --INNER JOIN LOCATIONS --SAME
         JOIN DEPARTMENTS
              ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;

-- 9. write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
SELECT E.FIRST_NAME AS EMPLOYEES,M.FIRST_NAME AS MANAGERS
FROM EMPLOYEES E
INNER JOIN EMPLOYEES M
ON E.EMPLOYEE_ID=M.MANAGER_ID
ORDER BY M.FIRST_NAME;


-- 10 write a SQL query to find those employees who have or not any department. Return first name, last name, department ID, department name.

SELECT E.first_name, E.last_name, E.department_id, D.department_name
FROM employees E
         LEFT OUTER JOIN departments D
                         ON E.department_id = D.department_id;


-- 11. write a SQL query to find the employees and their managers. These managers do not work under any manager. Return the first name of the employee and manager.

SELECT E.first_name AS "Employee Name",
       M.first_name AS "Manager"
FROM employees E
         LEFT OUTER JOIN employees M
                         ON E.manager_id = M.employee_id;
-- 12.write a SQL query to find those employees who work in a department where the employee of last name 'Taylor' works. Return first name, last name and department ID


-- 13.write a SQL query to find those employees who get higher salary than the employee whose ID is 163. Return first name, last name.

SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
    WHERE SALARY>(
-- FIRST I WİLL GET THE SALARY OF THAT EMPLOYEE
SELECT SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID=163);

-- 14.write a SQL query to find those employees whose designation (JOB_TITLE JOB_ID) is the same as the employee whose ID is 169.
-- Return first name, last name, department ID and job ID.

SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,JOB_ID
FROM EMPLOYEES
    WHERE JOB_ID=(

--I will find the job_id of that employee whose ID is 169.
SELECT JOB_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID=169);


-- 15.write a SQL query to find those employees whose salary matches the smallest salary of any of the departments.
-- Return first name, last name and department ID.

SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID
FROM EMPLOYEES
    WHERE SALARY IN (
--I will get the min salary for each department
SELECT MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);

-- 16. write a SQL query to find those employees who earn more than the average salary.
-- Return employee ID, first name, last name.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME
FROM EMPLOYEES
    WHERE SALARY>(
--I will find the avg(salary)
SELECT avg(SALARY)
FROM EMPLOYEES);

-- 17. write a SQL query to find those employees who report that manager whose first name is ‘Payam’.
-- Return first name, last name, employee ID and salary.
SELECT FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY
FROM EMPLOYEES
    WHERE MANAGER_ID=(
--I will find the employee id who is Payam
SELECT EMPLOYEE_ID
FROM EMPLOYEES
WHERE FIRST_NAME='Payam');

-- 18. write a SQL query to find all those employees who work in the Finance department.
-- Return department ID, name (first), job ID and department name.
--first solution

SELECT D.DEPARTMENT_ID,E.FIRST_NAME,E.JOB_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
AND D.DEPARTMENT_NAME='Finance';

--second solution
SELECT D.DEPARTMENT_ID,E.FIRST_NAME,E.JOB_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID

  WHERE D.DEPARTMENT_NAME='Finance';


-- 19. write a SQL query to find those employees whose ID matches any of the number 134, 159 and 183. Return all the fields.
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (134,159,183);

-- 20. write a SQL query to find those employees whose salary is in the range of smallest salary, and 2500.
-- Return all the fields.
SELECT *
FROM EMPLOYEES
    WHERE SALARY BETWEEN (

--I need to get smallest salary
SELECT MIN(SALARY)
FROM EMPLOYEES) AND 2500;
-- 21. write a SQL query to find those employees who do not work in those departments
-- where manager ids are in the range 100, 200 (Begin and end values are included.)
-- Return all the fields of the employees.
SELECT *
FROM EMPLOYEES
    WHERE DEPARTMENT_ID NOT IN (
--I need to get Departments id's with manager id is between 100 and 200;
SELECT D.DEPARTMENT_ID
FROM DEPARTMENTS D
WHERE EMPLOYEES.MANAGER_ID BETWEEN 100 AND 200);


-- 22. write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.
SELECT MAX(SALARY)
FROM EMPLOYEES
    WHERE SALARY!=(

SELECT MAX(SALARY)
FROM EMPLOYEES);



-- 23. write a SQL query to find those employees who get fifth-highest salary. Return all the fields of the employees.

SELECT MIN(SALARY)
FROM(SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC)
WHERE ROWNUM<=8
   ;

SELECT SALARY
FROM(SELECT DISTINCT SALARY
     FROM EMPLOYEES
     ORDER BY SALARY DESC)
WHERE ROWNUM<=5
;
SELECT *
FROM EMPLOYEES
    WHERE SALARY=(
SELECT MIN(SALARY)
FROM (
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC )
WHERE ROWNUM<=5);
-- 1. write a SQL query to find the first name, last name, department number, and department name for each employee.
SELECT EMPLOYEES.FIRST_NAME,EMPLOYEES.LAST_NAME,DEPARTMENTS.DEPARTMENT_ID,DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 2. write a SQL query to find the first name, last name, department name, city, and state province for each employee.
SELECT E.FIRST_NAME,E.LAST_NAME,D.DEPARTMENT_NAME,L.CITY,L.STATE_PROVINCE
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;

-- 3. write a SQL query to find the first name, last name, salary, and job grade for all employees.
SELECT EMPLOYEES.FIRST_NAME,EMPLOYEES.LAST_NAME,EMPLOYEES.SALARY,JOB_GRADES.GRADE
FROM EMPLOYEES
INNER JOIN JOB_GRADES
ON EMPLOYEES.SALARY BETWEEN JOB_GRADES.LOWEST_SAL AND JOB_GRADES.HIGHEST_SAL;

-- 4. write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department id and department name.
SELECT FIRST_NAME,LAST_NAME,DEPARTMENTS.DEPARTMENT_ID,DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
WHERE DEPARTMENTS.DEPARTMENT_ID IN(80,40);


-- 5. write a SQL query to find those employees whose first name contains a letter ‘z’. Return first name, last name, department, city, and state province.


-- 6. write a SQL query to find all departments including those without any employee. Return first name, last name, department ID, department name


-- 7. write a SQL query to find those employees who earn less than the employee of ID 182. Return first name, last name and salary.


-- 8. write a SQL query to display the department name, city, and state province for each department.


-- 9. write a SQL query to find the employees and their managers. Return the first name of the employee and manager.


-- 10 write a SQL query to find those employees who have or not any department. Return first name, last name, department ID, department name.


-- 11. write a SQL query to find the employees and their managers. These managers do not work under any manager. Return the first name of the employee and manager.


-- 12.write a SQL query to find those employees who work in a department where the employee of last name 'Taylor' works. Return first name, last name and department ID



-- 13.write a SQL query to find those employees who get higher salary than the employee whose ID is 163. Return first name, last name.



-- 14.write a SQL query to find those employees whose designation is the same as the employee whose ID is 169. Return first name, last name, department ID and job ID.


-- 15.write a SQL query to find those employees whose salary matches the smallest salary of any of the departments. Return first name, last name and department ID.


-- 16. write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.


-- 17. write a SQL query to find those employees who report that manager whose first name is ‘Payam’. Return first name, last name, employee ID and salary.



-- 18. write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.



-- 19. write a SQL query to find those employees whose ID matches any of the number 134, 159 and 183. Return all the fields.



-- 20. write a SQL query to find those employees whose salary is in the range of smallest salary, and 2500. Return all the fields.



-- 21. write a SQL query to find those employees who do not work in those departments where manager ids are in the range 100, 200 (Begin and end values are included.) Return all the fields of the employees.




-- 22. write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.



-- 23. write a SQL query to find those employees who get fifth-highest salary. Return all the fields of the employees.


-- ==========================
-- 1. Count employees per role
-- ==========================
SELECT role, COUNT(*) AS total_employees
FROM employees
GROUP BY role
ORDER BY total_employees DESC;

-- ==========================
-- 2. Count employees per department
-- ==========================
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY total_employees DESC;

-- ==========================
-- 3. Count employees per location
-- ==========================
SELECT location, COUNT(*) AS total_employees
FROM employees
GROUP BY location
ORDER BY total_employees DESC;

-- ==========================
-- 4. Average salary per role
-- ==========================
SELECT role, AVG(salary) AS avg_salary
FROM employees
GROUP BY role
ORDER BY avg_salary DESC;

-- ==========================
-- 5. Average salary per department
-- ==========================
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- ==========================
-- 6. Salary distribution per role
-- ==========================
SELECT role, MIN(salary) AS min_salary, MAX(salary) AS max_salary, AVG(salary) AS avg_salary
FROM employees
GROUP BY role
ORDER BY avg_salary DESC;

-- ==========================
-- 7. Employees hired per year
-- ==========================
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS total_hired
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- ==========================
-- 8. Employees per department per location
-- ==========================
SELECT department, location, COUNT(*) AS total_employees
FROM employees
GROUP BY department, location
ORDER BY department, location;

-- ==========================
-- 9. Top 5 highest paid employees
-- ==========================
SELECT name, role, department, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- ==========================
-- 10. Employees earning above department average
-- ==========================
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.name, e.department, e.salary, d.avg_salary
FROM employees e
JOIN dept_avg d ON e.department = d.department
WHERE e.salary > d.avg_salary
ORDER BY e.salary DESC;

-- ==========================
-- 11. Percentage of employees per role
-- ==========================
WITH total_emp AS (
    SELECT COUNT(*) AS total_count FROM employees
)
SELECT role, COUNT(*) AS role_count, 
       ROUND((COUNT(*) * 100.0) / (SELECT total_count FROM total_emp), 2) AS percentage
FROM employees
GROUP BY role
ORDER BY percentage DESC;

-- ==========================
-- 12. Department headcount trend over time
-- ==========================
SELECT department, EXTRACT(YEAR FROM hire_date) AS year_hired, COUNT(*) AS total_hired
FROM employees
GROUP BY department, year_hired
ORDER BY department, year_hired;

-- ==========================
-- 13. Top 3 roles per location
-- ==========================
SELECT location, role, COUNT(*) AS total_employees
FROM employees
GROUP BY location, role
ORDER BY location, total_employees DESC;

-- ==========================
-- 14. Employees with tenure > 5 years
-- ==========================
SELECT name, role, department, hire_date, 
       ROUND(DATEDIFF(CURDATE(), hire_date)/365,2) AS tenure_years
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date)/365 > 5
ORDER BY tenure_years DESC;

-- ==========================
-- 15. Average salary by department and location
-- ==========================
SELECT department, location, AVG(salary) AS avg_salary
FROM employees
GROUP BY department, location
ORDER BY department, avg_salary DESC;

-- ==========================
-- 16. Rank employees by salary within department
-- ==========================
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY department, salary_rank;

-- ==========================
-- 17. Count employees by role per department
-- ==========================
SELECT department, role, COUNT(*) AS total_employees
FROM employees
GROUP BY department, role
ORDER BY department, total_employees DESC;

-- ==========================
-- 18. Employees grouped by salary range
-- ==========================
SELECT 
    CASE 
        WHEN salary < 50000 THEN '<50k'
        WHEN salary BETWEEN 50000 AND 100000 THEN '50k-100k'
        WHEN salary BETWEEN 100001 AND 150000 THEN '100k-150k'
        ELSE '>150k'
    END AS salary_range,
    COUNT(*) AS total_employees
FROM employees
GROUP BY salary_range
ORDER BY salary_range;

-- ==========================
-- 19. Departments with highest avg salary
-- ==========================
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 5;

-- ==========================
-- 20. Employees per manager (if manager_id exists)
-- ==========================
SELECT m.name AS manager_name, COUNT(e.employee_id) AS team_size
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY m.name
ORDER BY team_size DESC;

-- ==========================
-- END OF PORTFOLIO SQL
-- ==========================

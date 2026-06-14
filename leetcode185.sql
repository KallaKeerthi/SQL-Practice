-- 185. Department Top Three Salaries

/* A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments. */

SELECT Department, Employee, Salary
FROM(
    SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary,
       DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY salary DESC) AS rank_num
    FROM Employee e JOIN Department d
    ON e.departmentId = d.id) ranked
WHERE rank_num <= 3;
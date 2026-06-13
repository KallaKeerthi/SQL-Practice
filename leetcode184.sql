-- 184. Department Highest Salary

-- Write a solution to find employees who have the highest salary in each of the departments.

SELECT Department, Employee, Salary
FROM (SELECT d.name Department,
             e.name Employee,
             e.salary Salary,
             DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC)
             AS rank_num
             FROM Employee e JOIN Department d
             ON e.departmentId = d.id) ranked
WHERE rank_num = 1;
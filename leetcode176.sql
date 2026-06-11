-- 176. Second Highest Salary

/* Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null  */

-- THERE ARE SO MANY APPROACHES
-- 1. LIMIT OFFSET
-- 2. SUB QUERY
-- 3. WINDOW FUNCTIONS


-- Approach1: LIMIT AND OFFSET

-- Doesn't work if smax is not present
SELECT DISTINCT salary FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1;

-- If we place the same query in select clause it works

SELECT (SELECT DISTINCT salary FROM Employee
            ORDER BY salary DESC
            LIMIT 1 OFFSET 1)
AS SecondHighestSalary;


-- Approach2: SUB QUERY

SELECT DISTINCT MAX(salary) FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee)


-- Approach3: Window Functions
SELECT (
    SELECT DISTINCT salary
    FROM (SELECT 
            salary, 
            DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rnk
        FROM Employee) AS RankedSals
    WHERE dense_rnk = 2
) AS SecondHighestSalary
-- 177. Nth Highest Salary

/* Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null */

-- Using Limit and OFFSET

CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN 
    SET N = N-1;
    RETURN(
        SELECT DISTINCT salary 
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END

-- Using Window Functions

CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN 
        RETURN(
            SELECT salary 
            FROM (
                SELECT 
                    salary, 
                    DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rnk
                FROM Employee
            ) AS RankedSals
            WHERE dense_rnk = N
            LIMIT 1
        );
END
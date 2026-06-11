-- 180. Consecutive Numbers

/* Find all numbers that appear at least three times consecutively.

Return the result table in any order. */


-- Using LEAD only

SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT id, num, 
    LEAD(num, 1) OVER(ORDER BY id) AS num1,
    LEAD(num, 2) OVER(ORDER BY id) AS num2
    FROM Logs) AS cNums
WHERE num = num1 AND num = num2;

-- Using Both LEAD and LAG

SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT id, num, 
    LAG(num, 1) OVER(ORDER BY id) AS num1,
    LEAD(num, 1) OVER(ORDER BY id) AS num2
    FROM Logs) AS cNums
WHERE num = num1 AND num = num2;
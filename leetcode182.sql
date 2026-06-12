-- 182. Duplicate Emails

/* Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL. */

-- Using Group By Clause

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

-- Using JOINS

SELECT DISTINCT P1.email AS Email
FROM Person P1 JOIN Person P2
ON P1.email = P2.email
WHERE P1.id <> P2.id;

-- Using SUBQUERY

SELECT email AS Email
FROM (SELECT email, COUNT(email) AS EmailCount 
        FROM Person GROUP BY email) AS Counter
WHERE EmailCount > 1;
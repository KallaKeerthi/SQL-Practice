-- 183. Customers Who Never Order

-- Write a solution to find all customers who never order anything.

SELECT c.name AS Customers
 FROM Customers c LEFT JOIN Orders o
 ON c.id = o.customerId
 WHERE o.customerId IS NULL;
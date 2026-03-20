-- Q1: List all customers from Mumbai along with their total order value
SELECT c.name, SUM(p.unit_price * o.quantity) as total_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.name;

-- Q2: Find the top 3 products by total quantity sold
SELECT p.name, SUM(o.quantity) as total_sold
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.name
ORDER BY total_sold DESC
LIMIT 3;

-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT s.name, COUNT(DISTINCT o.customer_id) as unique_customers
FROM SalesReps s
LEFT JOIN Orders o ON s.sales_rep_id = o.sales_rep_id
GROUP BY s.sales_rep_id, s.name;

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
SELECT o.order_id, (p.unit_price * o.quantity) as total_value
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE (p.unit_price * o.quantity) > 10000
ORDER BY total_value DESC;

-- Q5: Identify any products that have never been ordered
SELECT name
FROM Products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Orders);

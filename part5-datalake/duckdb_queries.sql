-- Q1: List all customers along with the total number of orders they have placed

SELECT 
    c.name, 
    COUNT(o.order_id) AS total_orders
FROM 'customers.csv' c
LEFT JOIN 'orders.json' o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q2: Find the top 3 customers by total order value
-- Note: I have added a where condition where the query filters out cancelled orders for accurate revenue calculation

SELECT 
    c.name, 
    SUM(o.total_amount) AS total_spent
FROM 'customers.csv' c
JOIN 'orders.json' o ON c.customer_id = o.customer_id
WHERE o.status != 'cancelled'
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
-- Note: Standardizes city name comparison

SELECT DISTINCT 
    p.product_name
FROM 'products.parquet' p
JOIN 'orders.json' o ON p.order_id = o.order_id
JOIN 'customers.csv' c ON o.customer_id = c.customer_id
WHERE LOWER(c.city) = 'bangalore';

-- Q4: Join all three files to show: customer name, order date, product_name, and quantity

SELECT 
    c.name AS customer_name, 
    o.order_date, 
    p.product_name, 
    p.quantity
FROM 'customers.csv' c
JOIN 'orders.json' o ON c.customer_id = o.customer_id
JOIN 'products.parquet' p ON o.order_id = p.order_id;

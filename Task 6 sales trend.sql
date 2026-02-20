CREATE TABLE online_sales( 
    order_id SERIAL PRIMARY KEY,
	order_date DATE,
	product_id INT,
	amount decimal(10,2)
);

INSERT INTO online_sales (order_date, product_id, amount) VALUES
('2025-01-05', 101, 500),
('2025-01-10', 102, 300),
('2025-02-15', 103, 700),
('2025-02-24', 104, 400),
('2025-03-08', 105, 1000),
('2025-03-17', 106, 600),
('2025-06-22', 107, 800),
('2025-06-12', 108, 200),
('2025-09-30', 109, 900),
('2025-09-14', 110, 750);

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
	EXTRACT(MONTH FROM order_date) AS month
FROM online_sales;	

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
	EXTRACT(MONTH FROM order_date) AS month,
	SUM(amount) AS total_revenue,
	COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
	EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
	EXTRACT(MONTH FROM order_date) AS month,
	SUM(amount) AS total_revenue,
	COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE order_date BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY 
     EXTRACT(YEAR FROM order_date),
	 EXTRACT(MONTH FROM order_date)
ORDER BY
     year, month;
	
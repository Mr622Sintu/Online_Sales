CREATE TABLE online_salesS (
    order_id TEXT,
    order_date DATE,
    amount NUMERIC,
    product_id TEXT
);
SELECT * FROM online_salesS

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales;


SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    TO_CHAR(order_date, 'YYYY-MM') AS year_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month, year_month
ORDER BY year, month;


SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS year_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2023
GROUP BY year_month
ORDER BY year_month;

SELECT 
    TO_CHAR(order_date, 'Mon YYYY') AS month_year,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY month_year
ORDER BY total_revenue DESC
LIMIT 5;


SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS year_month,
    SUM(amount) / COUNT(DISTINCT order_id) AS avg_revenue_per_order
FROM online_sales
GROUP BY year_month
ORDER BY year_month;


SELECT * FROM online_salesS
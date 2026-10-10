-- E-Commerce Sales Analysis
-- Database: PostgreSQL (adaptable to MySQL with minor changes)

-- 1. Create a table for the provided CSV data
CREATE TABLE ecommerce_sales (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    city VARCHAR(80),
    category VARCHAR(50),
    product VARCHAR(100),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price_inr NUMERIC(12,2) NOT NULL CHECK (unit_price_inr >= 0),
    discount_rate NUMERIC(5,4) NOT NULL DEFAULT 0,
    sales_channel VARCHAR(20),
    gross_sales_inr NUMERIC(12,2),
    discount_amount_inr NUMERIC(12,2),
    net_sales_inr NUMERIC(12,2)
);

-- Import data/ecommerce_sales.csv using your database's CSV import tool.
-- If your CSV importer expects a header row, enable the header option.

-- 2. Total net sales
SELECT ROUND(SUM(net_sales_inr), 2) AS total_net_sales_inr
FROM ecommerce_sales;

-- 3. Monthly sales
SELECT DATE_TRUNC('month', order_date)::date AS sales_month,
       ROUND(SUM(net_sales_inr), 2) AS net_sales_inr
FROM ecommerce_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;

-- 4. Sales by product category
SELECT category,
       ROUND(SUM(net_sales_inr), 2) AS net_sales_inr
FROM ecommerce_sales
GROUP BY category
ORDER BY net_sales_inr DESC;

-- 5. Best-selling products by quantity
SELECT product, SUM(quantity) AS units_sold
FROM ecommerce_sales
GROUP BY product
ORDER BY units_sold DESC, product;

-- 6. Sales by city
SELECT city, ROUND(SUM(net_sales_inr), 2) AS net_sales_inr
FROM ecommerce_sales
GROUP BY city
ORDER BY net_sales_inr DESC;

-- 7. Online vs store sales
SELECT sales_channel,
       ROUND(SUM(net_sales_inr), 2) AS net_sales_inr,
       COUNT(*) AS order_count
FROM ecommerce_sales
GROUP BY sales_channel
ORDER BY net_sales_inr DESC;

-- 8. Average order value (one row = one order in this starter dataset)
SELECT ROUND(AVG(net_sales_inr), 2) AS average_order_value_inr
FROM ecommerce_sales;

-- 9. Monthly order counts
SELECT DATE_TRUNC('month', order_date)::date AS sales_month,
       COUNT(*) AS order_count
FROM ecommerce_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;

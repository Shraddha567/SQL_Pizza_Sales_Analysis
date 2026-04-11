-- CREATE DATABASE PIZZA_TEST_DB;
USE PIZZA_TEST_DB;
-- ALTER TABLE pizza_sales
-- MODIFY unit_price DECIMAL(10,2),
-- MODIFY total_price DECIMAL(10,2);

-- UPDATE pizza_sales 
-- SET order_date = STR_TO_DATE(order_date,'%d-%m-%Y');

-- ALTER TABLE pizza_sales
-- MODIFY order_date DATE;

-- ALTER TABLE pizza_sales
-- MODIFY order_time TIME;

-- Data Cleaning
-- Null check
-- SELECT * FROM pizza_sales
-- WHERE order_id IS NULL OR total_price IS NULL;

-- Data type check
-- SELECT COUNT(*) FROM pizza_sales;

SELECT * FROM pizza_sales LIMIT 10;
-- * STEP 1: KPI QUERIES *
-- We will calculate all 5 KPIs step-by-step.

-- 1.Total Revenue: The sum of the total price of all pizza orders.
-- SELECT SUM(total_price) AS total_revenue
-- FROM pizza_sales
-- 1.Output: 817860.049999993

-- 2. Average Order Value: The average amount spent per order, calculated 
-- by dividing the total revenue by the total number of orders.
-- SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value 
-- FROM pizza_sales
-- 2.Output: avg_order_value
-- 38.307262

-- 3.Total Pizzas Sold: The sum of the quantities of all pizzas sold.
-- SELECT SUM(quantity) AS total_pizzas_sold
-- FROM pizza_sales
-- 3.Output: total_pizzas_sold 
-- 49574

-- 4. Total Orders: The total number of orders placed.
-- SELECT COUNT(DISTINCT order_id) AS total_orders_placed
-- FROM pizza_sales
-- 4.Output: total_orders_placed
-- 21350

-- 5. Average Pizzas Per Order: The average number of pizzas sold per order, 
-- calculated by dividing the total number of pizzas by the total number of orders.
-- SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS avg_pizzas_per_order
-- FROM pizza_sales

-- 5. Output avg_pizzas_per_order
-- 2.3220

-- Combine All KPIs
-- SELECT 
-- ROUND(SUM(total_price), 2) AS total_revenue,
-- ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value,
-- SUM(quantity) AS total_pizzas_sold,
-- COUNT(DISTINCT order_id) AS total_orders,
-- ROUND(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id), 2) AS avg_pizzas_per_order
-- FROM pizza_sales;

-- Analytical Queries (Charts) 📊 Daily Trend
-- Q1. Daily Trend for Total Orders: Create a bar chart that displays 
-- the daily trend of total order volumes on a daily basis.

-- Q1-- Query
-- SELECT order_date,
-- COUNT(DISTINCT order_id) As total_orders
-- FROM pizza_sales
-- GROUP BY order_date
-- ORDER BY order_date;

-- Q2. Hourly Trend for Total Orders: Create a line chart that illustrates the hourly trend for total orders throughout the day.
--  This chart will allow us to identify peak hours or periods of high order activity.
-- Q2-- Query-- * Hourly Trend: Extract hour *
-- SELECT HOUR(order_time) AS Hour, 
-- COUNT(DISTINCT order_id) As total_orders
-- FROM pizza_sales
-- GROUP BY hour
-- ORDER BY hour;

-- Q3. Percentage of Sales by Pizza Category: Create a pie chart that shows the distribution of sales across different pizza categories. 
-- This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.
-- Q3-- Query-- * Sales by Category (%) *
-- SELECT pizza_category,
-- SUM(total_price) AS revenue,
-- ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales),
-- 2) AS percentage
-- FROM pizza_sales
-- GROUP BY pizza_category;

-- Q4. Percentage of Sales by Pizza Size: Generate a pie chart that represents the percentage of sales attributed to different pizza sizes.
-- This chart will help us understand customer preferences for pizza sizes and their impact on sales.
-- Q4-- Query
-- SELECT pizza_size,
-- ROUND(SUM(total_price) *100.0 / (SELECT SUM(total_price) FROM pizza_sales),2)AS Percentage
-- FROM pizza_sales
-- GROUP BY pizza_size;

-- Q5. Total Pizzas Sold by Pizza Category: Create a funnel chart that presents the total number of pizzas sold for each pizza category. 
-- This chart will allow us to compare the sales performance of different pizza categories.
-- Q5-- Query
-- SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
-- FROM pizza_sales
-- GROUP BY pizza_category;

-- Q6. Top 5 Best Sellers by Total Pizzas Sold: Create a bar chart highlighting the top 5 best-selling pizzas based on the total number of pizzas sold. This chart will help us identify the most popular pizza options.
-- Q6-- Query📊 Top 5 Pizzas
-- SELECT pizza_name, SUM(quantity) AS total_sold
-- FROM pizza_sales
-- GROUP BY pizza_name
-- ORDER BY total_sold DESC 
-- LIMIT 5;

-- Q7.Bottom 5 Worst Sellers by Total Pizzas Sold: Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the total number of pizzas sold. This chart will enable us to identify underperforming or less popular pizza options.
-- Q7-- Query📊 Bottom 5 Pizzas
-- SELECT pizza_name, SUM(quantity) AS total_sold
-- FROM pizza_sales
-- GROUP BY pizza_name
-- ORDER BY total_sold ASC
-- LIMIT 5;

-- SELECT * FROM pizza_sales;
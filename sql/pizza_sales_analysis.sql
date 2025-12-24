
USE PIZZA_DB;
GO


--KPI QUERIES


-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

-- Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales;

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- Average Pizzas per Order
SELECT CAST(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id) AS DECIMAL(10,2))
       AS Avg_Pizzas_Per_Order
FROM pizza_sales;



-- TRENDS


-- Daily Trend for Orders
SELECT DATENAME(WEEKDAY, order_date) AS Order_Day,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date);

-- Monthly Trend for Orders
SELECT DATENAME(MONTH, order_date) AS Month_Name,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date);


--SALES DISTRIBUTION


-- % Sales by Pizza Category
SELECT pizza_category,
       SUM(total_price) AS Total_Revenue,
       CAST(SUM(total_price) * 100.0 /
            (SELECT SUM(total_price) FROM pizza_sales)
            AS DECIMAL(10,2)) AS Percentage_Sales
FROM pizza_sales
GROUP BY pizza_category;

-- % Sales by Pizza Size
SELECT pizza_size,
       SUM(total_price) AS Total_Revenue,
       CAST(SUM(total_price) * 100.0 /
            (SELECT SUM(total_price) FROM pizza_sales)
            AS DECIMAL(10,2)) AS Percentage_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;


--PRODUCT PERFORMANCE


-- Total Pizzas Sold by Category (February)
SELECT pizza_category,
       SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- Top 5 Pizzas by Revenue
SELECT TOP 5 pizza_name,
       SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- Bottom 5 Pizzas by Revenue
SELECT TOP 5 pizza_name,
       SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

-- Top 5 Pizzas by Quantity
SELECT TOP 5 pizza_name,
       SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold DESC;

-- Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name,
       SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold ASC;

-- Top 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

-- Bottom 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;

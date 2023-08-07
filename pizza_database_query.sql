-- checking data which i imported--
use pizzadb;
SELECT * FROM pizza_sales;

-- calculation total revenue--
SELECT 
    SUM(total_price) AS Total_revenue
FROM
    pizza_sales;

-- Retrieve all columns from the 'pizza_sales' table--
SELECT * FROM pizza_sales;

-- Calculate the average total price per order--
SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS average_price_per_order
FROM
    pizza_sales;

-- Retrieve all columns from the 'pizza_sales' table--
SELECT 
    *
FROM
    pizza_sales;

-- Total number of pizza sold  --
SELECT 
    SUM(quantity) AS total_pizza_sold
FROM
    pizza_sales;

-- Retrieve all columns from the 'pizza_sales' table--
SELECT 
    *
FROM
    pizza_sales;

-- Total number of order placed--
SELECT 
    COUNT(DISTINCT order_id) AS total_order
FROM
    pizza_sales;

-- Retrieve all columns from the 'pizza_sales' table--
SELECT 
    *
FROM
    pizza_sales;

-- AVerage pizza sold per order give value in floats--
SELECT 
    CAST(CAST(SUM(quantity) AS DECIMAL (10 , 2 )) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10 , 2 ))
        AS DECIMAL (10 , 2 ))
FROM
    pizza_sales;
 
 -- problem 2 ( charts required by client)--
 
SELECT 
    *
FROM
    pizza_sales;

 -- Daily trend for total orders--
SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY DAYNAME(order_date);


-- Hourly trend chart 
SELECT 
    EXTRACT(HOUR FROM order_time) AS order_hours,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY EXTRACT(HOUR FROM order_time)
ORDER BY EXTRACT(HOUR FROM order_time);

-- percentage of sales by pizza category--
select pizza_category,sum(total_price)*100/ (select sum(total_price) from pizza_sales) AS pct
from pizza_sales 
group by pizza_category;

-- percentage of sales by pizza size--
select pizza_size,sum(total_price)*100/ (select sum(total_price) from pizza_sales) 
from pizza_sales 
group by pizza_size;
 
 -- total pizza sold by pizza category--
 select pizza_category,sum(quantity)
 from pizza_sales
 group by pizza_category;
 
 -- top 5 best seller total pizza sold--
SELECT pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC # it is used for getting values in descending
LIMIT 5;

-- Bottom 5 wrost selling pizzas--
SELECT pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC # it is used for getting values in  ascending
limit 5;




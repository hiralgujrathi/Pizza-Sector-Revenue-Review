SELECT * FROM pizza_sales
--KPIs
--Total Revenue
SELECT SUM(total_price) as Total_Revenue FROM pizza_sales;

--Average order value
SELECT SUM(total_price)/COUNT(distinct order_id) as Average_order_value from pizza_sales;

--Total Pizzas sold
SELECT SUM(quantity) as Total_Pizza_Sold from pizza_sales

--Total Orders
SELECT COUNT(DISTINCT order_id) as Total_orders from pizza_sales

--Average Pizzas per order
SELECT SUM(quantity)/COUNT(distinct order_id) as Average_Pizza_Per_Order FROM pizza_sales

--LETS SEE THE DAILY TRENDS

--Which day had how many total orders
SELECT FORMAT(CAST(order_date as DATE),'ddd') as Order_day,COUNT(distinct order_id) as Orders 
FROM pizza_sales 
GROUP BY FORMAT(CAST(order_date as DATE),'ddd')
ORDER BY Orders desc

--Similarly let's see for months
SELECT DATENAME(mm,order_date) as Order_month ,COUNT(distinct order_id) as Orders
FROM pizza_sales
GROUP BY DATENAME(mm,order_date)
Order by Orders desc

--Percentage of Sales by Pizza Category
SELECT pizza_category,CAST(SUM(total_price) as decimal(10,2)) as Total_sum,cast(SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales) as decimal(10,2))*100 as Percentage 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_sum

--Percentage of Sales by Pizza Size
SELECT pizza_size,CAST(SUM(total_price) as decimal(10,2)) as Total_sum,cast(SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales) as decimal(10,2))*100 as Percentage 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Total_sum

--Total pizzas sold by Pizza Category
SELECT pizza_category,SUM(quantity) as Total_quantity
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_quantity

--Top 5 pizzas by revenue
SELECT TOP 5 pizza_name,SUM(total_price) as Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(total_price) DESC

--Bottom 5 pizzas by revenue
SELECT TOP 5 pizza_name,SUM(total_price) as Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(total_price)

--Top 5 pizzas by quantity sold
SELECT TOP 5 pizza_name , SUM(quantity) as Total_quantity_sold FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(quantity) DESC

--Bottom 5 pizzas by quantity sold
SELECT TOP 5 pizza_name , SUM(quantity) as Total_quantity_sold FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(quantity) 
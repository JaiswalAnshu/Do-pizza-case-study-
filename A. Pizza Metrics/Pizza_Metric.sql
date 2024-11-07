#Case--  Study #2 - Pizza Runner'

-- A. Pizza Metrics
  
-- Question 1. How many pizzas were ordered? 
  
--Solution 1 :
SELECT  COUNT(order_id) as Pizza_ordered 
FROM CUSTOMER_ORDERS ;

-- Learning from the Question1 :


-- 2. How many unique customer orders were made?
SELECT COUNT(DISTINCT ORDER_ID ) AS Unique_Order
FROM CUSTOMER_ORDERS ;

-- 3.How many successful orders were delivered by each runner?
SELECT runner_id , count(runner_id ) AS SUCESSFUL_ORDERS
FROM runner_orders 
WHERE  distance != "NULL"
GROUP BY  runner_id ;


-- 4.How many of each type of pizza was delivered?
SELECT co.pizza_id ,pn.pizza_name, COUNT(co.pizza_id) AS NUMBER_OF_PIZZA
FROM customer_orders co
INNER JOIN runner_orders ro
ON co.order_id = ro.order_id 
INNER JOIN pizza_names pn
ON co.pizza_id = pn.pizza_id
WHERE pickup_time <> 'null'
GROUP BY co.pizza_id , pn.pizza_name ;


-- 5.How many Vegetarian and Meatlovers were ordered by each customer?
SELECT co.customer_id , pn.pizza_name ,  COUNT(co.pizza_id) AS NUMBER_OF_PIZZA
FROM customer_orders co
INNER JOIN runner_orders ro
ON co.order_id = ro.order_id 
INNER JOIN pizza_names pn
ON co.pizza_id = pn.pizza_id
WHERE pickup_time <> 'null'
GROUP BY co.customer_id, co.pizza_id , pn.pizza_name 
ORDER BY customer_id , COUNT(co.pizza_id) DESC ;

-- 6. What was the maximum number of pizzas delivered in a single order? 
SELECT order_id , count(order_id) AS COUNT_OF_PIZZAS
FROM customer_orders 
GROUP BY  order_id 
ORDER BY  count(order_id) DESC
LIMIT 1  ;

-- 7.For each customer, how many delivered pizzas had at least 1 change and how many had no changes? 
-- noT SOLVED

-- 8.How many pizzas were delivered that had both exclusions and extras? 
































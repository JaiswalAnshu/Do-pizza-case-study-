#Case--  Study #2 - Pizza Runner'

-- A. Pizza Metrics
-- Question 1. How many pizzas were ordered? 
-- Solution :
SELECT  COUNT(order_id) as Pizza_ordered 
FROM CUSTOMER_ORDERS ;

/* Learnings from  Question 1:
Use of COUNT() function
*/



-- Question 2. How many unique customer orders were made?
-- Solution :
SELECT COUNT(DISTINCT ORDER_ID ) AS Unique_Order
FROM CUSTOMER_ORDERS ;

/* Learnings from  Question 2:
Use of DISTINCT() function to get unique values
*/




-- Question 3.How many successful orders were delivered by each runner?
-- Solution :
SELECT runner_id , count(runner_id ) AS SUCESSFUL_ORDERS
FROM runner_orders 
WHERE  distance != "NULL"
GROUP BY  runner_id ;

/* Learnings from  Question 3:
Use of GROUP BY and aggregate functions 
*/


-- Question 4.How many of each type of pizza was delivered?
-- Solution :
SELECT co.pizza_id ,pn.pizza_name, COUNT(co.pizza_id) AS NUMBER_OF_PIZZA
FROM customer_orders co
INNER JOIN runner_orders ro
ON co.order_id = ro.order_id 
INNER JOIN pizza_names pn
ON co.pizza_id = pn.pizza_id
WHERE pickup_time <> 'null'
GROUP BY co.pizza_id , pn.pizza_name ;

/* Learnings from  Question 4:
Use of joints in SQL tables 
*/



-- Question 5.How many Vegetarian and Meatlovers were ordered by each customer?
-- Solution :
SELECT co.customer_id , pn.pizza_name ,  COUNT(co.pizza_id) AS NUMBER_OF_PIZZA
FROM customer_orders co
INNER JOIN runner_orders ro
ON co.order_id = ro.order_id 
INNER JOIN pizza_names pn
ON co.pizza_id = pn.pizza_id
WHERE pickup_time <> 'null'
GROUP BY co.customer_id, co.pizza_id , pn.pizza_name 
ORDER BY customer_id , COUNT(co.pizza_id) DESC ;

/* Learnings from  Question 5:
Use of joints  with aggregate function in SQL tables 
*/





-- Question 6. What was the maximum number of pizzas delivered in a single order? 
-- Solution :
SELECT order_id , count(order_id) AS COUNT_OF_PIZZAS
FROM customer_orders 
GROUP BY  order_id 
ORDER BY  count(order_id) DESC
LIMIT 1  ;

/* Learnings from  Question 6:
Use of Limit and Offset Clause in SQL along with aggregate functions .
*/




-- Question 7.For each customer, how many delivered pizzas had at least 1 change and how many had no changes? 
-- Solution :




-- Question 8.How many pizzas were delivered that had both exclusions and extras? 
-- Solution :
UPDATE customer_orders
SET exclusions = 'null'
WHERE trim(exclusions) = '';

SELECT count(*) AS Number_Of_Pizzas 
FROM customer_orders 
WHERE extras <> 'null'
AND exclusions <> 'null' ;

/* Learnings from  Question 8 :
- Learnt how to Deal with whitespaces ('') using Trim function  . 
- Steps are : 
	-  Find all whitespaces in the table column using Trim function .
		eg. SELECT *
        FROM Table_name 
        WHERE TRIM(column_name) = '';
    - Update all whitespaces to some default value such as null or 0 ; 
		eg. UPDATE Table_name 
        SET column_name = 'null' 
        WHERE TRIM(column_name) = '';
	*/




-- Question 9. What was the total volume of pizzas ordered for each hour of the day?
-- Solution :
SELECT COUNT(order_id) AS number_of_Pizza,  DATE_FORMAT(order_time , "%h:00:00") AS Hourly_time  
FROM customer_orders 
GROUP BY  Hourly_time;

/* Learnings from  Question 9 :
How to withdraw only date or time etc from a  
timestramp column using DATE_FORMAT() function.
	eg. SELECT DATE_FORMAT(column_name , "%y-%m-%d %h:00:00" ) 
	FROM TABLE_NAME ;
*/




-- Question 10. What was the volume of orders for each day of the week?
-- Solution :
SELECT COUNT(*) AS Order_number, 
DAYNAME(order_time) AS Week_Day
FROM customer_orders 
GROUP BY Week_Day;

/* Learnings from  Question 10 :
How to extract weekday from  a timestramp column using DAYNAME() function.
	eg. SELECT DAYNAME(order_time) 
	FROM Table_name ;
*/


































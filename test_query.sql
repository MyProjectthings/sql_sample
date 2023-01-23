
-- this is our sales table

CREATE TABLE sales (
order_id int,
salesman_name character varying(50),
product_id character varying(50),
sales_region character varying(50),
sales_date date
);


-- inserting records into our table

INSERT INTO public.sales(
order_id, salesman_name, product_id, sales_region, sales_date)
VALUES (1,'Mohit K','Book11','New Delhi','2020-05-01'),
(2,'Rey Holt','Book11','Mumbai','2020-05-02'),
(3,'Swati Singh','Book24','New Delhi','2020-05-03'),
(4,'Indrani K','Book24','Mumbai','2020-05-01'),
(5,'Dave Prakash','Book11','Mumbai','2020-05-02'),
(6,'Joshua S','Book24','New Delhi','2020-05-03'),
(7,'Mrinali Pal','Book11','New Delhi','2020-05-04'),
(8,'Mohit K','Book24','New Delhi','2020-05-02'),
(9,'Rey Holt','Book24','Mumbai','2020-05-05'),
(10,'Indrani K','Book11','Mumbai','2020-05-04'),
(11,'Joshua S','Book24','New Delhi','2020-05-05'),
(12,'Mohit K','Book11','New Delhi','2020-05-04');


-- viewing our table

SELECT * FROM sales;

-- running a few commands on our table

SELECT order_id, salesman_name FROM sales;


SELECT DISTINCT product_id FROM sales;


SELECT * FROM sales
ORDER BY sales_date;



-- PERFORMING LOCKING FUNCTIONS


-- Inserting the total number of orders placed in each region based on records mentioned in the sales table in a new table called “sales_count” in locktable mode

-- creating the new table

CREATE TABLE sales_count(
sales_region VARCHAR,
tot_orders INT
);


-- performing our locking function

BEGIN WORK;
LOCK TABLE sales IN SHARE MODE;
INSERT INTO sales_count(sales_region,tot_orders)
SELECT sales_region, count(order_id) as tot_orders
FROM sales
GROUP BY sales_region;
COMMIT WORK;


-- viewing the new table

SELECT * FROM sales_count;



-- Total Quantity sold by Month
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  SUM(sales.qty) AS total_quantity
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
  ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1;

-- Total Quantity sold by Day
SELECT 
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name,
  SUM(sales.qty) AS total_quantity
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
  ON sales.prod_id = product.product_id
GROUP BY 1 
ORDER BY 1, 2 DESC;

-- Total Sales Revenue before Discount by Month
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  SUM(sales.qty) * SUM(sales.price) AS total_sales_revenue
FROM balanced_tree.sales AS sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Total Sales Revenue before Discount by Day
SELECT 
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name,
  SUM(sales.qty * sales.price) AS total_sales_revenue
FROM balanced_tree.sales AS sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Net Sales Revenue by Month
SELECT
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) AS net_sales_revenue
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Net Sales Revenue by day
SELECT
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) AS net_sales_revenue
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Total Discount Amount by Month
SELECT
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month, 
  SUM(sales.qty * sales.price * sales.discount/100) AS total_discount
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Total Discount Amount by Day
SELECT
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name, 
  SUM(sales.qty * sales.price * sales.discount/100) AS total_discount
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Gross Profit by Month
SELECT
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) - (SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100)) * 0.60 AS gross_profit
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Gross Profit by Day
SELECT
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) - (SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100)) * 0.60 AS gross_profit
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Total Sales Revenue before Discount and Gross Profit by Segment and Month
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  product.segment_name,
  SUM(sales.qty * sales.price) AS total_sales_revenue,
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) - (SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100)) * 0.60 AS gross_profit
FROM balanced_tree.sales AS sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1, 2
ORDER BY 1;
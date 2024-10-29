-- Cantidad total vendida por mes
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  SUM(sales.qty) AS total_quantity
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
  ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1;

-- Cantidad total vendida por día
SELECT 
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name,
  SUM(sales.qty) AS total_quantity
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
  ON sales.prod_id = product.product_id
GROUP BY 1 
ORDER BY 1, 2 DESC;

-- Ingresos totales por ventas antes del descuento por mes
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  SUM(sales.qty) * SUM(sales.price) AS total_sales_revenue
FROM balanced_tree.sales AS sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Ingresos totales por ventas antes del descuento por día
SELECT 
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name,
  SUM(sales.qty * sales.price) AS total_sales_revenue
FROM balanced_tree.sales AS sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Ingresos netos por ventas mensuales
SELECT
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) AS net_sales_revenue
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Ingresos netos por ventas por día
SELECT
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) AS net_sales_revenue
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Monto total de descuentos por mes
SELECT
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month, 
  SUM(sales.qty * sales.price * sales.discount/100) AS total_discount
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Monto total de descuentos por día
SELECT
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name, 
  SUM(sales.qty * sales.price * sales.discount/100) AS total_discount
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Beneficio bruto por mes
SELECT
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) - (SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100)) * 0.60 AS gross_profit
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1;

-- Beneficio bruto por día
SELECT
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name, 
  SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100) - (SUM(sales.qty * sales.price) - SUM(sales.qty * sales.price * sales.discount/100)) * 0.60 AS gross_profit
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Ingresos totales por ventas antes de descuentos y beneficio bruto por segmento y mes
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
-- Transacciones únicas por mes
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  COUNT(DISTINCT sales.txn_id) AS transaction_count
FROM balanced_tree.sales AS sales
GROUP BY 1;

-- Transacciones únicas por día
SELECT 
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day_name,
  COUNT(DISTINCT sales.txn_id) AS transaction_count
FROM balanced_tree.sales AS sales
GROUP BY 1
ORDER BY 1, 2 DESC;

-- Promedio de productos únicos comprados en cada transacción por mes
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  ROUND(AVG(total_quantity), 1) AS avg_unique_products
FROM (
  SELECT
    txn_id,
    COUNT(DISTINCT sales.prod_id) AS total_quantity
  FROM balanced_tree.sales
  GROUP BY txn_id
) AS total_quantities
JOIN balanced_tree.sales AS sales ON sales.txn_id = total_quantities.txn_id
GROUP BY 1 
ORDER BY 1;

-- Promedio de productos únicos comprados en cada transacción por día
SELECT 
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day,
  ROUND(AVG(total_quantity), 1) AS avg_unique_products
FROM (
  SELECT
    txn_id,
    COUNT(DISTINCT sales.prod_id) AS total_quantity
  FROM balanced_tree.sales
  GROUP BY txn_id
) AS total_quantities
JOIN balanced_tree.sales AS sales ON sales.txn_id = total_quantities.txn_id
GROUP BY 1 
ORDER BY 1;

-- Valor promedio de descuento por transacción por mes
SELECT 
  TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
  ROUND(AVG(sales.discount), 1) AS avg_discount_value
FROM balanced_tree.sales
INNER JOIN balanced_tree.product_details AS product
  ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1;

-- Valor promedio de descuento por transacción por día
SELECT 
  TO_CHAR(DATE_TRUNC('day', sales.start_txn_time::timestamp), 'YYYY-MM-DD') AS day,
  ROUND(AVG(sales.discount), 1) AS avg_discount_value
FROM balanced_tree.sales AS sales
INNER JOIN balanced_tree.product_details AS product
	ON sales.prod_id = product.product_id
GROUP BY 1
ORDER BY 1;

-- Porcentaje de todas las transacciones para miembros/no miembros por mes
WITH transactions_cte AS (
  -- Calcular el número total de transacciones por mes y miembro/no miembro
  SELECT 
    member,
    TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
    COUNT(DISTINCT txn_id) AS transactions
  FROM balanced_tree.sales
  GROUP BY 1, 2
)

SELECT 
  month,
  member,
  transactions,
  -- Calcular el porcentaje de transacciones que son de miembros/no miembros
  ROUND(100.0 * transactions / NULLIF(SUM(transactions) OVER (PARTITION BY month), 0), 1) AS percentage
FROM transactions_cte
ORDER BY 1, 2;

-- Ingreso promedio por transacciones de miembros y no miembros por mes
WITH revenue_cte AS (
  SELECT
    member,
    TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
    txn_id,
    price * qty AS revenue
  FROM balanced_tree.sales
  GROUP BY 1, 2, 3, 4
)

SELECT member,
  month,
  ROUND(AVG(revenue), 2) AS avg_revenue
FROM revenue_cte
GROUP BY 1, 2;
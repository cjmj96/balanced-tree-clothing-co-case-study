-- Top 3 products by total revenue before discount by Month
WITH ranked_products AS (
  SELECT
    TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
    product.product_id,
    product.product_name,
    SUM(sales.qty * sales.price) AS revenue,
    ROW_NUMBER() OVER (PARTITION BY TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') ORDER BY SUM(sales.qty * sales.price) DESC) AS rank
  FROM balanced_tree.sales
  INNER JOIN balanced_tree.product_details AS product
    ON sales.prod_id = product.product_id
  GROUP BY 1, 2, 3
)

SELECT month, product_id, product_name, revenue
FROM ranked_products
WHERE rank <= 3
ORDER BY month, revenue DESC;

-- Top selling product for each segment by Month
WITH top_selling_cte AS ( 
  SELECT 
    TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
    product.segment_id,
    product.segment_name, 
    product.product_id,
    product.product_name,
    SUM(sales.qty) AS total_quantity,
    RANK() OVER (
      PARTITION BY segment_id 
      ORDER BY SUM(sales.qty) DESC) AS ranking
  FROM balanced_tree.sales
  INNER JOIN balanced_tree.product_details AS product
    ON sales.prod_id = product.product_id
  GROUP BY 
    1, 2, 3, 4, 5
)

SELECT 
  month, 
  segment_id,
  segment_name, 
  product_id,
  product_name,
  total_quantity
FROM top_selling_cte
WHERE ranking = 1;

-- Top selling product for each category by Month
WITH top_selling_cte AS ( 
  SELECT
    TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth') AS month,
    product.category_id,
    product.category_name, 
    product.product_id,
    product.product_name,
    SUM(sales.qty) AS total_quantity,
    RANK() OVER (
      PARTITION BY TO_CHAR(DATE_TRUNC('month', sales.start_txn_time::timestamp), 'FMMonth'), product.category_id 
      ORDER BY SUM(sales.qty) DESC) AS ranking
  FROM balanced_tree.sales
  INNER JOIN balanced_tree.product_details AS product
    ON sales.prod_id = product.product_id
  GROUP BY 
    1, 2, 3, 4, 5
)

SELECT 
  month,
  category_id,
  category_name, 
  product_id,
  product_name,
  total_quantity
FROM top_selling_cte
WHERE ranking = 1;

-- Percentage split of revenue by product for each segment by Month
WITH product_revenue AS (
    SELECT
        TO_CHAR(DATE_TRUNC('month', s.start_txn_time::timestamp), 'FMMonth') AS month, 
        pd.product_id,
        pd.segment_id,
        pd.segment_name,
        SUM(s.qty * s.price) AS revenue
    FROM 
        balanced_tree.sales s
    JOIN 
        balanced_tree.product_details pd
    ON 
        s.prod_id = pd.product_id
    GROUP BY 
        1, 2, 3, 4
),
segment_revenue AS (
    SELECT
        month, 
        segment_id,
        segment_name,
        SUM(revenue) AS total_revenue
    FROM 
        product_revenue
    GROUP BY 
        1, 2, 3
)
SELECT 
    pr.month,
    pr.product_id,
    pr.segment_id,
    pr.segment_name,
    pr.revenue,
    sr.total_revenue,
    ROUND((pr.revenue / sr.total_revenue) * 100, 1) AS revenue_percentage
FROM 
    product_revenue pr
JOIN 
    segment_revenue sr
ON 
    pr.segment_id = sr.segment_id AND pr.month = sr.month
ORDER BY sr.month;

-- Percentage split of revenue by segment for each category by Month
WITH segment_revenue AS (
    SELECT 
        TO_CHAR(DATE_TRUNC('month', s.start_txn_time::timestamp), 'FMMonth') AS month, 
        pd.segment_id,
        pd.segment_name,
        pd.category_id,
        pd.category_name,
        SUM(s.qty * s.price) AS revenue
    FROM 
        balanced_tree.sales s
    JOIN 
        balanced_tree.product_details pd
    ON 
        s.prod_id = pd.product_id
    GROUP BY 
        1, 2, 3, 4, 5
),
category_revenue AS (
    SELECT
        month, 
        category_id,
        category_name,
        SUM(revenue) AS total_revenue
    FROM 
        segment_revenue
    GROUP BY 
        1, 2, 3
)
SELECT 
    sr.month,
    sr.segment_id,
    sr.segment_name,
    sr.category_id,
    sr.category_name,
    sr.revenue,
    cr.total_revenue,
    ROUND((sr.revenue / cr.total_revenue) * 100, 1) AS revenue_percentage
FROM 
    segment_revenue sr
JOIN 
    category_revenue cr
ON 
    sr.category_id = cr.category_id AND sr.month = cr.month
ORDER BY 
    sr.month, sr.segment_id;

-- Percentage split of total revenue by category and Month
WITH product_revenue AS (
    SELECT
        TO_CHAR(DATE_TRUNC('month', start_txn_time::timestamp), 'FMMonth') AS month, 
        prod_id,
        SUM(qty * price) AS product_revenue
    FROM 
        balanced_tree.sales
    GROUP BY 
        1, 2
),
category_revenue AS (
    SELECT
        pr.month,
        pd.category_name,
        SUM(pr.product_revenue) AS category_total_revenue
    FROM 
        product_revenue pr
    JOIN 
        balanced_tree.product_details pd
    ON 
        pr.prod_id = pd.product_id
    GROUP BY 
        1, 2
),
total_revenue AS (
    SELECT
        month,
        SUM(category_total_revenue) AS total_revenue
    FROM 
        category_revenue
    GROUP BY 
        1
)
SELECT
    cr.month,
    cr.category_name,
    cr.category_total_revenue,
    ROUND((cr.category_total_revenue / tr.total_revenue) * 100, 1) AS percentage_split
FROM 
    category_revenue cr
JOIN 
    total_revenue tr
ON 
    cr.month = tr.month
ORDER BY 1, 2;

-- Total transaction “penetration” for each product by Month
WITH total_transactions AS (
    SELECT
      TO_CHAR(DATE_TRUNC('month', start_txn_time::timestamp), 'FMMonth') AS month,
      COUNT(DISTINCT txn_id) AS total_txn_count
    FROM balanced_tree.sales
    GROUP BY 
      TO_CHAR(DATE_TRUNC('month', start_txn_time::timestamp), 'FMMonth')
),
product_transactions AS (
    SELECT
        TO_CHAR(DATE_TRUNC('month', start_txn_time::timestamp), 'FMMonth') AS month,
        prod_id,
        COUNT(DISTINCT txn_id) AS product_txn_count
    FROM balanced_tree.sales
    WHERE qty > 0
    GROUP BY 1, 2
)
SELECT
    pt.month,
    pd.product_id,
    pd.product_name,
    pt.product_txn_count,
    tt.total_txn_count,
    SUM(pt.product_txn_count::FLOAT / tt.total_txn_count) AS penetration
FROM balanced_tree.product_details pd
JOIN product_transactions pt ON pd.product_id = pt.prod_id
JOIN total_transactions tt ON pt.month = tt.month
GROUP BY 1, 2, 3, 4, 5
ORDER BY 1, 6 DESC;

-- Most Common 3-Product combination in transactions by Month
WITH transaction_products AS (
    SELECT
        TO_CHAR(DATE_TRUNC('month', start_txn_time), 'FMMonth') AS month,
        s.txn_id,
        pd.product_name
    FROM
        balanced_tree.sales s
    JOIN
        balanced_tree.product_details pd ON s.prod_id = pd.product_id
    GROUP BY
        month, s.txn_id, pd.product_name
),
transactions_with_3_plus_products AS (
    SELECT
        month,
        txn_id
    FROM
        transaction_products
    GROUP BY
        month, txn_id
    HAVING
        COUNT(DISTINCT product_name) >= 3
),
product_combinations AS (
    SELECT
        tp1.month,
        tp1.txn_id,
        LEAST(tp1.product_name, tp2.product_name, tp3.product_name) AS product1,
        GREATEST(tp1.product_name, tp2.product_name, tp3.product_name) AS product3,
        CASE
            WHEN tp1.product_name < tp2.product_name AND tp2.product_name < tp3.product_name THEN tp2.product_name
            WHEN tp1.product_name < tp3.product_name AND tp3.product_name < tp2.product_name THEN tp3.product_name
            ELSE tp1.product_name -- Fallback to product1
        END AS product2
    FROM
        transaction_products tp1
    JOIN
        transaction_products tp2 ON tp1.txn_id = tp2.txn_id AND tp1.product_name < tp2.product_name
    JOIN
        transaction_products tp3 ON tp1.txn_id = tp3.txn_id AND tp2.product_name < tp3.product_name
    WHERE
        tp1.txn_id IN (SELECT txn_id FROM transactions_with_3_plus_products)
),
ranked_combinations AS (
    SELECT
        pc.month,
        pc.product1,
        pc.product2,
        pc.product3,
        COUNT(*) AS combination_count,
        ROW_NUMBER() OVER (PARTITION BY pc.month ORDER BY COUNT(*) DESC) AS rank
    FROM
        product_combinations pc
    GROUP BY
        pc.month, pc.product1, pc.product2, pc.product3
)
SELECT
    month,
    product1,
    product2,
    product3,
    combination_count
FROM
    ranked_combinations
WHERE
    rank = 1
ORDER BY
    month;
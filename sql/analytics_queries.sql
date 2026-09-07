-- ============================================================
-- Big Data Analytics & Predictive Intelligence
-- Analytics Queries — Customer Transactions Database
-- ============================================================

-- 1. Total revenue and transaction count
SELECT
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM customer_transactions;

-- 2. Monthly revenue trend
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    COUNT(*) AS transactions,
    SUM(amount) AS revenue
FROM customer_transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY month;

-- 3. Revenue by product category
SELECT
    category,
    COUNT(*) AS transactions,
    SUM(amount) AS revenue,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM customer_transactions
GROUP BY category
ORDER BY revenue DESC;

-- 4. Top 5 cities by revenue
SELECT
    city,
    SUM(amount) AS revenue,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM customer_transactions
GROUP BY city
ORDER BY revenue DESC
LIMIT 5;

-- 5. Payment method distribution
SELECT
    payment_method,
    COUNT(*) AS transactions,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM customer_transactions), 2) AS pct_of_total
FROM customer_transactions
GROUP BY payment_method
ORDER BY transactions DESC;

-- 6. Customer RFM segmentation (Recency, Frequency, Monetary)
SELECT
    customer_id,
    DATEDIFF((SELECT MAX(transaction_date) FROM customer_transactions) + INTERVAL 1 DAY,
             MAX(transaction_date)) AS recency_days,
    COUNT(*) AS frequency,
    SUM(amount) AS monetary
FROM customer_transactions
GROUP BY customer_id
ORDER BY monetary DESC;

-- 7. Identify likely-churned customers (no purchase in last 180 days)
SELECT
    customer_id,
    MAX(transaction_date) AS last_purchase_date,
    DATEDIFF((SELECT MAX(transaction_date) FROM customer_transactions) + INTERVAL 1 DAY,
             MAX(transaction_date)) AS days_since_last_purchase
FROM customer_transactions
GROUP BY customer_id
HAVING days_since_last_purchase > 180
ORDER BY days_since_last_purchase DESC;

-- 8. Returning vs. new customer revenue contribution
SELECT
    CASE WHEN is_returning_customer = 1 THEN 'Returning' ELSE 'New' END AS customer_type,
    COUNT(*) AS transactions,
    SUM(amount) AS revenue,
    ROUND(100.0 * SUM(amount) / (SELECT SUM(amount) FROM customer_transactions), 2) AS pct_of_revenue
FROM customer_transactions
GROUP BY is_returning_customer;

-- 9. High-value customers (top 10% by total spend)
SELECT customer_id, total_spend FROM (
    SELECT
        customer_id,
        SUM(amount) AS total_spend,
        NTILE(10) OVER (ORDER BY SUM(amount) DESC) AS spend_decile
    FROM customer_transactions
    GROUP BY customer_id
) ranked
WHERE spend_decile = 1
ORDER BY total_spend DESC;

-- 10. Average order value by age group
SELECT
    CASE
        WHEN age < 25 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS transactions,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM customer_transactions
GROUP BY age_group
ORDER BY age_group;

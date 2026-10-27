
-- 1. Overall fraud KPIs
SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 4
    ) AS fraud_rate_pct,
    ROUND(SUM(amount)::numeric, 2) AS total_transaction_value,
    ROUND(
        SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END)::numeric,
        2
    ) AS fraud_value
FROM transactions;


-- 2. Fraud by transaction type
SELECT
    type,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 4
    ) AS fraud_rate_pct,
    ROUND(
        SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END)::numeric,
        2
    ) AS fraud_value
FROM transactions
GROUP BY type
ORDER BY fraud_value DESC;


-- 3. Fraud and exposure by risk category
SELECT
    final_risk_level,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 4
    ) AS fraud_rate_pct,
    ROUND(SUM(amount)::numeric, 2) AS transaction_value,
    ROUND(
        SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END)::numeric,
        2
    ) AS fraud_value
FROM transactions
GROUP BY final_risk_level
ORDER BY
    CASE final_risk_level
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Critical' THEN 4
    END;


-- 4. High-priority transactions for investigation
SELECT
    transaction_id,
    step,
    type,
    amount,
    nameOrig,
    nameDest,
    final_risk_score,
    final_risk_level,
    anomaly_score,
    isFraud
FROM transactions
WHERE final_risk_level IN ('High', 'Critical')
ORDER BY
    CASE final_risk_level
        WHEN 'Critical' THEN 1
        ELSE 2
    END,
    final_risk_score DESC,
    amount DESC
LIMIT 100;


-- Query 5 — Fraud by simulated day

SELECT
    day,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        4
    ) AS fraud_rate_pct,
    ROUND(
        SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END)::numeric,
        2
    ) AS fraud_value
FROM transactions
GROUP BY day
ORDER BY day;

--Query 6 — Fraud by simulated hour


SELECT
    hour,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        4
    ) AS fraud_rate_pct,
    ROUND(
        SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END)::numeric,
        2
    ) AS fraud_value
FROM transactions
GROUP BY hour
ORDER BY hour;

CREATE SCHEMA IF NOT EXISTS finance;
USE finance;
SELECT DATABASE() AS default_schema;
SELECT COUNT(*) AS cc_rows FROM finance.cc_data;
SELECT COUNT(*) AS location_rows FROM finance.location_data;
SELECT COUNT(*) AS total_transactions
FROM finance.cc_data;
SELECT merchant, COUNT(*) AS transaction_count
FROM finance.cc_data
WHERE merchant IS NOT NULL AND TRIM(merchant) <> ''
GROUP BY merchant
ORDER BY transaction_count DESC, merchant ASC
LIMIT 10;
SELECT
    category,
    ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM finance.cc_data
GROUP BY category
ORDER BY avg_transaction_amount DESC;
SELECT
    COUNT(*) AS total_transactions,
    COUNT(CASE WHEN is_fraud = 1 THEN 1 END) AS fraudulent_transactions,
    ROUND(
        100.0 * COUNT(CASE WHEN is_fraud = 1 THEN 1 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS fraudulent_percentage
FROM finance.cc_data;
SELECT
    c.trans_num,
    c.trans_date_trans_time,
    c.merchant,
    l.lat AS latitude,
    l.`long` AS longitude
FROM finance.cc_data AS c
LEFT JOIN finance.location_data AS l
    ON c.trans_num = l.trans_num;
    SHOW COLUMNS FROM finance.location_data;
SHOW COLUMNS FROM finance.cc_data;
SELECT
    c.trans_num,
    c.trans_date_trans_time,
    c.merchant,
    l.lat AS latitude,
    l.`long` AS longitude
FROM finance.cc_data AS c
LEFT JOIN finance.location_data AS l
    ON c.cc_num = l.cc_num;
    SELECT
    COUNT(*) AS total_transactions,
    SUM(
        CASE WHEN EXISTS (
            SELECT 1
            FROM finance.location_data AS l
            WHERE l.cc_num = c.cc_num
              AND l.lat IS NOT NULL
              AND l.`long` IS NOT NULL
        ) THEN 1 ELSE 0 END
    ) AS transactions_with_coordinates
FROM finance.cc_data AS c;
SELECT
    COUNT(*) AS total_transactions,
    COUNT(l.card_number) AS transactions_with_coordinates,
    ROUND(100.0 * COUNT(l.card_number) / NULLIF(COUNT(*), 0), 2)
        AS coverage_pct
FROM finance.cc_data AS c
LEFT JOIN (
    SELECT DISTINCT CAST(TRIM(cc_num) AS CHAR(32)) AS card_number
    FROM finance.location_data_clean
    WHERE lat IS NOT NULL
      AND `long` IS NOT NULL
) AS l
    ON CAST(c.cc_num AS CHAR) = l.card_number;
    SELECT
    COUNT(*) AS rows_imported,
    COUNT(CASE WHEN cc_num IS NULL OR TRIM(cc_num) = '' THEN 1 END)
        AS blank_ids,
    COUNT(CASE WHEN TRIM(cc_num) REGEXP '^[0-9]+$' THEN 1 END)
        AS digit_only_ids,
    COUNT(CASE WHEN TRIM(cc_num) REGEXP '[eE][+-]?[0-9]+$' THEN 1 END)
        AS scientific_notation_ids,
    COUNT(CASE WHEN TRIM(cc_num) REGEXP '^[0-9]+[.]0+$' THEN 1 END)
        AS trailing_decimal_ids
FROM finance.location_data_clean;
SELECT
    c.trans_num,
    c.trans_date_trans_time,
    c.merchant,
    l.lat AS latitude,
    l.`long` AS longitude
FROM finance.cc_data AS c
LEFT JOIN finance.location_data_clean AS l
    ON CAST(c.cc_num AS CHAR) = TRIM(l.cc_num)
   AND TRIM(l.cc_num) REGEXP '^[0-9]+$' ORDER BY (l.lat IS NOT NULL AND l.`long` IS NOT NULL) DESC,
         c.trans_num;
         SELECT DISTINCT city, state, city_pop AS population
FROM finance.cc_data
WHERE city_pop IS NOT NULL
ORDER BY population DESC, city, state
LIMIT 1;
SELECT
    MIN(STR_TO_DATE(LEFT(trans_date_trans_time, 10), '%d-%m-%Y'))
        AS earliest_transaction_date,
    MAX(STR_TO_DATE(LEFT(trans_date_trans_time, 10), '%d-%m-%Y'))
        AS latest_transaction_date
FROM finance.cc_data;
SELECT ROUND(SUM(amt), 2) AS total_amount_spent
FROM finance.cc_data;
SELECT
    MIN(STR_TO_DATE(LEFT(trans_date_trans_time, 10), '%d-%m-%Y'))
        AS earliest_transaction_date,
    MAX(STR_TO_DATE(LEFT(trans_date_trans_time, 10), '%d-%m-%Y'))
        AS latest_transaction_date
FROM finance.cc_data;
SELECT category, COUNT(*) AS transaction_count
FROM finance.cc_data
GROUP BY category
ORDER BY transaction_count DESC, category;
SELECT gender, ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM finance.cc_data
GROUP BY gender
ORDER BY gender;
WITH dated_transactions AS (
    SELECT
        STR_TO_DATE(LEFT(trans_date_trans_time, 10), '%d-%m-%Y')
            AS transaction_date,
        amt
    FROM finance.cc_data
)
SELECT
    DAYNAME(transaction_date) AS day_of_week,
    ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM dated_transactions
WHERE transaction_date IS NOT NULL
GROUP BY DAYNAME(transaction_date)
ORDER BY AVG(amt) DESC, day_of_week
LIMIT 1;
    
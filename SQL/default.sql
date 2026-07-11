SELECT
    region,
    loan_status,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN default_flag = 'Yes' THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
        SUM(CASE WHEN default_flag = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate_percent
FROM {{ ref('stg_loans') }}
GROUP BY region, loan_status
ORDER BY default_rate_percent DESC
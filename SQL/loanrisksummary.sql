SELECT
    region,
    COUNT(*) AS total_loans,
    AVG(loan_amount) AS avg_loan_amount,
    AVG(credit_score) AS avg_credit_score,
    AVG(interest_rate) AS avg_interest_rate,
    AVG(monthly_payment) AS avg_monthly_payment,
    SUM(default_flag) AS total_defaults,
    ROUND(
        (SUM(default_flag) * 100.0) / COUNT(*),
        2
    ) AS default_rate_percent
FROM {{ ref('stg_loans') }}
GROUP BY region
ORDER BY default_rate_percent DESC;
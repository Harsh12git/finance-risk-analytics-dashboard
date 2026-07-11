SELECT
    region,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    SUM(monthly_payment) AS total_monthly_revenue,
    AVG(interest_rate) AS avg_interest_rate
FROM {{ ref('stg_loans') }}
GROUP BY region
ORDER BY total_loan_amount DESC
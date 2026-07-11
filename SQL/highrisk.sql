SELECT
    loan_id,
    customer_id,
    region,
    credit_score,
    loan_amount,
    interest_rate,
    monthly_payment,
    default_flag
FROM {{ ref('stg_loans') }}
WHERE credit_score < 580
   OR default_flag = 'Yes'
ORDER BY loan_amount DESC
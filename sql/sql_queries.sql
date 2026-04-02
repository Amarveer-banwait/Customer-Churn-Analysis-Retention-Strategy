1. Total Customers & Churn Distribution
SELECT COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS retained_customers
FROM customers;

Purpose : Shows overall dataset summary

2. Churn Rate (%)
SELECT 
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS churn_rate_percentage
FROM customers;

Purpose : Most important business KPI

3. Churn by Gender
SELECT gender, Churn, COUNT(*) AS total
FROM customers
GROUP BY gender, Churn
ORDER BY gender;

Purpose : Checks if gender affects churn

4. Churn by Tenure Group
SELECT 
    CASE 
        WHEN tenure < 12 THEN 'New Customers'
        WHEN tenure BETWEEN 12 AND 24 THEN 'Mid-Term Customers'
        ELSE 'Long-Term Customers'
    END AS tenure_group,
    Churn,
    COUNT(*) AS total
FROM customers
GROUP BY tenure_group, Churn
ORDER BY tenure_group;

5. Average Monthly Charges (Churn vs Non-Churn)
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customers
GROUP BY Churn;

Prupose : Shows pricing impact on churn

6. Total Revenue Lost Due to Churn
SELECT 
    ROUND(SUM(MonthlyCharges), 2) AS revenue_lost
FROM customers
WHERE Churn = 'Yes';

Prupose : Business impact

7. Churn by Senior Citizen
SELECT SeniorCitizen, Churn, COUNT(*) AS total
FROM customers
GROUP BY SeniorCitizen, Churn;

Purpose : Segment-based analysis

8. Top High-Risk Customers (High Charges + Low Tenure)
SELECT customerID, tenure, MonthlyCharges, Churn
FROM customers
WHERE tenure < 12 
AND MonthlyCharges > 70
ORDER BY MonthlyCharges DESC;

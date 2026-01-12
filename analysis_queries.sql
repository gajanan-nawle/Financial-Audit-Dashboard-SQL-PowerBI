create database corporate_finance;
use corporate_finance;

create table spending_data (reporting_month varchar(10), department varchar(50), budget_amount INT, actual_spend INT, variance INT, full_date DATE);
select * from spending_data where reporting_month = "apr" and department = "Finance";
-- Converts text like 'Jan' to a real SQL date '2025-01-01'
UPDATE spending_data 
SET full_date = STR_TO_DATE(CONCAT('01-', reporting_month, '-2025'), '%d-%b-%Y');
-- Verify the Audit,This query recalculates the variance and calculates a percentage
SELECT department, reporting_month, budget_amount, actual_spend, ROUND(((actual_spend - budget_amount) / budget_amount) * 100, 2) AS variance_percentage, full_date
FROM spending_data
ORDER BY variance_percentage DESC;


SELECT department, reporting_month, actual_spend, SUM(actual_spend) OVER (PARTITION BY department ORDER BY full_date) AS running_total_spend
FROM spending_data;

SELECT 
    department, 
    COUNT(*) AS months_over_budget,
    SUM(actual_spend - budget_amount) AS total_dollar_overrun,
    ROUND(AVG(((actual_spend - budget_amount) / budget_amount) * 100), 2) AS avg_variance_pct
FROM spending_data
WHERE actual_spend > budget_amount
GROUP BY department
ORDER BY total_dollar_overrun DESC;

CREATE OR REPLACE VIEW Corporate_Budget_Audit AS
SELECT 
    reporting_month,
    full_date,
    department,
    budget_amount,
    actual_spend,
    (actual_spend - budget_amount) AS variance_amount,
    ROUND(((actual_spend - budget_amount) / budget_amount) * 100, 2) AS variance_pct,
    -- MIS Logic: Automated Risk Categorization
    CASE 
        WHEN ((actual_spend - budget_amount) / budget_amount) > 0.15 THEN 'High Risk: Critical Overrun'
        WHEN ((actual_spend - budget_amount) / budget_amount) > 0.05 THEN 'Medium Risk: Watchlist'
        WHEN (actual_spend - budget_amount) <= 0 THEN 'Healthy: Under Budget'
        ELSE 'Low Risk'
    END AS audit_status
FROM spending_data;

SELECT * FROM Corporate_Budget_Audit;
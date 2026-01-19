-- Objective 1: Compare the total expenses of each campaign against its allocated budget. 
-- Objective 2: Identify campaigns that are either over or under budget. For campaigns under budget, display "Within Budget"; for those over budget, display "Over Budget." 
-- Objective 3: Display the following details for each Campaign: Campaign Name, Budget Amount, Total Expenses, Budget Utilization Percentage, Budget Status, Sort the results by Budget Status and Budget Utilization Percentage.

SELECT  c.campaign_name,
        c.budget_amount,
        SUM(e.Expense_Amount) as Total_Expenses,
        ROUND(
            CASE
              WHEN c.Expense_Amount > 0
                THEN (SUM(e.Expense_Amount) / c.Budget_Amount) * 100
              ELSE 0
            END, 2
    ) AS budget_utilization_percentage,
    CASE
        WHEN SUM(e.Expense_Amount) > c.Budget_Amount THEN 'Over Budget'
        WHEN SUM(e.Expense_Amount) = c.Budget_Amount THEN 'On Budget'
        ELSE 'Under Budget'
    END AS budget_status
FROM
  Campaign as c
Join Activity as a on c.campaign_id = a.campaign_id
Join Expenses as e on e.activity_id = a.activity_id
GROUP BY c.campaign_name, c.budget_amount
ORDER BY budget_status, budget_utilization_percentage

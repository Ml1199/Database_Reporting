-- Objective 1: List the Program Names, total expenses, along with their respective start date, end date, Campaign Names, and Activity Names for each Program.

SELECT  c.campaign_name,
        activity_name,
        budget_amount,
        Sum(e.Expense_Amount) as Total_Expenses,
        Round(Sum(e.Expense_Amount/budget_amount), 2) 
                as Budget_Utilization_Percentage,
        CASE when Sum(e.Expense_Amount) > Sum(budget_amount) 
                then 'Over Budget' 
        Else 'Within Budget' end as Budget_Status
FROM Campaign as c
Join Activity as a on a.campaign_id = c.campaign_id
Join Expenses as e on e.activity_id = a.activity_id
Group by activity_name
Order by Budget_Status, Budget_Utilization_Percentage 

-- Objective 2: Calculate the monthly average expenses for each Program.
  
SELECT  c.campaign_name,
         activity_name,
         expense_amount,
         budget_amount
FROM Campaign as c
Join Activity as a on a.campaign_id = c.campaign_id
Join Expenses as e on e.activity_id = a.activity_id
Group by campaign_name
Order by expense_amount desc

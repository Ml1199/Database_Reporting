-- Objective 1: List the Program_ids, Program Names, along with their respective Start date and End date, sort the output result by Start date, then Program Name.
-- Objective 2: List the Program_id and Campaign Name related to each Program, sort the output result by Program_id, then Campaign Name.


SELECT
        Program_Id,
        Program_Name,
        Start_Date,
        End_Date
FROM
        Program
ORDER BY 
        Start_Date, Program_Id



SELECT 
        Program_Id,
        Campaign_Name
FROM
        Campaign
ORDER BY 
        Program_Id,
        Campaign_Name
--

        
SELECT  p.Program_Name, 
        p.Start_Date, 
        p.End_Date, 
        c.Campaign_Name, 
        a.Activity_Name, 
        e.Expense_Amount,
        e.Expense_Date,
        Sum(e.Expense_Amount) as Total_Expenses,
        ROUND(AVG(e.Expense_Amount), 2) as Expenses_By_Month
FROM Program as p
Join Campaign as c on c.program_id = p.program_id
Join Activity as a on a.campaign_id = c.campaign_id
Join Expenses as e on e.activity_id = a.activity_id
Group by c.Campaign_Name 

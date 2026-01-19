-- Objective: Identify the activities with the largest expenses within each campaign.

WITH Activity_Expenses AS (
  SELECT
      c.Campaign_Name,
      a.Activity_Name,
      SUM(e.Expense_Amount)
      as Total_Activity_Expense,
      RANK() OVER (PARTITION BY c.Campaign_Id ORDER BY
      SUM(e.Expense_Amount) DESC
      ) AS Activity_Rank
FROM Campaign as c
JOIN Activity as a on c.Campaign_Id = a.Campaign_Id
JOIN Expenses as e on a.Activity_Id = e.Activity_Id
GROUP BY
  c.Campaign_Name,
  c.Campaign_Id,
  a.Activity_Name
)
SELECT
    Campaign_Name,
    Activity_Name,
    Total_Activity_Expense
FROM
    Activity_Expenses
WHERE
    Activity_Rank = 1
ORDER BY 
    Campaign_Name

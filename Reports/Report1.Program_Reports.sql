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

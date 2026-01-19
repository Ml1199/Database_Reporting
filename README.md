
# Database Reporting Project

## Purpose:
This project focuses on applying database technologies to address real-world business challenges using and building the methods and skills in database management, data analytics, and SQL programming. 


## Project Descirption ##

The marketing department in a company would like to create a Marketing database to store the marketing information that allows business users to generate the reports related to Activities, Campaigns, Programs and Expenses for marketing purpose. 


**High-level Relationships:**
* **Program ↔ Campaign** (one-to-many)
  - A Program can be related to one or more Campaigns, but each Campaign belongs to only one Program.
* **Campaign ↔ Activity** (one-to-many)
  - A Campaign can include many Activities, but each Activity can only be part of one Campaign.
* **Activity ↔ Invoice** (one-to-many)
  - Each Activity may have multiple invoices, but each invoice is related to one specific Activity.
* **Activity ↔ Expenses** (one-to-many)
  - Each Activity can have multiple expenses recorded in **Expenses**.
* **Invoice ↔ Expenses** (one-to-one)
  - Each invoice is associated with an expense recorded in the **Expenses** table.


## Relationship Diagram for the Marketing Schema

<img width="817" height="844" alt="Screenshot 2026-01-18 212028" src="https://github.com/user-attachments/assets/3ab7f27e-b537-4b2d-a07e-151235592d45" />

### The Fact and Dimensions
* **Fact Table:**
  - Central table: **Expenses**
  - Measures: Expense amounts (aggregated from invoices)
  - Keys: Links to dimension tables
* **Dimension Tables:** (for descriptive details: Programs, Campaigns, Activities, and Invoices)
  - **Program**
  - **Campaign**
  - **Activity**
  - **Invoice**

## Action Items:
Review the Marketing schema model, analyze the data, and generate the following reports for the leadership team in the Marketing department:

* **Program Reports:**
  1. List the Program_ids, Program Names, along with their respective Start date and End date, sort the output result by Start date, then Program Name.
  2. List the Program_id and Campaign Name related to each Program, sort the output result by Program_id, then Campaign Name.
* **Program Expense Report:**
  1. List the Program Names, total expenses, along with their respective start date, end date, Campaign Names, and Activity Names for each Program.
  2. Calculate the monthly average expenses for each Program.
* **Campaign Budget Utilization Report:**
  1. Compare the total expenses of each campaign against its allocated budget. 
  2. Identify campaigns that are either over or under budget. For campaigns under budget, display "Within Budget"; for those over budget, display "Over Budget."
  3. Display the following details for each Campaign: 
      - Campaign Name 
      - Budget Amount
      - Total Expenses
      - Budget Utilization Percentage
      - Budget Status
      - Sort the results by Budget Status and Budget Utilization Percentage.
* **High-Cost Activities Report:**
  1. Identify the activities with the largest expense within each campaign.

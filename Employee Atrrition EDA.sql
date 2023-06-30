
-- Objective --

-- Employee attrition is a critical challenge faced by healthcare organizations, as it can lead to increased recruitment and training costs,
-- decreased productivity, and potential impacts on patient care. To address this issue,  To address this issue, I have undertaken a personal 
-- project  to analyze a dataset containing various employee  attributes, including age, gender, job role, job satisfaction, education, 
-- work-life balance, and more. Through a comprehensive analysis of this data using SQL queries, the primary goal is to gain valuable insights 
-- into the drivers of employee attrition.The primary goal is to find insights into the factors contributing to employee turnover and 
-- identify key patterns and trends that can assist the organization in making data-driven decisions to reduce attrition and improve employee retention.


-- Total Employees --

SELECT COUNT(*) AS Total_Employess FROM employee_table;

-- Count of Male Employees --

SELECT SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS male_employees,
COUNT(*) AS total_employees,
(SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS male_employee_rate
FROM employee_table;

-- Count of Female Employees --

SELECT SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS female_employees,
COUNT(*) AS total_employees,
(SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS female_employee_rate
FROM employee_table;

-- Finding total attrition rate --

SELECT SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
COUNT(*) AS total_employees,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attrition_rate
FROM employee_table;

-- Attrition rate by Gender --

SELECT Gender, COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attrition_rate
FROM employee_table
GROUP BY Gender;


-- Average Age of Male and Female employees leaving leaving the Organisation --

SELECT Attrition, Gender, AVG(Age) AS average_age
FROM employee_table
GROUP BY Attrition, Gender;

-- Department having Highest Attrition Rate --

SELECT Department, COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attrition_rate
FROM employee_table
GROUP BY Department
ORDER BY attrition_rate DESC ;

-- Job Role having Highest Attrition Rate --

SELECT JobRole, COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attrition_rate
FROM employee_table
GROUP BY JobRole
ORDER BY attrition_rate DESC ;

-- Job Satisfaction of Employees leaving the Organisation--

SELECT JobSatisfaction, COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attrition_rate
FROM employee_table
GROUP BY JobSatisfaction;

-- Average Monthly Income of  Nurses who attrited --

SELECT AVG(MonthlyIncome) AS AvgMonthlyIncome,
COUNT(*) AS attrited_employees
FROM employee_table
WHERE JobRole = 'Nurse' AND Attrition = 'Yes';

-- Average Monthly Income of Employees by Job Role--

SELECT JobRole, AVG(MonthlyIncome) AS average_monthly_income
FROM employee_table
GROUP BY JobRole;

-- Attrition Rate by Business Travel --

SELECT BusinessTravel, COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attrition_rate
FROM employee_table
GROUP BY BusinessTravel
ORDER BY attrition_rate DESC ;

-- Attrition Rate by Education Field --

SELECT EducationField, COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM employee_table
GROUP BY EducationField
ORDER BY AttritionRate DESC;

-- Attrition Rate by Work Life Balance --

SELECT WorkLifeBalance, COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM employee_table
GROUP BY WorkLifeBalance;

-- Atrrition Rate of Employees by Gender and Age Group --

SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS AgeGroup,
    Gender, COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM employee_table
GROUP BY AgeGroup, Gender;

-- Average Years Employee worked in the Organization before leaving --
SELECT JobRole,
       AVG(YearsAtCompany) AS AvgYearsBeforeLeaving
FROM employee_table
WHERE Attrition = 'Yes'
GROUP BY JobRole;

-- Average , Max and Min Years Since Last Promotion by Shift--

SELECT AVG(YearsSinceLastPromotion) AS AverageYearsSinceLastPromotion, Shift, MAX(YearsSinceLastPromotion), MIN(YearsSinceLastPromotion)
FROM employee_table
GROUP BY Shift;

-- Average Distance from Home by Job Role --

SELECT JobRole, 
       AVG(DistanceFromHome) AS AvgDistanceFromHome,
       COUNT(*) AS Total_Employees
FROM employee_table
GROUP BY JobRole;

-- Attrition Rate by Shift --

SELECT Shift,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM employee_table
GROUP BY Shift;

-- Findings From the Data -- 

-- 1) Female employees have a higher attrition rate that is 12.68 % compared to Male employees (11.32 %) 
-- 2) Dissatisfied employees have attrition rate of 15.80%, Most likely they leave with an average monthly income of approx $4020.
-- 3) The Cardiology Department has the highest attrition rate (13.93%), followed by Maternity (12.31%) and Neurology (7.73%).
-- 4) Employees who travel frequently have a higher attrition rate of 17.81%.
-- 5) Employees categorized as 'other' in job roles have the highest attrition rate (16.29%), followed by Nurses (13.02%).
-- 6) Nurses who left the organization had an average salary of approximately $4557 and worked for an average of 3.8 years. Distance from 
--   home, which is highest for Nurses (9.73 KM) on average, may be a contributing factor to their attrition.
-- 7) Employees with an HR Education Field have the highest attrition rate (20.69%), followed by Marketing and Technical Education 
-- Fields at approximately 14%.
-- 8) Employess with poor Work Life Balance have atrrition rate of 26.67%
-- 9) The highest attrition rate for both male and female employees is observed in the age group of 18-25, at 29.34% and 48.9%, respectively.
-- 10) The Shift-O has the maximum attrition rate, with an average of 2.08 years since the last promotion for this shift.
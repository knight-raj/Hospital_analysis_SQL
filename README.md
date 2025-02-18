Hospital Records Management System
This project is a comprehensive Hospital Records Management System designed to manage and analyze hospital data efficiently. The system is built using SQL and focuses on handling various aspects of hospital operations, including patient counts, doctor counts, medical expenses, and more. The project includes a series of SQL queries to extract meaningful insights from the hospital data.

Table of Contents
Project Overview

Database Schema

Data Import

SQL Queries

1. Total Number of Patients

2. Average Number of Doctors per Hospital

3. Top 3 Departments with the Highest Number of Patients

4. Hospital with the Maximum Medical Expenses

5. Daily Average Medical Expenses

6. Longest Hospital Stay

7. Total Patients Treated Per City

8. Average Length of Stay Per Department

9. Identify the Department with the Lowest Number of Patients

10. Monthly Medical Expenses Report

Usage

Contributing

License

Project Overview
The Hospital Records Management System is designed to manage and analyze hospital data. The system includes a database schema for storing hospital records and a series of SQL queries to extract useful information from the data. The project aims to provide insights into hospital operations, such as patient counts, doctor counts, medical expenses, and more.

Database Schema
The database schema for the Hospital Records Management System is as follows:

sql
Copy
CREATE TABLE Hospital_Records(
    Hospital_Name VARCHAR(50),
    Location VARCHAR(50),
    Department VARCHAR(50),
    Doctors_Count INT,
    Patients_Count INT,
    Admission_Date DATE,
    Discharge_Date DATE,
    Medical_Expenses FLOAT
);
Data Import
To import data into the Hospital_Records table from a CSV file, use the following SQL command:

sql
Copy
COPY Hospital_Records(Hospital_Name, Location, Department, Doctors_Count, Patients_Count, Admission_Date, Discharge_Date, Medical_Expenses)
FROM 'C:\Users\HP\OneDrive\Desktop\Mix_Folder\DATA\Hospital_Data1.csv'
CSV HEADER;
SQL Queries
1. Total Number of Patients
sql
Copy
SELECT SUM(Patients_Count) FROM Hospital_Records;
Purpose: Calculates the total number of patients across all hospitals and departments.

Explanation:

SUM(Patients_Count) aggregates the Patients_Count column to provide the total number of patients.

It gives an overall idea of the patient load handled by all hospitals in the dataset.

2. Average Number of Doctors per Hospital
sql
Copy
SELECT AVG(Doctors_Count)::NUMERIC(10) FROM Hospital_Records;
Purpose: Calculates the average number of doctors working in each hospital.

Explanation:

AVG(Doctors_Count) computes the average value of the Doctors_Count column.

::NUMERIC(10) ensures the result is formatted as a numeric value with up to 10 digits.

This helps understand the average staffing level of doctors across hospitals.

3. Top 3 Departments with the Highest Number of Patients
sql
Copy
SELECT Department, Patients_Count FROM Hospital_Records
ORDER BY Patients_Count DESC
LIMIT 3;
Purpose: Identifies the top 3 departments with the highest patient counts.

Explanation:

ORDER BY Patients_Count DESC sorts the departments in descending order based on the number of patients.

LIMIT 3 restricts the output to the top 3 departments.

This helps identify which departments are the busiest.

4. Hospital with the Maximum Medical Expenses
sql
Copy
SELECT Hospital_Name, Medical_Expenses FROM Hospital_Records
ORDER BY Medical_Expenses DESC
LIMIT 3;
Purpose: Finds the hospitals with the highest medical expenses.

Explanation:

ORDER BY Medical_Expenses DESC sorts the hospitals in descending order based on medical expenses.

LIMIT 3 restricts the output to the top 3 hospitals.

This helps identify hospitals with the highest financial burden.

5. Daily Average Medical Expenses
sql
Copy
SELECT 
    Hospital_Name,
    Admission_Date,
    Discharge_Date,
    Medical_Expenses,
    (Discharge_Date - Admission_Date) + 1 AS Total_Days,
    Medical_Expenses / ((Discharge_Date - Admission_Date) + 1) AS Daily_Avg_Expenses
FROM Hospital_Records;
Purpose: Calculates the daily average medical expenses for each hospital stay.

Explanation:

(Discharge_Date - Admission_Date) + 1 calculates the total number of days a patient stayed in the hospital.

Medical_Expenses / Total_Days computes the average daily expense.

This helps analyze the cost efficiency of hospital stays.

6. Longest Hospital Stay
sql
Copy
SELECT 
    Hospital_Name,
    Admission_Date,
    Discharge_Date,
    (Discharge_Date - Admission_Date) + 1 AS Stay_Duration_Days
FROM Hospital_Records
ORDER BY Stay_Duration_Days DESC
LIMIT 1;
Purpose: Identifies the hospital stay with the longest duration.

Explanation:

(Discharge_Date - Admission_Date) + 1 calculates the total duration of the stay in days.

ORDER BY Stay_Duration_Days DESC sorts the results in descending order.

LIMIT 1 returns the longest stay.

This helps identify outliers or cases requiring extended care.

7. Total Patients Treated Per City
sql
Copy
SELECT 
    Location AS City,
    SUM(Patients_Count) AS Total_Patients_Treated
FROM Hospital_Records
GROUP BY Location
ORDER BY Total_Patients_Treated DESC;
Purpose: Calculates the total number of patients treated in each city.

Explanation:

GROUP BY Location groups the data by city.

SUM(Patients_Count) calculates the total number of patients per city.

ORDER BY Total_Patients_Treated DESC sorts the cities by patient count in descending order.

This helps identify which cities have the highest patient load.

8. Average Length of Stay Per Department
sql
Copy
SELECT 
    Department,
    ROUND(AVG((Discharge_Date - Admission_Date) + 1), 2) AS Avg_Length_of_Stay_Days
FROM Hospital_Records
GROUP BY Department
ORDER BY Avg_Length_of_Stay_Days DESC;
Purpose: Calculates the average length of stay for patients in each department.

Explanation:

(Discharge_Date - Admission_Date) + 1 calculates the duration of each stay.

AVG() computes the average stay duration for each department.

ROUND(..., 2) rounds the result to 2 decimal places.

GROUP BY Department groups the data by department.

This helps identify departments with longer or shorter patient stays.

9. Identify the Department with the Lowest Number of Patients
sql
Copy
SELECT 
    Department,
    SUM(Patients_Count) AS Total_Patients
FROM Hospital_Records
GROUP BY Department
ORDER BY Total_Patients ASC
LIMIT 1;
Purpose: Identifies the department with the lowest patient count.

Explanation:

SUM(Patients_Count) calculates the total number of patients per department.

GROUP BY Department groups the data by department.

ORDER BY Total_Patients ASC sorts the departments in ascending order of patient count.

LIMIT 1 returns the department with the lowest patient count.

This helps identify underutilized departments.

10. Monthly Medical Expenses Report
sql
Copy
SELECT 
    TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_Records
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
ORDER BY Month;
Purpose: Generates a monthly report of total medical expenses.

Explanation:

TO_CHAR(Admission_Date, 'YYYY-MM') extracts the year and month from the Admission_Date.

SUM(Medical_Expenses) calculates the total expenses for each month.

GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM') groups the data by month.

ORDER BY Month sorts the results chronologically.

This helps track monthly financial trends.

Usage
To use this project, follow these steps:

Clone the Repository: Clone this repository to your local machine.

Set Up the Database: Create the Hospital_Records table in your SQL database using the provided schema.

Import Data: Import the hospital data from the CSV file using the provided COPY command.

Run Queries: Execute the SQL queries to analyze the hospital data.

Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Feel free to explore the project and contribute! 🚀

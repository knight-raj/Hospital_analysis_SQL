# Hospital Records Management System

This project is a comprehensive Hospital Records Management System designed to manage and analyze hospital data efficiently. The system is built using SQL and focuses on handling various aspects of hospital operations, including patient counts, doctor counts, medical expenses, and more. The project includes a series of SQL queries to extract meaningful insights from the hospital data.

## Table of Contents
- [Project Overview](#project-overview)
- [Database Schema](#database-schema)
- [Data Import](#data-import)
- [SQL Queries](#sql-queries)
  1. [Total Number of Patients](#1-total-number-of-patients)
  2. [Average Number of Doctors per Hospital](#2-average-number-of-doctors-per-hospital)
  3. [Top 3 Departments with the Highest Number of Patients](#3-top-3-departments-with-the-highest-number-of-patients)
  4. [Hospital with the Maximum Medical Expenses](#4-hospital-with-the-maximum-medical-expenses)
  5. [Daily Average Medical Expenses](#5-daily-average-medical-expenses)
  6. [Longest Hospital Stay](#6-longest-hospital-stay)
  7. [Total Patients Treated Per City](#7-total-patients-treated-per-city)
  8. [Average Length of Stay Per Department](#8-average-length-of-stay-per-department)
  9. [Identify the Department with the Lowest Number of Patients](#9-identify-the-department-with-the-lowest-number-of-patients)
  10. [Monthly Medical Expenses Report](#10-monthly-medical-expenses-report)
- [Usage](#usage)

## Project Overview
The Hospital Records Management System is designed to manage and analyze hospital data. The system includes a database schema for storing hospital records and a series of SQL queries to extract useful information from the data. The project aims to provide insights into hospital operations, such as patient counts, doctor counts, medical expenses, and more.

## Database Schema
```sql
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
```

## Data Import
To import data into the `Hospital_Records` table from a CSV file, use the following SQL command:
```sql
COPY Hospital_Records(Hospital_Name, Location, Department, Doctors_Count, Patients_Count, Admission_Date, Discharge_Date, Medical_Expenses)
FROM 'C:\\Users\\HP\\OneDrive\\Desktop\\Mix_Folder\\DATA\\Hospital_Data1.csv'
CSV HEADER;
```

## SQL Queries
### 1. Total Number of Patients
```sql
SELECT SUM(Patients_Count) FROM Hospital_Records;
```
Calculates the total number of patients across all hospitals and departments.<br>
Purpose: Calculates the total number of patients across all hospitals and departments. <br>

####Explanation:
<li>SUM(Patients_Count) aggregates the Patients_Count column to provide the total number of patients.</li>
</li>It gives an overall idea of the patient load handled by all hospitals in the dataset.</li>

### 2. Average Number of Doctors per Hospital
```sql
SELECT AVG(Doctors_Count)::NUMERIC(10) FROM Hospital_Records;
```
Calculates the average number of doctors working in each hospital.

### 3. Top 3 Departments with the Highest Number of Patients
```sql
SELECT Department, Patients_Count FROM Hospital_Records
ORDER BY Patients_Count DESC
LIMIT 3;
```
Identifies the top 3 departments with the highest patient counts.

### 4. Hospital with the Maximum Medical Expenses
```sql
SELECT Hospital_Name, Medical_Expenses FROM Hospital_Records
ORDER BY Medical_Expenses DESC
LIMIT 3;
```
Finds the hospitals with the highest medical expenses.

### 5. Daily Average Medical Expenses
```sql
SELECT 
    Hospital_Name,
    Admission_Date,
    Discharge_Date,
    Medical_Expenses,
    (Discharge_Date - Admission_Date) + 1 AS Total_Days,
    Medical_Expenses / ((Discharge_Date - Admission_Date) + 1) AS Daily_Avg_Expenses
FROM Hospital_Records;
```
Calculates the daily average medical expenses for each hospital stay.

### 6. Longest Hospital Stay
```sql
SELECT 
    Hospital_Name,
    Admission_Date,
    Discharge_Date,
    (Discharge_Date - Admission_Date) + 1 AS Stay_Duration_Days
FROM Hospital_Records
ORDER BY Stay_Duration_Days DESC
LIMIT 1;
```
Identifies the hospital stay with the longest duration.

### 7. Total Patients Treated Per City
```sql
SELECT 
    Location AS City,
    SUM(Patients_Count) AS Total_Patients_Treated
FROM Hospital_Records
GROUP BY Location
ORDER BY Total_Patients_Treated DESC;
```
Calculates the total number of patients treated in each city.

### 8. Average Length of Stay Per Department
```sql
SELECT 
    Department,
    ROUND(AVG((Discharge_Date - Admission_Date) + 1), 2) AS Avg_Length_of_Stay_Days
FROM Hospital_Records
GROUP BY Department
ORDER BY Avg_Length_of_Stay_Days DESC;
```
Calculates the average length of stay for patients in each department.

### 9. Identify the Department with the Lowest Number of Patients
```sql
SELECT 
    Department,
    SUM(Patients_Count) AS Total_Patients
FROM Hospital_Records
GROUP BY Department
ORDER BY Total_Patients ASC
LIMIT 1;
```
Identifies the department with the lowest patient count.

### 10. Monthly Medical Expenses Report
```sql
SELECT 
    TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_Records
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
ORDER BY Month;
```
Generates a monthly report of total medical expenses.


<h1>Hospital Records Management System</h1>

This project is a comprehensive Hospital Records Management System designed to manage and analyze hospital data efficiently. The system is built using SQL and focuses on handling various aspects of hospital operations, including patient counts, doctor counts, medical expenses, and more. The project includes a series of SQL queries to extract meaningful insights from the hospital data.

<h3>Table of Contents</h3>
1. Project Overview
2. Database Schema
3. Data Import
4. SQL Queries
5. Usage

Database Schema
The database schema for the Hospital Records Management System is as follows:

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

COPY Hospital_Records(Hospital_Name, Location, Department, Doctors_Count, Patients_Count, Admission_Date, Discharge_Date, Medical_Expenses)
FROM 'C:\Users\HP\OneDrive\Desktop\Mix_Folder\DATA\Hospital_Data1.csv'
CSV HEADER;

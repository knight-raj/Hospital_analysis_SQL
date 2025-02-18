CREATE TABLE Hospital_Records(
	Hospital_Name VARCHAR(50),
	Location VARCHAR(50),
	Department VARCHAR(50),
	Doctors_Count INT,
	Patients_Count INT,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses FLOAT

)

SELECT * FROM Hospital_Records;



COPY Hospital_Records(Hospital_Name, Location, Department, Doctors_Count, Patients_Count, Admission_Date, Discharge_Date, Medical_Expenses)
FROM 'C:\Users\HP\OneDrive\Desktop\Mix_Folder\DATA\Hospital_Data1.csv'
CSV HEADER;


-- 1. Total Number of Patients
SELECT SUM(Patients_Count) FROM Hospital_Records;

-- 2. Average Number of Doctors per Hospital
SELECT AVG(Doctors_Count)::NUMERIC(10) FROM Hospital_Records;

-- 3. Top 3 Departments with the Highest Number of Patients
SELECT Department, Patients_Count FROM Hospital_Records
ORDER BY Patients_Count DESC
LIMIT 3;

-- 4. Hospital with the Maximum Medical Expenses
SELECT Hospital_Name, Medical_Expenses FROM Hospital_Records
ORDER BY Medical_Expenses DESC
LIMIT 3;

WITH RankedExpenses AS (
    SELECT 
        Hospital_Name, 
        Medical_Expenses,
        ROW_NUMBER() OVER (ORDER BY Medical_Expenses DESC) AS rn
    FROM Hospital_Records
)
SELECT Hospital_Name, Medical_Expenses
FROM RankedExpenses
WHERE rn = 3;

--If there are multiple rows with the same maximum Medical_Expenses, you can use RANK() instead of ROW_NUMBER() to handle ties:
WITH RankedExpenses AS (
    SELECT 
        Hospital_Name, 
        Medical_Expenses,
        RANK() OVER (ORDER BY Medical_Expenses DESC) AS rnk
    FROM Hospital_Records
)
SELECT Hospital_Name, Medical_Expenses
FROM RankedExpenses
WHERE rnk = 3;

--5.  Daily Average Medical Expenses
SELECT 
    Hospital_Name,
    Admission_Date,
    Discharge_Date,
    Medical_Expenses,
    -- Calculate the number of days between admission and discharge
    (Discharge_Date - Admission_Date) + 1 AS Total_Days,
    -- Calculate daily average medical expenses
    Medical_Expenses / ((Discharge_Date - Admission_Date) + 1) AS Daily_Avg_Expenses
FROM Hospital_Records;

-- 6.  Longest Hospital Stay
SELECT 
    Hospital_Name,
    Admission_Date,
    Discharge_Date,
    (Discharge_Date - Admission_Date) + 1 AS Stay_Duration_Days
FROM Hospital_Records
ORDER BY Stay_Duration_Days DESC
LIMIT 1;

-- 7. Total Patients Treated Per City

SELECT 
    Location AS City,
    SUM(Patients_Count) AS Total_Patients_Treated
FROM Hospital_Records
GROUP BY Location
ORDER BY Total_Patients_Treated DESC;

 -- 8. Average Length of Stay Per Department

SELECT 
    Department,
    AVG((Discharge_Date - Admission_Date) + 1) AS Avg_Length_of_Stay_Days
FROM Hospital_Records
GROUP BY Department
ORDER BY Avg_Length_of_Stay_Days DESC;

SELECT 
    Department,
    ROUND(AVG((Discharge_Date - Admission_Date) + 1), 2) AS Avg_Length_of_Stay_Days
FROM Hospital_Records
GROUP BY Department
ORDER BY Avg_Length_of_Stay_Days DESC;

-- 9.Identify the Department with the Lowest Number of Patients
SELECT 
    Department,
    SUM(Patients_Count) AS Total_Patients
FROM Hospital_Records
GROUP BY Department
ORDER BY Total_Patients ASC
LIMIT 1;

--10. Monthly Medical Expenses Report
SELECT 
    TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_Records
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
ORDER BY Month;
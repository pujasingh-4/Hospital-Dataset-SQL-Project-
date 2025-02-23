--Hospital_Data SQL Project

-- create database
CREATE DATABASE Hospital_data;

--CREATE TABLE Hospital

CREATE TABLE hospital
(Hospital_Name VARCHAR(100),
Location VARCHAR(100),
Department VARCHAR(100),
Doctors_Count INT,
Patients_Count INT,
Admission_Date DATE,
Discharge_Date DATE,
Medical_Expenses NUMERIC(10,2));

--import data 

SELECT * FROM hospital;

-- 1. Write a query to find the total number of patients across all hospitals?
 
SELECT SUM (patients_count) AS total_patients FROM hospital;

-- 2. Retrieve the average count of doctors available in each hospital?

SELECT ROUND(AVG(doctors_count),2),hospital_name FROM hospital
GROUP BY hospital_name;

-- 3. Find the top 3 hospital departments that have the highest number of patients?

SELECT SUM(patients_count) AS sum_of_patients, department FROM hospital
GROUP BY department
ORDER BY sum_of_patients DESC
LIMIT 3;

-- 4. Identify the hospital that recorded the highest medical expenses?

SELECT MAX (medical_expenses) AS higest_medical_expenses, hospital_name FROM hospital
GROUP BY hospital_name
ORDER BY higest_medical_expenses DESC
LIMIT 1;

-- 5. Calculate  the average medical expenses per day for each hospital?

SELECT ROUND (AVG (medical_expenses),2) AS avg_expenses, hospital_name FROM hospital
GROUP BY hospital_name;

-- 6. Find the patient with the longest stay by calculating the difference between
--Discharge_Date and Admission_Date.

SELECT MAX (discharge_date-admission_date) AS longest_stay,department FROM hospital
GROUP BY department
ORDER BY longest_stay DESC;

-- 7.. Count the total number of patients treated in each city.

SELECT SUM (patients_count) AS total_number_patients, location FROM hospital
GROUP BY location;

--8.Calculate the average number of days patients spend in each department.

SELECT ROUND (AVG (discharge_date-admission_date),2) AS
avg_day_spend, department FROM hospital
GROUP BY department;

--9. Find the department with the least number of patients.

SELECT SUM (patients_count) AS patients_count, department FROM hospital
GROUP BY department
ORDER BY patients_count ASC
LIMIT 1;











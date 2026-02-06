CREATE DATABASE customer_churn_db;
USE customer_churn_db;
-- Creating Demographics Table
CREATE TABLE demographics (
    CustomerID VARCHAR(50) PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    Under_30 VARCHAR(5),
    Senior_Citizen VARCHAR(5),
    Married VARCHAR(5),
    Dependents VARCHAR(5),
    Number_of_Dependents INT
);
-- Creating Location Table
CREATE TABLE location (
    CustomerID VARCHAR(50),
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    Zip_Code INT,
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    PRIMARY KEY (CustomerID)
);
-- Creating Population
CREATE TABLE population (
    Zip_Code INT PRIMARY KEY,
    Population INT
);
-- Creating Services Table
CREATE TABLE services (
    CustomerID VARCHAR(50),
    Phone_Service VARCHAR(10),
    Multiple_Lines VARCHAR(20),
    Internet_Service VARCHAR(20),
    Internet_Type VARCHAR(30),
    Avg_Monthly_GB_Download INT,
    Online_Security VARCHAR(20),
    Online_Backup VARCHAR(20),
    Device_Protection_Plan VARCHAR(20),
    Premium_Tech_Support VARCHAR(20),
    Streaming_TV VARCHAR(20),
    Streaming_Movies VARCHAR(20),
    Streaming_Music VARCHAR(20),
    Unlimited_Data VARCHAR(20),
    Contract VARCHAR(30),
    Monthly_Charge DECIMAL(10,2),
    Total_Charges DECIMAL(10,2),
    Total_Extra_Data_Charges DECIMAL(10,2),
    Total_Long_Distance_Charges DECIMAL(10,2),
    PRIMARY KEY (CustomerID)
);
-- Creating Status Table
CREATE TABLE status (
    CustomerID VARCHAR(50),
    Customer_Status VARCHAR(20),
    Churn_Label VARCHAR(5),
    Churn_Score INT,
    Churn_Category VARCHAR(50),
    Churn_Reason VARCHAR(100),
    Satisfaction_Score INT,
    CLTV DECIMAL(10,2),
    PRIMARY KEY (CustomerID)
);
-- Checking if table is imported successfully
USE customer_churn_db;
SELECT COUNT(*) FROM demographics;
SELECT COUNT(*) FROM population;
SELECT COUNT(*) FROM location;
SELECT COUNT(*) FROM services;
SELECT COUNT(*) FROM status;
-- Creating LEFT JOIN for demographics,location,services,status tables based on CustomerId
SELECT
    d.CustomerID,
    d.Gender,
    d.Age,
    l.City,
    l.State,
    s.Internet_Service,
    s.Contract,
    st.Customer_Status,
    st.Churn_Reason
FROM demographics d
LEFT JOIN location l ON d.CustomerID = l.CustomerID
LEFT JOIN services s ON d.CustomerID = s.CustomerID
LEFT JOIN status st ON d.CustomerID = st.CustomerID;
-- Finding Total Customers
SELECT COUNT(*) AS Total_Customers
FROM demographics;
-- Churned vs Active Customers
SELECT
    Customer_Status,
    COUNT(*) AS Customer_Count
FROM status
GROUP BY Customer_Status;
-- Finding Churn Rate
SELECT
    ROUND(
        SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END)
        / COUNT(*) * 100, 2
    ) AS Churn_Rate_Percentage
FROM status;
-- Churn by Contract Type
SELECT
    s.Contract,
    COUNT(*) AS Churned_Customers
FROM services s
JOIN status st ON s.CustomerID = st.CustomerID
WHERE st.Customer_Status = 'Churned'
GROUP BY s.Contract
ORDER BY Churned_Customers DESC;
-- Churn by Internet Service
SELECT
    s.Internet_Service,
    COUNT(*) AS Churn_Count
FROM services s
JOIN status st ON s.CustomerID = st.CustomerID
WHERE st.Customer_Status = 'Churned'
GROUP BY s.Internet_Service;
-- Age_Wise Churn
SELECT
    d.Under_30,
    d.Senior_Citizen,
    COUNT(*) AS Churn_Count
FROM demographics d
JOIN status st ON d.CustomerID = st.CustomerID
WHERE st.Customer_Status = 'Churned'
GROUP BY d.Under_30, d.Senior_Citizen;
-- Finding High_Risk Cities and joining Population Table
SELECT
    l.City,
    p.Population,
    COUNT(*) AS Churned_Customers
FROM status st
JOIN location l ON st.CustomerID = l.CustomerID
JOIN population p ON l.Zip_Code = p.Zip_Code
WHERE st.Customer_Status = 'Churned'
GROUP BY l.City, p.Population
ORDER BY Churned_Customers DESC;
-- Revenue Lost due to Churn
SELECT
    ROUND(SUM(s.Monthly_Charge), 2) AS Monthly_Revenue_Lost
FROM services s
JOIN status st ON s.CustomerID = st.CustomerID
WHERE st.Customer_Status = 'Churned';

-- Creating Analysis View for Importing into Power Bi 
CREATE VIEW churn_analysis_view AS
SELECT
    d.CustomerID,
    d.Gender,
    d.Age,
    l.City,
    s.Contract,
    s.Internet_Service,
    st.Customer_Status,
    st.Churn_Reason,
    s.Monthly_Charge,
    st.CLTV
FROM demographics d
JOIN location l ON d.CustomerID = l.CustomerID
JOIN services s ON d.CustomerID = s.CustomerID
JOIN status st ON d.CustomerID = st.CustomerID;





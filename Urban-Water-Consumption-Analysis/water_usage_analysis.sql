CREATE DATABASE water_project;
USE water_project;
CREATE TABLE water_usage (
    household_id INT,
    household_size INT,
    tariff_slab VARCHAR(5),
    district VARCHAR(20),
    date DATE,
    temperature_c DECIMAL(5,2),
    rain_mm DECIMAL(5,2),
    kitchen_liters DECIMAL(10,2),
    bathroom_liters DECIMAL(10,2),
    laundry_liters DECIMAL(10,2),
    leak_probability DECIMAL(4,2),
    total_usage DECIMAL(10,2),
    per_capita_usage DECIMAL(10,2),
    leak_flag VARCHAR(20),
    efficiency_index VARCHAR(20)
);
SELECT * FROM water_usage LIMIT 10;
SELECT date,
       SUM(total_usage) AS daily_consumption
FROM water_usage
GROUP BY date
ORDER BY date;
SELECT district,
       ROUND(AVG(total_usage),2) AS avg_daily_usage
FROM water_usage
GROUP BY district;
SELECT household_id, date, leak_probability
FROM water_usage
WHERE leak_probability > 0.05;
SHOW COLUMNS FROM water_usage;
ALTER TABLE water_usage
CHANGE `ï»¿household_id` household_id BIGINT;
SELECT household_id, date, leak_probability
FROM water_usage
WHERE leak_probability > 0.05;
SELECT household_id,
       date,
       total_usage,
       RANK() OVER (PARTITION BY date ORDER BY total_usage DESC) AS usage_rank
FROM water_usage;
SELECT efficiency_index,
       COUNT(*) AS household_days
FROM water_usage
GROUP BY efficiency_index;
SELECT household_id,
       ROUND(AVG(per_capita_usage),2) AS avg_per_capita_usage
FROM water_usage
GROUP BY household_id
ORDER BY avg_per_capita_usage DESC;
SELECT * FROM water_usage;

SHOW tables;
SELECT * FROM water_usage LIMIT 10;






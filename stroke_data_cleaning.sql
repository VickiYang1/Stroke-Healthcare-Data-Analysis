# copying table in case any mistakes are made
CREATE TABLE stroke_data AS
SELECT *  FROM `healthcare-dataset-stroke-data`;

# first viewing the data
SELECT *
FROM stroke_data;

#organizing the ids 
SELECT *
FROM  stroke_data
ORDER BY id ASC;

# no duplicates found
SELECT id, COUNT(*)
FROM stroke_data
GROUP BY id
HAVING COUNT(*)>1;

SELECT BMI, COUNT(*) 
FROM stroke_data
GROUP BY BMI;

UPDATE stroke_data
SET BMI = NULL
WHERE BMI = "N/A";

SELECT smoking_status, COUNT(*)
FROM stroke_data
GROUP BY smoking_status;

#check for outliers 
SELECT * 
FROM stroke_data 
WHERE age < 0 OR age > 120;

SELECT * 
FROM stroke_data 
WHERE BMI <= 0 OR BMI > 80;

SELECT * 
FROM stroke_data 
WHERE avg_glucose_level < 40 OR avg_glucose_level > 300;

#check category inputs
SELECT 
    GROUP_CONCAT(DISTINCT gender) AS gender_values,
    GROUP_CONCAT(DISTINCT hypertension) AS hypertension_values,
    GROUP_CONCAT(DISTINCT heart_disease) AS disease_values,
    GROUP_CONCAT(DISTINCT ever_married) AS married_values,
    GROUP_CONCAT(DISTINCT work_type) AS work_values,
    GROUP_CONCAT(DISTINCT Residence_type) AS residence_values,
    GROUP_CONCAT(DISTINCT smoking_status) AS smoking_values,
    GROUP_CONCAT(DISTINCT stroke) AS stroke_values
FROM stroke_data;

SELECT 
    COUNT(DISTINCT gender) AS gender_count,
    COUNT(DISTINCT hypertension) AS hypertension_count,
    COUNT(DISTINCT heart_disease) AS disease_count,
    COUNT(DISTINCT ever_married) AS married_count,
    COUNT(DISTINCT work_type) AS work_count,
    COUNT(DISTINCT Residence_type) AS residence_count,
    COUNT(DISTINCT smoking_status) AS smoking_count,
    COUNT(DISTINCT stroke) AS stroke_count
FROM stroke_data;

CREATE TABLE stroke_data_clean AS
SELECT * FROM stroke_data;
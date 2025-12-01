SELECT *
FROM stroke_data;

#what percent of people in the dataset had strokes?
SELECT 
	(SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS stroke_percent,
	(SUM(CASE WHEN stroke = 0 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS no_stroke_percent
FROM stroke_data;

#which gender experienced a stroke more? (female)
SELECT gender, COUNT(*)
FROM stroke_data
WHERE stroke = 1
GROUP BY gender;

#at what age range were strokes most prevelant? (age > 50)
SELECT age_groups, 
SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END)AS stroke_count
FROM (
	SELECT
		CASE
			WHEN age < 1 THEN "age < 1"
			WHEN age between 1 AND 20 THEN "1<= age <= 20"
			WHEN age between 21 AND 50 THEN "21<= age <= 50"
			WHEN age > 50 THEN "age > 50"
		END AS age_groups, stroke
	FROM stroke_data
) AS sub
GROUP BY age_groups;

#how many people who had strokes, has hypertension?  (no hypertension)
SELECT hypertension, COUNT(*)
FROM stroke_data
WHERE stroke = 1
GROUP BY hypertension;

#how many people who had strokes, have heart disease? (no heart disease)
SELECT heart_disease, COUNT(*)
FROM stroke_data
WHERE stroke = 1
GROUP BY heart_disease;

#what range of glucose levels were strokes more prevelant? (50 <= AGL <= 100)
SELECT glucose_groups,
SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count
FROM(
	SELECT
		CASE
			WHEN avg_glucose_level BETWEEN 50 AND 100 THEN "50 <= AGL <= 100"
            WHEN avg_glucose_level BETWEEN 101 AND 150 THEN "101 <= AGL <= 150"
            WHEN avg_glucose_level BETWEEN 151 AND 200 THEN "151 <= AGL <= 200"
            WHEN avg_glucose_level > 200 THEN "AGL > 200"
            ELSE 'other/NULL'
		END AS glucose_groups, stroke
	FROM stroke_data
) AS sub
GROUP BY glucose_groups;

#what range of bmi were strokes more prevelant? (21 <= BMI <= 30)
SELECT BMI_groups,
SUM(CASE WHEN stroke =1 THEN 1 ELSE 0 END) as stroke_count
FROM (
	SELECT
		CASE
			WHEN bmi <10 THEN "BM1 < 10"
            WHEN bmi BETWEEN 11 AND 20 THEN "11 <= BMI <= 20"
            WHEN bmi BETWEEN 21 AND 30 THEN "21 <= BMI <= 30"
            WHEN bmi BETWEEN 31 AND 40 THEN "31 <= BMI <= 40"
            WHEN bmi BETWEEN 41 AND 50 THEN "41 <= BMI <= 50"
            WHEN bmi >50 THEN "BM1 > 50"
			ELSE "other/NULL"
		END AS BMI_groups, stroke
	FROM stroke_data
) AS sub
GROUP BY BMI_groups;

#How many strokes occurred in patients with both obesity and elevated glucose?
SELECT 
	SUM(CASE WHEN bmi>30 AND avg_glucose_level >100 THEN 1 ELSE 0 END) AS obsese_and_elevated_glucose,
    (SUM(CASE WHEN bmi>30 AND avg_glucose_level >100 THEN 1 ELSE 0 END)/COUNT(*)) * 100 AS percentage
FROM stroke_data;

#Of the female patients who had strokes, how many had high bmi or elevated glucose levels?
SELECT 
  SUM(CASE WHEN bmi >= 30 THEN 1 ELSE 0 END) AS high_bmi_count,
  SUM(CASE WHEN avg_glucose_level >= 100 THEN 1 ELSE 0 END) AS high_glucose_count,
  SUM(CASE WHEN bmi >= 30 AND avg_glucose_level >= 100 THEN 1 ELSE 0 END) AS both_count,
  SUM(CASE WHEN bmi < 30 AND avg_glucose_level < 100 THEN 1 ELSE 0 END) AS neither_count,
  SUM(CASE WHEN gender = "Female" AND stroke =1 THEN 1 ELSE 0 END) AS total_female_stroke
FROM stroke_data
WHERE gender = 'Female' AND stroke = 1;

#how many people who had strokes, smoked? (never smoked)
SELECT smoking_groups,
SUM(CASE WHEN stroke =1 THEN 1 ELSE 0 END) as stroke_count
FROM (
	SELECT
		CASE
			WHEN smoking_status = "never smoked" THEN "never smoked"
            WHEN smoking_status = "formerly smoked" THEN "formerly smoked"
            WHEN smoking_status = "smokes" THEN "smokes"
            WHEN smoking_status = "Unknown" THEN "unknown"
		END AS smoking_groups, stroke
	FROM stroke_data
) AS sub
GROUP BY smoking_groups;

# 
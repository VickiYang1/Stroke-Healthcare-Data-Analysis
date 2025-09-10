# Stroke Prediction Dataset Analysis

## Overview
This project uses the [Stroke Prediction Dataset](https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset) from Kaggle, which contains medical and demographic information about patients. The goal of the dataset is to predict whether a patient is likely to have a stroke based on features such as age, gender, BMI, smoking status, glucose level, hypertension, and heart disease.

The dataset is widely used for practicing data cleaning, exploratory data analysis (EDA), and building predictive models in the healthcare domain.

---

## Dataset Information
- **Source:** Kaggle  
- **Rows:** approximately 5,100 patients  
- **Columns include:**  
  - `id` – patient identifier  
  - `gender` – Male, Female, or Other  
  - `age` – age in years  
  - `hypertension` – binary (0 = no, 1 = yes)  
  - `heart_disease` – binary (0 = no, 1 = yes)  
  - `ever_married` – marital status  
  - `work_type` – type of employment  
  - `Residence_type` – Urban or Rural  
  - `avg_glucose_level` – average glucose level in blood  
  - `bmi` – body mass index  
  - `smoking_status` – current smoking status  
  - `stroke` – target variable (1 = patient had a stroke, 0 = did not)

---

## Data Cleaning
Before exploring the data, I performed several cleaning steps:
- Replaced `"N/A"` values in the BMI column with `NULL`.  
- Checked for and confirmed there were no duplicate patient IDs.  
- Reviewed column ranges to identify outliers (age, BMI, glucose).  
- Standardized categorical variables such as smoking status.  

---

## Data Exploration
I explored the dataset to identify key patterns related to stroke prevalence. Some of the questions analyzed include:
- What percentage of patients had a stroke?
- Which gender experienced strokes more frequently?  
- At what age ranges were strokes most prevalent?  
- How many stroke patients also had hypertension or heart disease?  
- What ranges of glucose levels and BMI were most associated with stroke cases?  
- What percentage of stroke patients were smokers, former smokers, or never smoked?
- Of the females who had strokes, how many had high bmi? elevated glucose levels? both? neither?

---

## Next Steps
This project currently focuses on cleaning and exploring the dataset. Future work could include:
- Feature engineering (e.g., grouping continuous variables into risk categories).  
- Building machine learning models to predict stroke occurrence.  
- Comparing different models (logistic regression, decision trees, random forest, etc.) for predictive accuracy.  

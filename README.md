# Stroke Prediction Dataset Analysis

## Overview
This project uses the [Stroke Prediction Dataset](https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset) from **Kaggle**, which contains medical and demographic information about patients. The goal is to identify key risk factors and trends associated with stroke likelihood, focusing on features such as **age**, **gender**, **BMI**, **smoking status**, **glucose level**, **hypertension**, and **heart disease**.

This dataset is widely used for **data cleaning**, **exploratory data analysis (EDA)**, and **predictive modeling** in the healthcare domain.

---

## Dataset Information
- **Source:** Kaggle  
- **Rows:** ~5,100 patients  
- **Columns include:**  
  - `id` – patient identifier  
  - `gender` – Male, Female, or Other  
  - `age` – age in years  
  - `hypertension` – 0 = no, 1 = yes  
  - `heart_disease` – 0 = no, 1 = yes  
  - `ever_married` – marital status  
  - `work_type` – type of employment  
  - `Residence_type` – Urban or Rural  
  - `avg_glucose_level` – average glucose level  
  - `bmi` – body mass index  
  - `smoking_status` – current smoking status  
  - `stroke` – target variable (1 = stroke, 0 = no stroke)

---

## Data Cleaning
To prepare the dataset for analysis:
- Replaced `"N/A"` values in the BMI column with `NULL`.  
- Verified unique `id` values to confirm no duplicates.  
- Reviewed and capped outliers in **age**, **BMI**, and **glucose** columns.  
- Standardized categorical variables such as `smoking_status` for consistency.  

---

## Exploratory Data Analysis (EDA)
Using **SQL** for data querying and **Tableau** for visualization, I explored trends and correlations in stroke prevalence across demographic and medical factors.  

Key questions explored:
- What percentage of patients had a stroke?  
- Which gender and age group had the highest stroke rates?  
- How strongly are hypertension and heart disease correlated with stroke occurrence?  
- How do glucose levels and BMI differ between stroke and non-stroke patients?  
- How does smoking status influence stroke risk?  

---

## Insights and Findings
- **Age and Health:** Stroke risk increased significantly among patients aged 60+, particularly those with both hypertension and heart disease.  
- **Glucose Levels:** Patients with glucose levels above 200 mg/dL had notably higher stroke incidence.  
- **BMI and Lifestyle:** Overweight individuals (BMI > 30) who were current or former smokers exhibited elevated risk factors.  
- **Gender Distribution:** Males showed slightly higher stroke rates overall, but females had higher rates when combined with elevated BMI and glucose levels.  
- **Comorbidity Trends:** Most stroke patients also presented at least one comorbidity (hypertension or heart disease).  

---

## Recommendations and Next Steps
- Perform **feature engineering** to group continuous variables (e.g., age, glucose, BMI) into risk categories.  
- Build predictive models (e.g., **logistic regression**, **decision trees**, **random forest**) to estimate stroke probability.  
- Explore **feature importance** and **model interpretability** to identify actionable healthcare insights.  
- Expand Tableau dashboards to include **interactive filters** by demographic and health attributes.  

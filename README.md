# Stroke Prediction Dataset Analysis

## Overview
This project uses the Stroke Prediction Dataset from Kaggle, containing medical and demographic patient information. The goal is to explore stroke risk factors and build a machine learning model that predicts whether an individual is at risk of experiencing a stroke.

This project demonstrates:
- SQL for data cleaning and data exploration  
- Python for predictive modeling and evaluation  
- Tableau for interactive visualization  

---

## Dataset Information
- Rows: ~5,100 patients  
- Features include: age, gender, BMI, smoking status, hypertension, heart disease, work type, residence type, and glucose levels  
- Target variable: `stroke` (1 = stroke, 0 = no stroke)

---

## Data Cleaning
- Removed unnecessary columns such as `id`
- Handled missing BMI values using median imputation
- Encoded categorical variables using one-hot encoding
- Reviewed outliers in continuous parameter distributions

---

## Exploratory Data Analysis (EDA)
EDA was performed using SQL and Tableau dashboards to investigate health and lifestyle risk factors.

Questions explored:
- What percentage of patients suffered a stroke?
- How does age affect stroke likelihood?
- Do smoking habits influence stroke risk?
- How do glucose levels and BMI differ for stroke patients?
- What role do hypertension and heart disease play?

Key EDA findings:
- Stroke likelihood increases significantly after age 60
- Hypertension and heart disease are common among stroke-positive patients
- Glucose levels above 200 mg/dL are strongly associated with stroke risk
- Higher BMI combined with smoking history further increases risk
- Many stroke patients exhibit multiple health risk factors

---

## Machine Learning Model

### Objective
Predict if a patient is at high risk of stroke using medical and demographic data.

### Algorithms Tested
| Model | Purpose |
|------|---------|
| Logistic Regression | Baseline model |
| Random Forest | Handles non-linear decision boundaries |
| Gradient Boosting | Additional comparison method |
| Random Forest + SMOTE | Best-performing model |

---

### Addressing Class Imbalance
Only around 5% of the dataset represents stroke cases.  
Initial models often predicted that no patient would have a stroke:

- High accuracy but recall = 0  
- This is unacceptable in healthcare contexts

To correct this, SMOTE (Synthetic Minority Oversampling Technique) was applied to oversample positive stroke cases during training. This allowed the model to learn from a more balanced representation of stroke and non-stroke patients.

---

## Model Evaluation Visualizations
Generated in Python using Matplotlib and Seaborn:

- Confusion Matrix
- ROC Curve
- Precision / Recall / F1 Comparison
- Feature Importance Bar Chart

Important features for stroke prediction include:
- Age
- Average glucose level
- Hypertension
- BMI

---

## Project Files
| File Name | Description |
|----------|-------------|
| `predictive-analysis.py` | Model training, SMOTE oversampling, performance evaluation, exports CSVs |
| `model_visualizations.py` | Standalone visualization script for model performance |
| `model_results.csv` | Predictions and probability scores for test dataset |
| `feature_importance.csv` | Ranked feature importance values |
| Tableau workbook (optional) | Interactive dashboards for exploratory analysis |

---

## Future Improvements
- Deploy the model as a Streamlit or Flask web application for real-time prediction
- Integrate with Tableau using TabPy for live model inference
- Apply hyperparameter tuning to further improve performance
- Use explainability frameworks such as SHAP for deeper model interpretation

---

## Conclusion
This project showcases a complete end-to-end data science pipeline in a healthcare setting, including:

1. Data extraction and cleaning  
2. Exploratory and statistical analysis  
3. Predictive modeling and class imbalance handling  
4. Performance visualization and feature explainability  

These insights support early identification of high-risk individuals, contributing to improved preventative healthcare decisions.

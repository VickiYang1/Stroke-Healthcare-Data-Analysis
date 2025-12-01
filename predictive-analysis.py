import pandas as pd
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import precision_score, recall_score, f1_score, confusion_matrix

df = pd.read_csv('healthcare-dataset-stroke-data.csv')

#print(df.columns)

""" separating the columns to prepare for ML model """

#id is not necessary in analysis
df_new = df.drop('id', axis=1)
X = df_new.drop('stroke', axis=1)
y = df_new['stroke']

X = pd.get_dummies(X, drop_first=True)

#print(X.shape)
#print(X.head())

""" Data Splitting and Model Training """
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)

# Handle missing values by replacing NaNs with median
X_train = X_train.fillna(X_train.median())
X_test = X_test.fillna(X_test.median())

#print(X_train.shape)
#print(X_test.shape)
#print(y_train.shape)
#print(y_test.shape)

model = LogisticRegression(max_iter=1000, class_weight='balanced')
model.fit(X_train, y_train)

y_pred = model.predict(X_test)

#print(y_pred[:10])

""" Test Accuracy of the Model """
accuracy = accuracy_score(y_test, y_pred)

#accuracy :0.75
print(f'Accuracy of the Logistic Regression model: {accuracy:.2f}')

""" Improving the Model """
from imblearn.over_sampling import SMOTE

smote = SMOTE(random_state=42)
X_train_resampled, y_train_resampled = smote.fit_resample(X_train, y_train)

#print("Before SMOTE:")
#print(y_train.value_counts())
#print("\nAfter SMOTE:")
#print(y_train_resampled.value_counts())

# Random Forest trained on SMOTE data
rf_model_smote = RandomForestClassifier(n_estimators=100, random_state=42)
rf_model_smote.fit(X_train_resampled, y_train_resampled)
y_rf_smote_pred = rf_model_smote.predict(X_test)
rf_smote_accuracy = accuracy_score(y_test, y_rf_smote_pred)
print(f'Accuracy of the Random Forest + SMOTE model: {rf_smote_accuracy:.2f}')

rf_model = RandomForestClassifier(n_estimators=100, class_weight='balanced', random_state=42)
rf_model.fit(X_train, y_train)
y_rf_pred = rf_model.predict(X_test)
rf_accuracy = accuracy_score(y_test, y_rf_pred) 

#accuracy:0.94
print(f'Accuracy of the Random Forest model: {rf_accuracy:.2f}')

gb_model = GradientBoostingClassifier(n_estimators=100, random_state=42)
gb_model.fit(X_train, y_train)
y_gb_pred = gb_model.predict(X_test)
gb_accuracy = accuracy_score(y_test, y_gb_pred)
print(f'Accuracy of the Gradient Boosting model: {gb_accuracy:.2f}')

""" Evaluating Model Performance with Additional Metrics """
models = {
    "Logistic Regression": y_pred,
    "Random Forest": y_rf_pred,
    "Gradient Boosting": y_gb_pred,
    "Random Forest + SMOTE": y_rf_smote_pred
}

for name, preds in models.items():
    print(f"\nModel: {name}")
    print("Precision:", precision_score(y_test, preds, zero_division=0))
    print("Recall:", recall_score(y_test, preds, zero_division=0))
    print("F1 Score:", f1_score(y_test, preds, zero_division=0))
    print("Confusion Matrix:")
    print(confusion_matrix(y_test, preds))

results_df = pd.DataFrame({
    "stroke_actual": y_test,
    "stroke_pred_rf_smote": y_rf_smote_pred,
    "stroke_proba_rf_smote": rf_model_smote.predict_proba(X_test)[:, 1]
})

results_df.to_csv("model_results.csv", index=False)
print("Saved predictions to model_results.csv")

features_df = pd.DataFrame({
    "feature": X.columns,
    "importance": rf_model_smote.feature_importances_
})

features_df.to_csv("feature_importance.csv", index=False)
print("Saved feature importance to feature_importance.csv")

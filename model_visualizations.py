import pandas as pd
from sklearn.metrics import confusion_matrix, RocCurveDisplay
import matplotlib.pyplot as plt
import seaborn as sns

# Load model results and feature importance
results = pd.read_csv("model_results.csv")
features_df = pd.read_csv("feature_importance.csv")

print(results.head())

""" Graphs for the Machine Learning part """

# 1. Confusion Matrix for Random Forest + SMOTE
cm = confusion_matrix(results["stroke_actual"], results["stroke_pred_rf_smote"])

plt.figure(figsize=(6,4))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues')
plt.title("Confusion Matrix - Random Forest + SMOTE")
plt.xlabel("Predicted Label")
plt.ylabel("True Label")
plt.tight_layout()
plt.show()

# 2. ROC Curve (using stroke probabilities)
plt.figure(figsize=(6,4))
RocCurveDisplay.from_predictions(
    results["stroke_actual"], 
    results["stroke_proba_rf_smote"]
)
plt.title("ROC Curve - Random Forest + SMOTE")
plt.tight_layout()
plt.show()

# 3. Feature Importance Plot
top_features = features_df.sort_values(by="importance", ascending=False).head(10)

plt.figure(figsize=(10,6))
sns.barplot(data=top_features, x="importance", y="feature", palette="viridis")
plt.title("Top 10 Feature Importances - Random Forest + SMOTE")
plt.xlabel("Importance")
plt.ylabel("Feature")
plt.tight_layout()
plt.show()

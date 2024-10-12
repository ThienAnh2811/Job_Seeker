from sklearn.base import BaseEstimator, RegressorMixin
from sklearn.linear_model import LinearRegression
import pandas as pd
from sklearn.model_selection import train_test_split

class LinearModel(BaseEstimator, RegressorMixin):
    def __init__(self):
        self.model = LinearRegression()

    def fit(self, X, y):
        self.model.fit(X[['level_number', 'experience']], y)
        return self

    def predict(self, X):
        return self.model.predict(X[['level_number', 'experience']])
old_data = pd.read_csv("C:\\Users\\nguye\\OneDrive - The University of Technology\\GITHUB CLONE REPO\\PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook\\DataAnalysis\\analyzed_data.csv")

old_data_filtered = old_data.loc[(old_data['maxSalary_std'] != 0) &
                                (old_data['level_number'] >= 1) &
                                (old_data['experience'] >= 1) & 
                                (old_data['experience'] <= 30) & 
                                (old_data['location_number'] != 0)]

X_old = old_data_filtered[['experience', 'level_number']]
y_old = old_data_filtered['maxSalary_std']

X_old_train, X_old_valid, y_old_train, y_old_valid = train_test_split(X_old, y_old, train_size=0.8, test_size=0.2, random_state=0)

linear_model_alone = LinearModel()

linear_model_alone.fit(X_old_train, y_old_train)
y_pred_linear_alone_old_train = linear_model_alone.predict(X_old_train)
y_pred_linear_alone_old_valid = linear_model_alone.predict(X_old_valid)

train_score_linear_alone_old = linear_model_alone.score(X_old_train, y_old_train)
valid_score_linear_alone_old = linear_model_alone.score(X_old_valid, y_old_valid)

import joblib

joblib.dump(linear_model_alone, 'linear_model_alone.pkl')

import pandas as pd
import re
import matplotlib.pyplot as plt
import re
import os
from sklearn.base import BaseEstimator

class CombinedModel(BaseEstimator):
    def __init__(self, model1, model2, weight1=0.6, weight2=0.4):
        self.model1 = model1
        self.model2 = model2
        self.weight1 = weight1
        self.weight2 = weight2

    def fit(self, X, y):
        # This assumes that model1 and model2 have already been fit
        pass

    def predict(self, X):
        y_pred1 = self.model1.predict(X)
        y_pred2 = self.model2.predict(X)
        return self.weight1 * y_pred1 + self.weight2 * y_pred2


data = pd.read_csv("C:\\Users\\nguye\\OneDrive - The University of Technology\\GITHUB CLONE REPO\\PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook\\DataAnalysis\\analyzed_data.csv")
# %%
features =  ['experience', 'phonenumber', 'Python', 'Java',
       'JavaScript', 'C++', 'C#', 'PHP', 'Ruby', 'Swift', 'TypeScript', 'Go',
       'Kotlin', 'Rust', 'Lua', 'Perl', 'SQL', 'HTML', 'CSS', 'R', 'MATLAB',
       'Shell', 'Assembly', '.NET', 'C',  'Web',
       'Android', 'IOS', 'Backend', 'Frontend', 'Machine Learning', 'Data',
       'Game', 'Embedded', 'Network', 'Computer Science', 'Software',
       'Security', 'Robot', 'Cloud', 'AI', 'Nhúng', 'Bridge', 'Software.1',
       'Designer', 'Scrum', 'BrSE', 'Tester', 'Comtor','level_number','location_number']

X = data[features]
X.head()



y = data['maxSalary']
y.head()

from sklearn.model_selection import train_test_split
# print(data.columns)

# %%
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression, LinearRegression
# data_filtered = data.loc[data['maxSalary'] != 0]
data_filtered = data.loc[(data['maxSalary_std'] != 0) &
                         (data['level_number'] >= 1) &
                          ( data['experience'] >= 1) & (data['experience'] <= 30) & (data['location_number'] != 0 )
                        ]


features = [ 'experience', 'Python', 'Java',
       'JavaScript', 'C++', 'C#', 'PHP', 'Ruby', 'Swift', 'TypeScript', 'Go',
       'Kotlin', 'Rust', 'Lua', 'Perl', 'SQL', 'HTML', 'CSS', 'R', 'MATLAB',
       'Shell', 'Assembly', '.NET', 'C', 'Web', 'Android',
       'IOS', 'Backend', 'Frontend',  'Data', 'Game',
       'Embedded', 'Network', 'Software', 'Security',
       'Robot', 'Cloud', 'AI', 'Nhúng', 'Bridge', 'Software.1', 'Designer',
       'Scrum', 'BrSE', 'Tester', 'Comtor' ,'level_number','location_number']

# Assign features and target
X = data_filtered[features]
y = data_filtered['maxSalary_std']

# Chia dữ liệu thành tập huấn luyện và tập kiểm tra
X_train, X_valid, y_train, y_valid = train_test_split(X, y, train_size=0.8, test_size=0.2, random_state=0)
logistic_model = LogisticRegression()
logistic_model.fit(X_train.drop(columns=['experience', 'level_number']), y_train)

# Tạo và huấn luyện mô hình Linear Regression cho thuộc tính 'experience' và 'level_number'
linear_model = LinearRegression()
linear_model.fit(X_train[['experience', 'level_number']], y_train)

# Đánh giá mô hình
train_score_logistic = logistic_model.score(X_train.drop(columns=['experience', 'level_number']), y_train)
valid_score_logistic = logistic_model.score(X_valid.drop(columns=['experience', 'level_number']), y_valid)
train_score_linear = linear_model.score(X_train[['experience', 'level_number']], y_train)
valid_score_linear = linear_model.score(X_valid[['experience', 'level_number']], y_valid)
# print("Logistic Regression - Training accuracy:", train_score_logistic)
# print("Logistic Regression - Validation accuracy:", valid_score_logistic)
# print("Linear Regression - Training R^2 score:", train_score_linear)
# print("Linear Regression - Validation R^2 score:", valid_score_linear)



y_pred_linear_train = linear_model.predict(X_train[['experience','level_number']])
y_pred_linear_valid = linear_model.predict(X_valid[['experience','level_number']])

y_pred_logistic_train = logistic_model.predict(X_train.drop(columns=['experience','level_number']))
y_pred_logistic_valid = logistic_model.predict(X_valid.drop(columns=['experience','level_number']))

# print("Predictions using Linear Regression:")
# print("Training set:", y_pred_linear_train)
# print("Validation set:", y_pred_linear_valid)

# print("\nPredictions using Logistic Regression:")
# print("Training set:", y_pred_logistic_train)
# print("Validation set:", y_pred_logistic_valid)

combined_y_pred_train = 0.6 * y_pred_linear_train + 0.4 * y_pred_logistic_train
combined_y_pred_valid = 0.6 * y_pred_linear_valid + 0.4 * y_pred_logistic_valid


import joblib

# # Create a dictionary that contains both models
# combined_model = {'logistic': logistic_model, 'linear': linear_model}

# # Save the combined model
# joblib.dump(combined_model, 'combined_model.pkl')


# # In ra kết quả dự đoán
# print("Combined Predictions:")
# print("Training set:", combined_y_pred_train)
# print("Validation set:", combined_y_pred_valid)
# combined_model = CombinedModel(linear_model, logistic_model)

# # Save the combined model
# joblib.dump(combined_model, 'combined_model.pkl')
def predict_salary(data):
    # Load the combined model
    combined_model = joblib.load('combined_model.pkl')

    # Manually specify the order of features
    feature_names = ['experience', 'level_number', 'Python', 'Java', 'JavaScript', 'C++', 'C#', 'PHP', 'Ruby', 'Swift', 'TypeScript',
                     'Go', 'Kotlin', 'Rust', 'Lua', 'Perl', 'SQL', 'HTML', 'CSS', 'R', 'MATLAB', 'Shell',
                     'Assembly', '.NET', 'C', 'Web', 'Android', 'IOS', 'Backend', 'Frontend', 
                     'Data', 'Game', 'Embedded', 'Network', 'Software', 'Security', 'Robot',
                     'Cloud', 'AI', 'Nhúng', 'Bridge', 'Software.1', 'Designer', 'Scrum', 'BrSE', 'Tester',
                     'Comtor', 'location_number']

    # Ensure the order of features matches the order used during model training
    ordered_data = {feature: data[feature] for feature in feature_names}

    # Create a DataFrame with the input values
    input_data = pd.DataFrame([ordered_data])

    # Make predictions using the combined model
    predicted_salary = combined_model.predict(input_data)

    return predicted_salary[0]


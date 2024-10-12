import joblib
import pandas as pd
import sys 
import json
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

    def predict_salary(self, data):
        feature_order = ['experience', 'level_number', 'Python', 'Java', 'JavaScript', 'C++', 'C#', 'PHP', 'Ruby', 'Swift', 'TypeScript',
                 'Go', 'Kotlin', 'Rust', 'Lua', 'Perl', 'SQL', 'HTML', 'CSS', 'R', 'MATLAB', 'Shell',
                 'Assembly', '.NET', 'C', 'Web', 'Android', 'IOS', 'Backend', 'Frontend',
                 'Data', 'Game', 'Embedded', 'Network', 'Software', 'Security', 'Robot',
                 'Cloud', 'AI', 'Nhúng', 'Bridge', 'Software.1', 'Designer', 'Scrum', 'BrSE', 'Tester',
                 'Comtor', 'location_nupmber']

          # Initialize a dictionary with all features set to 0
        ordered_data = {feature: 0 for feature in feature_order}

        # Update the dictionary with the actual data
        for key, value in data.items():
            if key in ordered_data:
                ordered_data[key] = value
            else:
                print(f"Unseen feature: {key}")  # Print unseen features

        # Remove unseen features
        ordered_data = {key: value for key, value in ordered_data.items() if key in feature_order}

        # Convert the dictionary to a DataFrame
        input_data = pd.DataFrame([ordered_data])

        # Make predictions
        predicted_salary = self.predict(input_data)

        return predicted_salary
def add_double_quotes(json_data):
    # Remove all spaces
    json_data = json_data.replace(" ", "")
    lines = json_data.splitlines()
    for i, line in enumerate(lines):
        index = line.find(':')
        if index != -1:
            lines[i] = '"' + line[:index].strip() + '":' + line[index+1:].strip()
    return '\n'.join(lines)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        json_data = sys.argv[1]

        json_data_with_quotes = add_double_quotes(json_data)
        print("JSON data with double quotes added to property names:", json_data_with_quotes)
        try:
            data = json.loads(json_data_with_quotes)
            model1 = joblib.load(r"C:\Users\nguye\OneDrive - The University of Technology\GITHUB CLONE REPO\PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook\DataAnalysis\linear_model.pkl")
            model2 = joblib.load(r"C:\Users\nguye\OneDrive - The University of Technology\GITHUB CLONE REPO\PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook\DataAnalysis\logistic_model.pkl")
            combined_model = CombinedModel(model1, model2)
            # combined_model = CombinedModel(r"C:\Users\nguye\OneDrive - The University of Technology\GITHUB CLONE REPO\PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook\DataAnalysis\combined_model.pkl")
            predicted_salary = combined_model.predict_salary(data) 
            print(predicted_salary)
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON: {e}")
            sys.exit(1)
    else:
        print("No input JSON data received")
        sys.exit(1)
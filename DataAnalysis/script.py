import sys
import json
import pandas as pd
import joblib

class CombinedModel:
    def __init__(self, model1, model2, weight1=0.6, weight2=0.4):
        self.model1 = model1
        self.model2 = model2
        self.weight1 = weight1
        self.weight2 = weight2

    def predict(self, X):
        y_pred1 = self.model1.predict(X)
        y_pred2 = self.model2.predict(X)
        return self.weight1 * y_pred1 + self.weight2 * y_pred2

def predict_salary(data):
    # Load the combined model
    combined_model = joblib.load('combined_model.pkl')

    # Manually specify the order of features
    feature_names = ['experience','Python', 'Java', 'JavaScript', 'C++', 'C#', 'PHP', 'Ruby', 'Swift', 'TypeScript',
                     'Go', 'Kotlin', 'Rust', 'Lua', 'Perl', 'SQL', 'HTML', 'CSS', 'R', 'MATLAB', 'Shell',
                     'Assembly', '.NET', 'C', 'Web', 'Android', 'IOS', 'Backend', 'Frontend', 'Machine Learning',
                     'Data', 'Game', 'Embedded', 'Network', 'Computer Science', 'Software', 'Security', 'Robot',
                     'Cloud', 'AI', 'Nhúng', 'Bridge', 'Software.1', 'Designer', 'Scrum', 'BrSE', 'Tester',
                     'Comtor', 'level_number', 'location_number']

    # Ensure the order of features matches the order used during model training
    ordered_data = {feature: data[feature] for feature in feature_names}

    # Create a DataFrame with the input values
    input_data = pd.DataFrame([ordered_data])

    # Make predictions using the combined model
    predicted_salary = combined_model.predict(input_data)

    return predicted_salary[0]

if __name__ == "__main__":
    try:
        # Read JSON data from command-line argument
        json_data = sys.argv[1]
        
        # Deserialize JSON data into a Python dictionary
        data = json.loads(json_data)
        
        # Make predictions
        predicted_salary = predict_salary(data)
        
        # Print the predicted salary
        print(predicted_salary)
    except Exception as e:
        print("Error:", e)
        sys.exit(1)
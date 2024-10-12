import sys
import pandas as pd
import joblib
import json
from train import LinearModel

def add_double_quotes(json_data):
    json_data = json_data.replace(" ", "")
    lines = json_data.splitlines()
    for i, line in enumerate(lines):
        index = line.find(':')
        if index != -1:
            lines[i] = '"' + line[:index].strip() + '":' + line[index+1:].strip()
    return '\n'.join(lines)

model = joblib.load(r"C:\Users\nguye\OneDrive - The University of Technology\GITHUB CLONE REPO\PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook\DataAnalysis\linear_model_alone.pkl")

input_dict = json.loads(add_double_quotes(sys.argv[1]))
input_data = pd.DataFrame([input_dict], columns=['experience', 'level_number'])

prediction = model.predict(input_data)

from decimal import Decimal, getcontext

getcontext().prec = 15

print(f'{prediction[0]:.0f}')
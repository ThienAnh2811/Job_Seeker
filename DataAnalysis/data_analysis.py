# %%
import re
import pandas as pd
import re
from collections import Counter
import matplotlib.pyplot as plt
import csv
import re
# https://jobscentral.com.sg/jobs

# %%
# %% [markdown]
# # Vẽ biểu đồ ngôn ngữ thông dụng

# %% [markdown]
# # Tạo thuộc tính mới từ text -> Vị trí làm việc, email , ngôn ngữ yêu cầu

# %% [markdown]
# ### Location 

# %%
# def read_locations_file(locations_file):
#     with open(locations_file, 'r', encoding='utf-8') as file:
#         locations = [line.strip() for line in file]
#     return locations

# def add_location_to_csv(input_csv, locations_file, output_csv):
#     locations = read_locations_file(locations_file)
#     output_data = []

#     with open(input_csv, 'r', encoding='utf-8') as csvfile:
#         reader = csv.DictReader(csvfile)
#         for row in reader:
#             content = row['content'].lower()  
#             location = find_location(content, locations)
#             row['location'] = location
#             output_data.append(row)

#     with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
#         fieldnames = ['post_id', 'content', 'location', 'images']
#         writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
#         writer.writeheader()
#         for row in output_data:
#             writer.writerow(row)

# def find_location(content, locations):
#     for location in locations:
#         if location.lower() in content:
#             return location
#     return 'Unknown'


# %% [markdown]
# ### Email

# %%
import json
def read_locations_json(locations_json):
    with open(locations_json, 'r', encoding='utf-8') as file:
        locations_data = json.load(file)
    return locations_data

def add_location_to_csv(input_csv, locations_json, output_csv):
    # Read locations data from JSON file
    with open(locations_json, 'r', encoding='utf-8') as json_file:
        locations_data = json.load(json_file)

    output_data = []

    with open(input_csv, 'r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            content = row['content'].lower()
            location = find_location(content, locations_data)
            row['location'] = location
            
            # Get location number from JSON data
            location_number = get_location_number(location, locations_data)
            row['location_number'] = location_number

            output_data.append(row)

    with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['post_id', 'content', 'location', 'location_number', 'images']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for row in output_data:
            writer.writerow(row)

def find_location(content, locations_data):
    for province_id, province_info in locations_data.items():
        province_name = province_info['name'].lower()
        if province_name in content:
            return province_name
        for district_id, district_name in province_info['districts'].items():
            if district_name.lower() in content:
                return province_name
    return 0

def get_location_number(location, locations_data):
    for province_id, province_info in locations_data.items():
        if province_info['name'].lower() == location:
            return province_id
        for district_id, district_name in province_info['districts'].items():
            if district_name.lower() == location:
                return district_id
    return 0

def find_location(content, locations_data):
    for province_id, province_info in locations_data.items():
        province_name = province_info['name'].lower()
        if province_name in content:
            return province_name
        for district_id, district_name in province_info['districts'].items():
            if district_name.lower() in content:
                return province_name
    return 0


# %%
def extract_email(text):
    pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b'
    emails = re.findall(pattern, text)
    return emails[0] if emails else 'Unknown'

def update_analyzed_data_with_email(input_csv_file, output_csv_file):
    with open(input_csv_file, 'r', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    for row in rows:
        row['email'] = extract_email(row['content'])

    with open(output_csv_file, 'w', newline='', encoding='utf-8') as output_file:
        fieldnames = ['post_id', 'content', 'location','location_number', 'images','email']
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

# %% [markdown]
# # Ngôn ngữ lập trình

# %%
def addProgrammingLanguagesToCSV(input_csv, programming_languages_file, output_csv):
    with open(input_csv, 'r', newline='', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    with open(programming_languages_file, 'r', encoding='utf-8') as lang_file:
        programming_languages = [line.strip() for line in lang_file]

    fieldnames = reader.fieldnames + programming_languages

    for row in rows:
        content = row['content']
        for lang in programming_languages:
            if re.search(r'\b{}\b'.format(re.escape(lang)), content, flags=re.IGNORECASE):
                row[lang] = '1'
            else:
                row[lang] = '0'

    with open(output_csv, 'w', newline='', encoding='utf-8') as output_file:
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


# %% [markdown]
# # Trình độ 

# %%
def addLevelToCSV(input_csv, level_file_json, output_csv):
    with open(input_csv, 'r', newline='', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    with open(level_file_json, 'r', encoding='utf-8') as json_file:
        level_data = json.load(json_file)

    fieldnames = reader.fieldnames + ['level_word', 'level_number']  # Include 'level_word' and 'level_number' as new fields

    for row in rows:
        content = row['content']
        level_word = ''
        level_number = 0
        for word, number in level_data.items():
            if re.search(r'\b{}\b'.format(re.escape(word)), content, flags=re.IGNORECASE):
                level_word = word
                level_number = number
                break

        row['level_word'] = level_word
        row['level_number'] = level_number

    with open(output_csv, 'w', newline='', encoding='utf-8') as output_file:
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

# %% [markdown]
# # Ngoại ngữ yêu cầu 

# %%
def addLanguagesRequirementToCSV(input_csv, output_csv):
    # Danh sách các từ khóa hoặc biểu thức chính quy cho mỗi ngôn ngữ
    languages_keywords = {
        'Tiếng Anh': r'\b(English|Eng|AV|Anh)\b',
        'Tiếng Nhật': r'\b(Japanese|Japanse|Nhật)\b',
        'Tiếng Trung': r'\b(Chinese|Trung)\b'
    }

    with open(input_csv, 'r', newline='', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    # Tạo danh sách các trường mới cho các ngôn ngữ
    languages = list(languages_keywords.keys())

    fieldnames = reader.fieldnames + languages

    for row in rows:
        content = row['content']
        for lang, keyword_pattern in languages_keywords.items():
            if re.search(keyword_pattern, content, flags=re.IGNORECASE):
                row[lang] = '1'
            else:
                row[lang] = '0'

    with open(output_csv, 'w', newline='', encoding='utf-8') as output_file:
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

# %% [markdown]
# # Mảng chuyên

# %%
def addMajorsToCSV(input_csv, major_file, output_csv):
    with open(input_csv, 'r', newline='', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    with open(major_file, 'r', encoding='utf-8') as lang_file:
        majors= [line.strip() for line in lang_file]

    fieldnames = reader.fieldnames + majors
    for row in rows:
        content = row['content']
        for lang in majors:
            if re.search(r'\b{}\b'.format(re.escape(lang)), content, flags=re.IGNORECASE):
                row[lang] = '1'
            else:
                row[lang] = '0'

    with open(output_csv, 'w', newline='', encoding='utf-8') as output_file:
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


# %% [markdown]
# # Lương

# %%
def extract_salary(text):
    patterns = [
    r'(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*m',
r'\b(?:up\s*to|upto)*(?P<max_salary>\d{2})\s*tr',
r'(?P<min_salary>\d{2})\s*triệu\s*-\s*(?P<max_salary>\d{2})\s*triệu',
r'\b(?P<min_salary>\d{2})\s*million\s*-\s*(?P<max_salary>\d{2})\s*million\b',
r'\b(?P<min_salary>\d{2})\s*m\s*-\s*(?P<max_salary>\d{2})\s*m\b',
r'\b(?P<min_salary>\d{2})\s*triệu\s*-\s*(?P<max_salary>\d{,2})\s*triệu\b',
r'\b(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*m\b',
r'\b(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*mil\b',
r'\b(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*tr\b',
r'\b(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*triệu\b',
r'\b(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*đ\b',
r'\b(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*đồng\b',
r'\b(?P<min_salary>\d{2})\s*tr\s*-\s*(?P<max_salary>\d{2})\s*tr\b',
r'(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})\s*vnd',
r'\b(?P<min_salary>\d{2})\s*triệu\s*đến\s*(?P<max_salary>\d{2})\s*triệu\b',
r'(?P<min_salary>\d{2})\s*vnd\s*-\s*(?P<max_salary>\d{2})vnd',
r'(?P<min_salary>\d{2})m\s*-(?P<max_salary>\d{2})m\b',
r'\b(?P<min_salary>\d{2})\s*đến\s*(?P<max_salary>\d{2})\s*triệu\b',
r'\b(?P<min_salary>\d{2})\s*đến\s*(?P<max_salary>\d{2})\s*tr\b',
r'(?:up\s*to)?\s*(?P<max_salary>\d{2})\s*m',
r'\$(?P<min_salary>\d{2})\s*-\s*\$(?P<max_salary>\d{2})',
r'(?P<min_salary>\d{2})\$\s*-\s*(?P<max_salary>\d{2})\$',
r'(?P<min_salary>\d{2})\s*-\s*\$(?P<max_salary>\d{2})',
r'\$(?P<min_salary>\d{2})\s*-\s*(?P<max_salary>\d{2})',
r'(?P<min_salary>\d{2})\s*usd\s*-\s*(?P<max_salary>\d{2})\s*usd',
r'(?P<min_salary>\d{3,4})\s*-\s*(?P<max_salary>\d{3,4})\s*usd',
r'(?P<min_salary>\d{3,4})\s*USD\s*-\s*(?P<max_salary>\d{3,4})\s*usd',
r'(?:\bup\s*to|\bupto)\s*(?P<max_salary>\d{2})\s*tr',
r'(?:\bup\s*to|\bupto)\s*(?P<max_salary>\d{2})\s*triệu',
r'(?:\bup\s*to|\bupto)\s*(?P<max_salary>\d{3,4})\s*usd',
r'lên\s+đến|up\s+to\s*\$?(?P<max_salary>\d{3,4}(?:,\d{3})*|\d{3,4})\s*usd?',
r'lên\s+đến|up\s+to\s*(?P<max_salary>\d{2}(?:\.\d{3})*(?:\.\d+)?)\s*vnđ',
r'lên\s+đến|up\s+to\s*(?P<max_salary>\d{2}(?:\.\d{3})*(?:\.\d+)?)\s*vnd',
r'(?:upto|up\s*to)\s*(?P<max_salary>\d{3}(?:\.\d{3})*(?:\.\d+)?)\s*m',
r'\b(?P<maxsalary>\d{4})\$',
    ]
    for pattern in patterns:
        matches = re.findall(pattern, text.lower())
        if matches:
            if len(matches[0]) == 2:  
                min_salary = float(matches[0][0])*25000 if 'usd' in pattern or '$' in pattern else float(matches[0][0]) * 1000000 if 'triệu' in pattern or 'm' in pattern or 'tr' in pattern or '.000.000 ' in pattern else float(matches[0][0]) * 25000
                max_salary = float(matches[0][1])*25000 if 'usd' in pattern or '$' in pattern else  float(matches[0][1]) * 1000000 if 'triệu' in pattern or 'm' in pattern or 'tr' in pattern or  '.000.000 ' in pattern else float(matches[0][1]) * 25000
                avg_salary = (min_salary + max_salary) / 2
                return min_salary, max_salary, avg_salary
            elif len(matches[0]) == 1: 
                max_salary = float(matches[0][0])*25000 if 'usd' in pattern or '$' in pattern else  float(matches[0][0]) * 1000000 if 'triệu' in pattern or 'm' in pattern or 'tr' in pattern or  '.000.000 ' in pattern else float(matches[0][0]) * 25000
                return 0, max_salary, 0
    return 0, 0, 0

def add_salary_columns(input_csv_file, output_csv_file):
    with open(input_csv_file, 'r', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    for row in rows:
        min_salary, max_salary, avg_salary = extract_salary(row['content'])
        row['minSalary'] = min_salary
        row['maxSalary'] = max_salary
        row['avgSalary'] = avg_salary

    with open(output_csv_file, 'w', newline='', encoding='utf-8') as output_file:
        fieldnames = reader.fieldnames + ['minSalary','maxSalary','avgSalary']
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

# %% [markdown]
# # Năm kinh nghiệm

# %%
def extract_experience(text):
    pattern = r'(\d+)\s*(?=\s*năm)'
    experience = re.findall(pattern, text)
    return experience[0] if experience else '-1'
def update_analyzed_data_with_experience(input_csv_file, output_csv_file):
    with open(input_csv_file, 'r', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    for row in rows:
        row['experience'] = extract_experience(row['content'].lower())

    with open(output_csv_file, 'w', newline='', encoding='utf-8') as output_file:
        fieldnames = ['post_id', 'content', 'images', 'email', 'location','location_number','minSalary', 'maxSalary', 'avgSalary' ,'experience']
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


# %% [markdown]
# # Trích điện thoại

# %%
def extract_phonenumber(text):
    pattern = r'(?<!\d)(?:0|\+84|84)(?:\d(?:\s|\.)?){9,10}\b'
    phone_numbers = re.findall(pattern, text)
    return phone_numbers[0] if phone_numbers else 'Unknown'
def addPhonenumberToCSV(input_csv_file, output_csv_file):
    with open(input_csv_file, 'r', encoding='utf-8') as input_file:
        reader = csv.DictReader(input_file)
        rows = list(reader)

    for row in rows:
        row['phonenumber'] = extract_phonenumber(row['content'])

    with open(output_csv_file, 'w', newline='', encoding='utf-8') as output_file:
        fieldnames = ['post_id', 'content', 'images', 'email', 'location', 'location_number','minSalary', 'maxSalary', 'avgSalary', 'experience', 'phonenumber']
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


# %%
input_csv = 'output1.csv'
# locations_file = './Vietnamese-data/Vietnam GIS data/Vnlocations.txt' 
programming_languages_file = './Vietnamese-data/ProgramLanguages.txt'
# languages_requirement_file = './Vietnamese-data/ForeginLanguagues'
majors_file = './Vietnamese-data/Major.txt'
level_file = './Vietnamese-data/Level.txt'
output_csv = 'analyzed_data.csv'  
locations_json = './Vietnamese-data/vietname-gis.json'
level_file_json = './Vietnamese-data/Level.json'

# %%
# add_location_to_csv(input_csv, locations_file, output_csv)
add_location_to_csv(input_csv,locations_json,output_csv)
update_analyzed_data_with_email(output_csv, output_csv)
add_salary_columns(output_csv,output_csv)
update_analyzed_data_with_experience(output_csv,output_csv)
addPhonenumberToCSV(output_csv,output_csv)
addProgrammingLanguagesToCSV(output_csv, programming_languages_file, output_csv)
addLevelToCSV(output_csv,level_file_json,output_csv)
addLanguagesRequirementToCSV(output_csv,output_csv)
addMajorsToCSV(output_csv,majors_file,output_csv)


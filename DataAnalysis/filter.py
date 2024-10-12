import pandas as pd
import re
# Đọc dữ liệu từ tệp CSV gốc
df = pd.read_csv('analyzed_data.csv')

# Lọc các bản ghi theo các điều kiện đã nêu
filtered_df = df[(df['location_number'] != 0) &
                 (df['maxSalary_std'] > 0) &
                 (df['experience'] > 0) &
                 ((df['phonenumber'] != 'Unknown') | (df['email'] != 'Unknown')) &
                 (df[['C', 'C++', 'Rust', 'Python', 'Java', 'JavaScript',
                     'Ruby', 'Swift', 'Kotlin', 'Go', 'TypeScript', 'PHP',
                     'SQL', 'MATLAB', 'R', 'Perl', 'Lua', 'Shell', 'Scala',
                     'Haskell', 'Dart', 'Objective-C', 'Assembly language',
                     'Visual Basic', 'Cobol', 'Fortran', 'Lisp', 'Scheme',
                     'Prolog', 'C#', 'HTML', 'CSS', 'Shell.1', 'Assembly', '.NET',
                     'IOS']] > 0).any(axis=1) &
                 ((df[['Web', 'Android', 'iOS', 'Backend', 'Frontend',
                     'Machine Learning', 'Data', 'Game', 'Embedded', 'Network',
                     'Computer Science', 'Software', 'Security', 'Robot', 'Cloud',
                     'AI', 'Nhúng', 'Bridge', 'Software.1', 'Designer', 'Scrum',
                     'BrSE', 'Tester', 'Comtor']] > 0).any(axis=1))]

# Chọn các cột cần thiết cho tệp CSV mới
filtered_df = filtered_df[['post_id' , 'location', 'maxSalary_std', 'minSalary', 'phonenumber', 'email', 'content', 'images', 'experience']]
filtered_df['content'] = filtered_df['content'].apply(lambda x: re.sub(r'[^\w\s]', '', x))

# Lưu tệp CSV mới
filtered_df.to_csv('filtered_data.csv', index=False)

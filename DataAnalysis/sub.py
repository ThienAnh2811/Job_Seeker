import csv

# Đường dẫn đến tệp CSV
csv_file = 'filtered_data.csv'

# Mở tệp CSV và đọc dữ liệu
with open(csv_file, mode='r', newline='', encoding='utf-8') as file:
    reader = csv.DictReader(file)
    id = 83
    for row in reader:
        
        programing_languages = row['programming_languages'].strip('[]').split(',')
        # categories = row['categories'].split(',')
        
        # Duyệt qua từng ngôn ngữ lập trình và từng danh mục và thêm vào câu lệnh SQL
        for language in programing_languages:
            # for category in categories:
                sql_insert = f"""
                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('{id}', '{language.strip()}');
                """
                
                # In câu lệnh SQL
                print(sql_insert)
        id = id + 1
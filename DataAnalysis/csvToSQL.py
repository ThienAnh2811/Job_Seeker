import csv

# Đường dẫn đến tệp CSV
csv_file = 'filtered_data.csv'

# Mở tệp CSV và đọc dữ liệu
with open(csv_file, mode='r', newline='', encoding='utf-8') as file:
    reader = csv.DictReader(file)
    
    for row in reader:
        company_name = 'null'  # Không có dữ liệu company_name trong tệp CSV, bạn cần xác định cách lấy dữ liệu từng trường hợp
        max_salary = row.get('maxSalary_std', 'null')
        min_salary = row.get('minSalary', 'null')
        phone_number = row.get('phonenumber', 'null')
        email = row.get('email', 'null')
        content = row.get('content', 'null')
        images = row.get('images', 'null')
        experience = row.get('experience', 'null')
        
        # Tạo câu lệnh SQL INSERT
        sql_insert = f"""
        INSERT INTO db_website.recruitment_post (
             companyName, maxSalary, minSalary, phoneNumber, email, content, images, experience
        ) VALUES (
           '{company_name}', {max_salary}, {min_salary}, '{phone_number}', '{email}', 
            '{content}', '{images}', '{experience}'
        );
        """
        
        # In câu lệnh SQL
        print(sql_insert)

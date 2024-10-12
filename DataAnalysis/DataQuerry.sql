-- Tạo bảng job_location
CREATE TABLE job_location (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Tạo bảng level
CREATE TABLE level (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

-- Tạo bảng languages
CREATE TABLE languages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

-- Tạo bảng category
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

-- Tạo bảng programming_languages
CREATE TABLE programming_languages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

-- Tạo bảng company
CREATE TABLE company (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    profile_description TEXT,
    company_website VARCHAR(255),
    avatar TEXT
);

-- Tạo bảng recruitment_post
CREATE TABLE recruitment_post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    max_salary DECIMAL(10, 2),
    min_salary DECIMAL(10, 2),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    content TEXT,
    images TEXT,
    experience VARCHAR(255),
    location_id INT,
    level_id INT,
    languages_id INT,
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES job_location(id),
    FOREIGN KEY (level_id) REFERENCES level(id),
    FOREIGN KEY (languages_id) REFERENCES languages(id)
);

-- Tạo bảng recruitment_post_level
CREATE TABLE recruitment_post_level (
    id INT AUTO_INCREMENT PRIMARY KEY,
    level_id INT,
    post_id INT,
    FOREIGN KEY (level_id) REFERENCES level(id),
    FOREIGN KEY (post_id) REFERENCES recruitment_post(id)
);

-- Tạo bảng post_category
CREATE TABLE post_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    category_id INT,
    FOREIGN KEY (post_id) REFERENCES recruitment_post(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Tạo bảng post_programming_languages
CREATE TABLE post_programming_languages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    programming_languages_id INT,
    FOREIGN KEY (post_id) REFERENCES recruitment_post(id),
    FOREIGN KEY (programming_languages_id) REFERENCES programming_languages(id)
);

-- Tạo bảng user
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    photo TEXT,
    bio TEXT,
    location VARCHAR(255),
    social_links TEXT
);

-- Tạo bảng education_detail
CREATE TABLE education_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    certificate_degree_name VARCHAR(255),
    major VARCHAR(255),
    university_name VARCHAR(255),
    start_date DATE,
    grad_date DATE,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Tạo bảng experience
CREATE TABLE experience (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    is_current_job BOOLEAN,
    job_title VARCHAR(255),
    start_date DATE,
    end_date DATE,
    company_name VARCHAR(255),
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Tạo bảng user_account
CREATE TABLE user_account (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(20),
    sms_notification_active BOOLEAN,
    email_notification_active BOOLEAN,
    user_image TEXT,
    registration_date DATE
);

-- Tạo bảng user_log
CREATE TABLE user_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_account_id INT,
    last_login_date DATETIME,
    last_job_apply_date DATETIME,
    FOREIGN KEY (user_account_id) REFERENCES user_account(id)
);

-- Tạo bảng job_post_activity
CREATE TABLE job_post_activity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_account_id INT,
    job_post_id INT,
    apply_date DATETIME,
    FOREIGN KEY (user_account_id) REFERENCES user_account(id),
    FOREIGN KEY (job_post_id) REFERENCES recruitment_post(id)
);
-- Thêm cột mới vào bảng user để lưu trữ thông tin tài khoản
ALTER TABLE user
ADD COLUMN contact_number VARCHAR(20),
ADD COLUMN sms_notification_active BOOLEAN,
ADD COLUMN email_notification_active BOOLEAN,
ADD COLUMN user_image TEXT,
ADD COLUMN registration_date DATE;

DROP TABLE user_log ;

ALTER TABLE job_post_activity
ADD COLUMN user_id INT,
ADD FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE job_post_activity
DROP FOREIGN KEY job_post_activity_ibfk_1;

DROP TABLE user_account;



CREATE TABLE user_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    last_login_date DATETIME,
    last_job_apply_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

ALTER TABLE user
ADD COLUMN company_id INT,
ADD FOREIGN KEY (company_id) REFERENCES company(id);

ALTER TABLE user
ADD CONSTRAINT fk_company_id
FOREIGN KEY (company_id) REFERENCES company(id);


    INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '1','Cần Thơ'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '2','Đà Nẵng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '3','Hà Nội'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '4','Hải Phòng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '5','Hồ Chí Minh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '6','An Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '7','Bà Rịa-Vũng Tàu'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '8','Bắc Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '9','Bắc Kạn'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '10','Bạc Liêu'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '11','Bắc Ninh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '12','Bến Tre'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '13','Bình Định'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '14','Bình Dương'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '15','Bình Phước'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '16','Bình Thuận'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '17','Cà Mau'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '18','Cao Bằng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '19','Đắk Lắk'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '20','Đắk Nông'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '21','Điện Biên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '22','Đồng Nai'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '23','Đồng Tháp'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '24','Gia Lai'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '25','Hà Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '26','Hà Nam'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '27','Hà Tĩnh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '28','Hải Dương'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '29','Hậu Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '30','Hòa Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '31','Hưng Yên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '32','Khánh Hòa'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '33','Kiên Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '34','Kon Tum'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '35','Lai Châu'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '36','Lâm Đồng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '37','Lạng Sơn'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '38','Lào Cai'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '39','Long An'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '40','Nam Định'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '41','Nghệ An'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '42','Ninh Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '43','Ninh Thuận'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '44','Phú Thọ'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '45','Phú Yên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '46','Quảng Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '47','Quảng Nam'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '48','Quảng Ngãi'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '49','Quảng Ninh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '50','Quảng Trị'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '51','Sóc Trăng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '52','Sơn La'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '53','Tây Ninh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '54','Thái Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '55','Thái Nguyên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '56','Thanh Hóa'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '57','Thừa Thiên Huế'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '58','Tiền Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '59','Trà Vinh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '60','Tuyên Quang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '61','Vĩnh Long'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '62','Vĩnh Phúc'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '63','Yên Bái'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           'PS C:\Users\nguye\OneDrive - The University of Technology\GITHUB CLONE REPO\PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook\DataAnalysis> & C:/Users/nguye/AppData/Local/Microsoft/WindowsApps/python3.11.exe "c:/Users/nguye/OneDrive - The University of Technology/GITHUB CLONE REPO/PBL3-Applying-AI-to-analyze-recruitment-information-on-Facebook/DataAnalysis/sub.py"','None'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '1','Cần Thơ'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '2','Đà Nẵng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '3','Hà Nội'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '4','Hải Phòng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '5','Hồ Chí Minh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '6','An Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '7','Bà Rịa-Vũng Tàu'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '8','Bắc Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '9','Bắc Kạn'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '10','Bạc Liêu'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '11','Bắc Ninh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '12','Bến Tre'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '13','Bình Định'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '14','Bình Dương'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '15','Bình Phước'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '16','Bình Thuận'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '17','Cà Mau'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '18','Cao Bằng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '19','Đắk Lắk'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '20','Đắk Nông'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '21','Điện Biên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '22','Đồng Nai'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '23','Đồng Tháp'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '24','Gia Lai'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '25','Hà Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '26','Hà Nam'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '27','Hà Tĩnh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '28','Hải Dương'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '29','Hậu Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '30','Hòa Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '31','Hưng Yên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '32','Khánh Hòa'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '33','Kiên Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '34','Kon Tum'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '35','Lai Châu'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '36','Lâm Đồng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '37','Lạng Sơn'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '38','Lào Cai'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '39','Long An'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '40','Nam Định'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '41','Nghệ An'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '42','Ninh Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '43','Ninh Thuận'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '44','Phú Thọ'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '45','Phú Yên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '46','Quảng Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '47','Quảng Nam'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '48','Quảng Ngãi'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '49','Quảng Ninh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '50','Quảng Trị'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '51','Sóc Trăng'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '52','Sơn La'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '53','Tây Ninh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '54','Thái Bình'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '55','Thái Nguyên'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '56','Thanh Hóa'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '57','Thừa Thiên Huế'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '58','Tiền Giang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '59','Trà Vinh'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '60','Tuyên Quang'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '61','Vĩnh Long'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '62','Vĩnh Phúc'
        );


        INSERT INTO database_web.job_location (
             id,name
        ) VALUES (
           '63','Yên Bái'
        );
        
        INSERT INTO `database_web`.`languages` (`id`, `name`, `quantity`) VALUES ('1', 'Tiếng Anh', '0');
		INSERT INTO `database_web`.`languages` (`id`, `name`, `quantity`) VALUES ('2', 'Tiếng Nhật', '0');
		INSERT INTO `database_web`.`languages` (`id`, `name`, `quantity`) VALUES ('3', 'Tiếng Trung', '0');

		INSERT INTO Level (name, id,quantity) VALUES ('Intern', 1,0);
INSERT INTO Level (name, id,quantity) VALUES ('Fresher', 2,0);
INSERT INTO Level (name, id,quantity) VALUES ('Junior', 3,0);
INSERT INTO Level (name, id,quantity) VALUES ('Middle', 4,0);
INSERT INTO Level (name, id,quantity) VALUES ('Associate', 5,0);
INSERT INTO Level (name, id,quantity) VALUES ('Senior', 6,0);
INSERT INTO Level (name, id,quantity) VALUES ('Lead', 7,0);
INSERT INTO Level (name, id,quantity) VALUES ('Manager', 8,0);
INSERT INTO Level (name, id,quantity) VALUES ('Director', 9,0);
INSERT INTO Level (name, id,quantity) VALUES ('Principal', 10,0);

INSERT INTO Category (name, quantity) VALUES ('Web', 0);
INSERT INTO Category (name, quantity) VALUES ('Android', 0);
INSERT INTO Category (name, quantity) VALUES ('iOS', 0);
INSERT INTO Category (name, quantity) VALUES ('Backend', 0);
INSERT INTO Category (name, quantity) VALUES ('Frontend', 0);
INSERT INTO Category (name, quantity) VALUES ('Machine Learning', 0);
INSERT INTO Category (name, quantity) VALUES ('Data', 0);
INSERT INTO Category (name, quantity) VALUES ('Game', 0);
INSERT INTO Category (name, quantity) VALUES ('Embedded', 0);
INSERT INTO Category (name, quantity) VALUES ('Network', 0);
INSERT INTO Category (name, quantity) VALUES ('Computer Science', 0);
INSERT INTO Category (name, quantity) VALUES ('Software', 0);
INSERT INTO Category (name, quantity) VALUES ('Security', 0);
INSERT INTO Category (name, quantity) VALUES ('Robot', 0);
INSERT INTO Category (name, quantity) VALUES ('Cloud', 0);
INSERT INTO Category (name, quantity) VALUES ('AI', 0);
INSERT INTO Category (name, quantity) VALUES ('Nhúng', 0);
INSERT INTO Category (name, quantity) VALUES ('Bridge', 0);
INSERT INTO Category (name, quantity) VALUES ('Software', 0);
INSERT INTO Category (name, quantity) VALUES ('Designer', 0);
INSERT INTO Category (name, quantity) VALUES ('Scrum', 0);
INSERT INTO Category (name, quantity) VALUES ('BrSE', 0);
INSERT INTO Category (name, quantity) VALUES ('Tester', 0);
INSERT INTO Category (name, quantity) VALUES ('Comtor', 0);


INSERT INTO programming_languages (name, quantity) VALUES ('C', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('C++', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Rust', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Python', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Java', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('JavaScript', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Ruby', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Swift', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Kotlin', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Go', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('TypeScript', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('PHP', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('SQL', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('MATLAB', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('R', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Perl', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Lua', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Shell', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Scala', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Haskell', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Dart', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Objective-C', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Assembly language', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Visual Basic', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Cobol', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Fortran', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Lisp', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Scheme', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Prolog', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('C#', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('HTML', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('CSS', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Shell', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('Assembly', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('.NET', 0);
INSERT INTO programming_languages (name, quantity) VALUES ('IOS', 0);



        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '50000000', '5000000', '0914.779.655', 'hr@emso.vn', 'TUYỂN DỤNG TRƯỞNG NHÓM PHP  LẬP TRÌNH VIÊN REACTJSnCông ty cổ phần EMSO Việt Nam cần tuyển dụngn02 PHP  2 năm Kinh nghiệm Đã từng làm Reactjs biết drupaln02 Reactjs  1 năm Kinh nghiệm ưu tiên có kinh nghiệm xử lý Performance WebnỨng viên nộp CV qua mail vui lòng ghi rõ Apply Trưởng nhóm PHP hoặc LTV ReastjsnLưu ý EMSO có bước lọc và loại CV trước khi gọi PV và chỉ liên hệ đặt lịch phỏng vẫn những CV đạt yêu cầunYêu cầu trong công việcn Trẻ trung đam mê khám phá và sẵn sàng với mọi thử thách mớin Thời gian làm việc Thứ 2  sáng T7 hàng tuầnnSáng 8h3012h  Chiều 14h18h00 75hngàynHồ sơ xin việc vui lòng gửi vền Email hremsovnn Hotline 0914779655Mrs Hiềnn Địa chỉ Toà A2 Thăng Long Garden 250 Minh Khai Hai Bà Trưng Hà Nội', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '0902.591.062', 'tuyendung3.worklink@gmail.com', 'TỔNG HỢP JOB IT KHU VỰC ĐỒNG NAInn Mong được hỗ trợ và kết nối với các AnhChị ứng viên có nhu cầu tìm việc nGửi CV theo cú pháp Vị trí ứng tuyển  Họ và tênn Email tuyendung3worklinkgmailcomn PhoneZalo 0902591062 MsVynn1 Nhân viên IT Software 15  16 triệunĐịa điểm KCN Long Đức  Đồng Nain Nam Nữ 21  28 tuổi tốt nghiệp CĐ ĐHn 1 năm kinh nghiệm phát triển phần mềm thực tến Có kiến thức C vững chắcn Thành thạo HTML CSS JavaScriptn Ưu tiên có kiến thức về Ruby WebAI xamarinnn2 Nhân viên IT lập trình senior 17  20 triệu  PCnĐịa điểm KCN Long Đức  Đồng NainCó xe đưa rước từ Từ Hàng Xanh Ngã tư Thủ Đức Biên Hòa và Bà Rịa  Vũng Tàun Nam 28  40 tuổi tốt nghiệp Đại họcn 3  5 năm kinh nghiệm vị trí IT lập trìnhn Tiếng Anh giao tiếp tốtn Có kiến thức về các framework FrontEnd và BackEndnn3 IT Manager Thỏa thuậnnĐịa điểm KCN Amata  Đồng NainCó xe đưa đón từ Hồ Chí Minhn Nam Nữ tốt nghiệp Đại học trở lênn Tiếng Anh hoặc tiếng Nhật giao tiếpn 10 năm kinh nghiệm trong lĩnh vực ITn Trên 2 năm kinh nghiệm tại vị trí IT Managern Có kinh nghiệm phát triển vận hành và quản lý hệ thống CNTT Quản lý mạng windows và máy chủ', '[]', '1', '5', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '50000000', '5000000', 'Unknown', 'hr@emso.vn', '250 Minh Khai  HN CÔNG TY CỔ PHẦN EMSO VIỆT NAMnTUYỂN DỤNG LẬP TRÌNH VIÊNTHỰC TẬP SINHnMức lương thỏa thuậnnCác ngôn ngữn Thực tập sinh sinh React JS Node Js Ruby PHP Pythonn Lập trình viên React JS  Kinh nghiệm 1 năm ưu tiên có kinh nghiệm xử lý Performance Webn Lập trình viên Flutter  Kinh nghiệm 2 năm có kinh nghiệm xử lý VideonCông việc Làm việc với team Product Design để phát triển các tính năng phục vụ người dùngnYêu cầun Tốt nghiệp đại học hoặc đang là sinh viên đại học năm 4n Có kiến thức lập trình vị trí tương đươngn Có khả năng đọc hiểu tài liệu tiếng anh chuyên ngànhn Có kỹ năng làm việc nhóm tinh thần trách nhiệmnQuyền lợin Được hỗ trợ tùy theo năng lực khi tham gia vào dự ánn Được hưởng các chế độ phúc lợi theo quy địnhn Được làm việc trong môi trường trẻ trung năng động xét duyệt lương định kỳ 2 lầnnămnnThời gian làm việc T2 đến Sáng T7 8h30  12h00 và 14h00  18h00nCV ứng tuyển vui lòng gửi về email hremsovnnBạn nào quan tâm hãy ib mình hoặc để lại cmt bên dưới nhé', '[]', '1', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '50000000', '5000000', 'Unknown', 'talina.hr13@gmail.com', 'TOPJOBTUYỂN DỤNG BACKEND DEVELOPER NODEJS HNn Range lương upto 50 triệu có thể thỏa thuận theo năng lựcn Có từ 5 năm kinh nghiệm sử dụng Nodejs  làm việc với các dự án blockchain n Có kiến thức và kinh nghiệm phát triển hệ thống cơ sở dữ liệu SQL và NoSQLn Có kinh nghiệm về mạng bảo mật xác thực HTTP Basic OAuth  bảo mật và dữ liệu GDPR mã hóa dữ liệun Làm việc tại Cầu Giấy HNnGửi CV qua mail talinahr13gmailcom', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '26000000', '2000000', 'Unknown', 'trinhphp@kalapa.vn', 'Nam Từ Liêm  Hà Nội KALAPA tuyển DATA ENGINEER  2 NĂM KINH NGHIỆM  UPTO 26MILnYêu cầun  2 năm kinh nghiệm DEn Kiến thức về lập trình cấu trúc dữ liệu  giải thuậtn Kiến thức về xây dựng luồng xử lý dữ liệu batch processing stream procesingn Kiến thức về các loại CSDL RDBMS Graph Databases NoSQL Productsn Kỹ năng sử dụng một trong các ngôn ngữ lập trình Java Python SQLnJD chi tiết httpswwwlinkedincomjobsview3840144964nFlex phúc lợi sương sươngnThu nhập cạnh tranh up to 26mil nThưởng quý thưởng KPInBảo hiểm PVI cho nhân viên và người thânnĂn sáng trưa xế không lo nghĩ chỉ cần tập trung làm việc và đi du lịch 3 kỳnămnnĐịa điểm làm việc Tòa Ecolife số 58 Tố Hữu Phường Mễ Trì Quận Nam Từ Liêm Hà NộinThời gian làm việc 800 AM  500 PM T2  T6nCV ứng tuyển gửi về mail trinhphpkalapavn', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'it@mykibbi.com', 'Remote  HCM Xin chào các bạn mình xin chia sẻ cơ hội việc làm hi vọng có thể kế nối cơ hộinnĐể đáp ứng nhu cầu công việc công ty tuyển dụng thêm các vị trí làm việc từ xa cho đội dev MykibbivnnBackend developernSalary Up to 18MnYêu cầun Trên 2 năm KNn Language NodeJS Pythonn Framework NestJS Seleniumn Database PostgreSQLMySQLSQL Servern Server Azure AWSn Tiếng Anh giao tiếp tốtnFrontend Web developernSalary Up to 15MnYêu cầun Trên 2 năm KNn Language ReactJSn Framework MaterialUI Redux GatsbyJSn Tiếng Anh giao tiếp tốtnFullStacknSalary Up to 25MnYêu cầun Trên 2 năm KNn BE Language NodeJS NestJS Python Seleniumn FE Language ReactJSn Database PostgreSQLMySQLSQL Servern Server Azure AWSn Tiếng Anh giao tiếp tốtnBenefitn Môi trường cởi mở thân thiệnn Thời gian và không gian làm việc chủ độngn Có đầy đủ HĐLĐ BHXH theo quy địnhn Có thưởng Bonus khi thực hiện tốt công việcnnCÔNG TY TNHH CÔNG NGHỆ KIBBI VIỆT NAMn Địa chỉ 59 NGUYỄN PHI KHANH P TÂN ĐỊNH Q1 TPHCMn Gửi Cv vị trí ứng tuyển itmykibbicom', '[]', '2', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '20000000', '17000000', '0968 805 725', 'lethu.worklink@gmail.com', 'IT DEVELOPERn3 năm kinh nghiệm  Mức lương 17  20 mil grossnLàm việc tại KCN Long Đức  Đồng Nai Có xe đưa đón từ HCM Biên HòanLập trình phát triển các chức năng hệ thống QLSXnQuản lý CSDLnfrontend frontenddeveloper C SQL javascript phpdeveloper MVCnnGửi CV về mail để được hỗ trợ job phù hợp nhấtn lethuworklinkgmailcomn SĐTZalo 0968 805 725 Thư', '[]', '3', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '35000000', '3000000', '949762242', 'dung.quach@jt1.vn', 'SHORTTERM PROJECT REMOTE FULLTIME PHP DEVELOPER LARAVEL YII2nHi mọi người hiện tại KH bên em đang có nhu cầu tìm kiếm vị trí PHP Developer Laravel Yii2 cho dự án ngắn hạn có tái kýnEm gửi mọi người thông tin phía dưới nhann PHP Developer Laravel Yii2n Ít nhất 4 năm kinh nghiệm làm PHPn Có kinh nghiệm làm Laravel và Yii2n Biết System Oracle Cloud AWSn Tiếng Anh tốtn Thông tin về jobn Remote fulltimen Domain Làm về quản lý bán vé booking systemn Phỏng vấn online 2 vòngn Mức lương Up to 35mil GROSSnnMọi người có thắc mắc gì thì cứ trao đổi với em nhénEmail dungquachjt1vnnSkype quachthudung1997nZalo 0949762242nCảm ơn mọi người đã đọc tin Chúc mọi người buổi tối vui vẻ ạ ', '[]', '4', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '25000000', '2000000', 'Unknown', 'career@topdev.vn', 'HCM Bananalink tuyển dụng Lâp Trinh Viên Bao Mât Linux Linux Security Developer  From 25trn Yêu cầunKinh nghiêm phân tích sư dung Linux tư 3 năm trơ lênnThiết lập hệ thống phản hồi bảo mật thông qua các ngôn ngữ lập trình như Pythonn Đãi ngộnChê đô BHXH  BHYT đây đu theo Luât lao đông Viêt NamnHô trơ phi gưi xe 150000 VNDthang đô ăn nhe tai văn phongnPhep năm thương lê Têt Bonus dưa theo kêt qua lam viêcn Thời gian làm việc T2  T6 8h30  17h30 nghi trưa 1 tiêng 12h  13hn Địa điểm làm việc 720A Điện Biên Phủ Vinhomes Tân Cảng Phường 22 Quận Bình Thạnh Thành phố Hồ Chí MinhnnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Lâp Trinh Viên Bao Mât Linux  Bananalink', '[]', '3', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '077.544.2130', 'tuyendung2.worklink@gmail.com', ' Đồng Nai TUYỂN DỤNG VỊ TRÍ IT SOFTWAREnĐịa điểm  KCN Long Đức  Đồng NainnLƯƠNG TỪ  15 16TRn NamNữ tuổi từ 21 28n Tốt nghiệp CĐĐH chuyên ngành Khoa học máy tính Tin học ứng dụngCông nghệ phần mềmn Ít nhất 1 năm kinh nghiệm phát triển phần mềm thực tến Kiến thức C Windows Form vững chắcn Thành thạo HTML CSS JavaScriptn Có kiến thức về Ruby WebAPI xamarin là lợi thếnnCV ứng tuyển gửi về email với tiêu đề  TÊN  VỊ TRÍ ỨNG TUYỂN  ĐỊA ĐIỂM nMail tuyendung2worklinkgmailcomnZalo 0775442130', '[]', '1', '22', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '30000000', '3000000', 'Unknown', 'dangtracy.hr.recland@gmail.com', 'REVOTECH  HÀ NỘInCông Ty Cổ Phần Phần Mềm REVOTECH tuyển vị trí Lập Trình Viên Java Web FullstacknSố lượng 03nHình thức fulltimennMÔ TẢ CÔNG VIỆCnTham gia xây dựng và phát triển dự án với khách hàng lớn trong nước và quốc tếnTham gia dự án từ Design Code Unit Test Deploy các hệ thống trong các lĩnh vực Giáo dục Y Tế Hải quan Chính phủnThực hiện tối ưu hiệu năng cho các hệ thống đáp ứng khả năng xử lý hàng trăm nghìn sự kiện đồng thờinReview code training cho các bạn có level thấp hơnnnYÊU CẦUnTốt nghiệp Đại học các chuyên ngành liên quan như công nghệ thông tin an toàn thông tin khoa học máy tínhnCó ít nhất từ 03 năm kinh nghiệm thực tế trong lập trình phần mềm về ứng dụng Web với Java full stacknHiểu ngôn ngữ lập trình JavaJ2EE Spring Spring Boot  Kinh nghiệm làm việc với một số loại cơ sở dữ liệu DBMS MS SQL Server Oracle MySQL PostgresKinh nghiệm làm việc với một trong các công nghệ JavaScript AngularJS React VueJS JQuery nnQUYỀN LỢI  PHÚC LỢInMức thu nhập cạnh tranh lên đến 30 triệu đồng tương xứng với vị trí và đóng gópnMột năm xét tăng lương 2 lầnnThưởng dự án thưởng các ngày lễ tết lương tháng thứ 13nCó năng lực sẽ được đánh giá ngay tại thời điểmnTrợ cấp thai sản cho nhân viên nữnTham gia đầy đủ các chế độ BHXH BHYT nĐược nghỉ phép 12 ngày phép năm mà lương vẫn được nhận bình thườngnTham gia các hoạt động của công ty Liên hoan sinh nhật ít nhất 1 thánglần Được đi du xuân 1 năm 1 lần Du lịchTeam building ít nhất 3 ngày 2 đêm 1 năm 2 lần nghỉ dưỡng và các hoạt động khác  Được hỗ trợ cấp phát chăn gối ngủ cốc uống nước cá nhân Chỗ ngủ trưa thoải máinMôi trường làm việc cởi mở dân chủnThời gian làm việc từ thứ 2  thứ 6 8h30  18h00 hoặc 8h00  17h30nCác bạn quan tâm ib mình để nhận full JD hoặc gửi CV theo email dangtracyhrreclandgmailcomnXin cảm ơn', '[]', '3', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '077.544.2130', 'tuyendung2.worklink@gmail.com', ' Đồng Nai TUYỂN DỤNG VỊ TRÍ IT SOFTWAREnĐịa điểm  KCN Long Đức  Đồng NainnLƯƠNG TỪ  15 16TRn NamNữ tuổi từ 21 28n Tốt nghiệp CĐĐH chuyên ngành Khoa học máy tính Tin học ứng dụngCông nghệ phần mềmn Ít nhất 1 năm kinh nghiệm phát triển phần mềm thực tến Kiến thức C Windows Form vững chắcn Thành thạo HTML CSS JavaScriptn Có kiến thức về Ruby WebAPI xamarin là lợi thếnnCV ứng tuyển gửi về email với tiêu đề  TÊN  VỊ TRÍ ỨNG TUYỂN  ĐỊA ĐIỂM nMail tuyendung2worklinkgmailcomnZalo 0775442130', '[]', '1', '22', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '30000000', '3000000', 'Unknown', 'thudt@jobtest.vn', 'HCM_Tân Bình_SENIOR FRONTEND DEVELOPERn Phúc lợin Lương upto 30 mils tùy theo kinh nghiệm và năng lựcn Đóng BHXH đầy đủ theo quy địnhn Thưởng các ngày lễ tết lương tháng 13 lương hiệu suất cv các chế độ phúc lợi khác theo quy định công tyn Nghỉ 1 ngày trong tháng sinh nhậtn Gói bảo hiểm sức khỏe Bảo Việt cho nhân viên làm việc trên 3 thángn Môi trường cởi mở tự chủ trong công việcn Các đề xuất cải tiến nâng cao hiệu quả công việc luôn được xem xét ghi nhậnn Lộ trình thăng tiến rõ ràng review lương 6 tháng lầnn Happy hour team building company tripn Thưởng các ngày lễ lớn trong nămnMô tả công việcn Thiết kế giao diện responsive theo quy trình vận hành của ứng dụngn Code chức năng thao tác người dùng theo yc nghiệp vụ được giao từ Leadern Xử lý dữ liệu đầu vào từ client cho các ứng dụngn Tham gia xây dựng và phát triển các dự án của công tyn Thực hiện xây dựng UI của ứng dụng web app phần mềm hiện đại giàu tương tác với yêu cầu cao về chất lượng và độ tin cậyn Tham gia phân tích thiết kế phát triển và bảo trì ứng dụng phần mềm sẵn cón Chủ động thảo luận nghiên cứu công nghệ áp dụng công nghệ mới vào sản phẩmn Hỗ trợ đồng nghiệp cùng hoàn thiện sản phẩmn Nghiên cứu và lập luận về phương pháp hoặc công nghệ thích hợp để giải quyết vấn đền Đảm bảo tiến độ theo KPI và Task được giaon Chi tiết công việc được trao đổi cụ thể trong quá trình phỏng vấnnnYêu cầu công việcnThành thạo về html  html5 css  css3 javascript jqueryn Thành thạo về bootstrap framework Vuejs 3n Ưu tiên ứng viên có kinh nghiệm làm việc với GraphQL và Mongodbn Có tư duy Logic xử lý dữ liệu backend gửi lên qua API theo tiêu chuẩn có sẵnn Có ý tưởng thiết kế tốt có kiến thức về UXUI designnYc kinh nghiệm từ 2 năm trở lênnĐịa điểm làm việc 18 Ba Vì Phường 4 Tân Bình HCMnThời gian làm việc 8h3017h30 thứ hai  thứ sáun Ứng tuyển gửi CV về mail thudtjobtestvn', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '25000000', '2000000', '9674185330', 'Mai.hoang@hrchannels.com', 'Yên Phong BNinh  HRCHANNELS TÌM KIẾM LẬP TRÌNH SOFTWARE 1525tr Grossn ĐỊA ĐIỂM Yên Trung Yên Phong Bắc Ninhn YÊU CẦUn2 năm kinh nghiệm lập trình Software thành thạo CCnKinh nghiệm làm việc với SQL Server MySQLPostgresqlnMÔ TẢ CÔNG VIỆC Vận hành sửa chữa nâng cấp chương trình cho máy testnnỨng viên quan tâm vui lòng liên hệ qua IB  09674185330  hoặc gửi CV qua email Maihoanghrchannelscom', '[]', '2', '11', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '70000000', '7000000', '0935 010 350', 'thuynguyen.hr06@gmail.com', '1 Từ xa Fulltime Backend Tiếng Anh thông thạo  Upto 70M Grossn Khả năng giao tiếp tốt tiếng Anh và tiếng Việt là phải cón3YOE với Nodejs mạnh với PostgreSQL và TypeScript Tổng cộng 68 năm làm việc với phía hậu phươngnTrải nghiệm với việc tạo ra các hậu phương vi mô từ đầunTrải nghiệm sử dụngchạy hình ảnh Docker thành thạon2 Đà Nẵng Fullstack SymfonyVuejs thông thạo tiếng Anh  Upto 20004000 Grossn 3 5 năm kinh nghiệm chuyên nghiệp với sự tập trung mạnh mẽ vào khung Symfonyn Ít nhất 1 năm kinh nghiệm trong phát triển Vuejsn Kiến thức vững chắc về kiểm tra và kinh nghiệm đơn vị với PHPUnit hoặc các khung kiểm tra tương tựn Thành thạo làm việc với RabbitMQ hoặc các hệ thống hàng đợi tin nhắn khácnnLIÊN HỆnĐiện thoại 0935 010 350nSkype trực tiếp Cid 71d827f8e7116aanEmail thuynguyenhr06gmailcomnĐược dịch từ Tiếng Anh', '[]', '8', '2', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '24000000', '2000000', '564088816', 'vynttgc60349@gmail.com', 'WE ARE HIRING BrSE PO DEV UA FEnBRIDGE SYSTEM ENGINEER BRSE  UPTO 2300 USDnNam Từ Liêm Hà NộinTối thiểu 2 năm kinh nghiệm trong vị trí Trợ Lý Dự Án và Kỹ Sư DevOpsnTiếng Nhật giao tiếp thành thạo N2 trở lênnnSENIOR PRODUCT OWNER  UPTO 2000 USDnThanh Xuân Hà Nộin3 năm kinh nghiệm POPMBA trong mảng EdTechnnSOLUTION IMPLEMENTATION SPECIALIST  UPTO 24 TRIỆU VNDnLê Thánh Tôn Phường Bến Nghé Quận 1 TP Hồ Chí MinhnYêu cầu từ 5 năm kinh nghiệm triển khai phần mềmnnSENIOR USER ACQUISITION  UPTO 20 TRIỆU VNDnCấu Giấy Hà NộinMin 3 năm kinh nghiệm UA gamennFULLSTACK DEVELOPER ANALYTICS  UPTO 65 TRIỆU VNDnVõ Thị Sáu Quận 3 TPHCMnYêu cầu 5 năm KN fullstack Backend dùng Python DjangoFastAPI Frontend dùng AngularnÍt nhất 2 năm với AWSnnFRONTEND DEVELOPER ANALYTICS  UPTO 60 TRIỆU VNDnVõ Thị Sáu Quận 3 TPHCMnYêu cầu 5 năm KN Angular TypeScript và 2 năm với AWSnnIT BRIDGE ENGINEER JAPANESE SPEAKING  UPTO 3000 USDnQuận 1 TPHCMn3 years of experience in Bridge Engineer for IT projectsnnnỨng viên gửi kèm CV về địa chỉ email vynttgc60349gmailcom hoặc zalo 0564088816 với tiêu đề Họ tên  Vị trí ứng tuyển', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '15000000', '1000000', '0899 144 689', 'ndienntm@coway.com.vn', 'Công ty Cổ phần Thương mại Carpa Việt Nam cần tuyển 1 Fullstack DevelopernYêu cầun Biết lập trình web sử dụng tốt JS và jquery Bắt buộcn Có kinh nghiệm về ERP hoặc CRM Bắt buộcn Biết clean code và tối ưu hóa hiệu suấtn Có kinh nghiệm về Java hoặc Nodejs tối thiểu 1 nămnMức lương 15 triệunĐịa chỉ 27B Nguyễn Đình Chiểu Đa Kao Quận 1 HCMnỨng tuyển Gửi CV qua emailndienntmcowaycomvnn0899 144 689 zalo', '[]', '1', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '15000000', '1000000', '0986.216.715 ', 'tuyendung@cpm-vietnam.com', ' CPM Việt Nam cần tuyển LẬP TRÌNH WEB PHP onsite Quận 1  HCMn Thu nhập từ 1015trthángn Địa điểm làm việc Tầng 12 60 Nguyễn Đình Chiểu Đa Kao Quận 1 TPHCMn Yêu cầu tối thiểu kinh nghiệm 1 năm trở lên về lập trình PHP Laravel Symphony am hiểu HTML5CSS ECMA6 và SQL ưu tiên MySQLn Mô tả công việcn Lập trình web trên nền tảng PHPn Xây dựng các ứng dụng web webservicen Làm việc với những dự án mới mang tính sáng tạo đáp ứng yêu cầu khách hàngn Bảo trì nâng cấp phần mềm ứng dụng của công ty theo yêu cầun Tham gia đào tạo trao đổi kinh nghiệm nội bộ đóng góp những kinh nghiệm ý tưởng cũng như giải pháp tốt nhất cho việc phát triển dự ánn QUYỀN LỢInThu nhập cạnh tranh lương tháng 13 thưởng theo hiệu quả công việcnTham gia BHXH BHYT BHTNnTeambuilding khám sức khỏe hằng nămnMôi trường làm việc thân thiện cởi mở trẻ trungnThời gian làm việc thứ 2 thứ 6 9h0018h nghỉ trưa 1hn Ứng viên vui lòng NỘP HỒ SƠ với thông tinnHỌ TÊN  PHP  HCMn Email tuyendungcpmvietnamcomnZalo Hotline 0986216715 or 0919199038', '[]', '1', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '60000000', '6000000', '085 69 38 576', 'Duyennguyen.viecoi@gmail.com', 'Quận 3 HCMn Công ty sản phẩm IT Đứcn Làm việc lai  linh hoạt chỉ 1 ngày ở văn phòngn Yêu cầu nói TIẾNG ANH tốtn1 𝐒𝐞𝐧𝐢𝐨𝐫 𝐒𝐨𝐟𝐭𝐰𝐚𝐫𝐞 𝐄𝐧𝐠𝐢𝐧𝐞𝐞𝐫   80 mil gross  7 years Full Stack Developer
  Excellent programming skills in Java C Python Typescript  JavaScriptn2 Nhà phát triển Phần mềm   60 triệu tổng  Nhà phát triển Full Stack hơn 5 năm  Python JavascriptTypescript NodeJS  trải nghiệm với AWSn3 Nhà phát triển FullStack Cao cấp Angular  Python   5 tuổi 65 triệu tổngn4 Nhà phát triển cấp cao Fullstack C  Angular   5 tuổi 65 triệu grossn5 Nhà phát triển Frontend cao  60 triệu tổng  5 năm kinh nghiệm  Kinh nghiệm dày dặn trong việc phát triển môđun Angularn6 Kỹ sư DevOps   65 triệu tổng  3 năm với Scrum và với tư cách là DevOpsn7 Kỹ sư Đảm bảo Chất lượng   55 triệu tổng  Hơn 4 năm kinh nghiệm kiểm tra hệ thống backend ứng dụng webn Lợi íchn Bảo hiểm y tế tư nhân bao gồm các gói dành cho các thành viên gia đìnhn Thanh toán trọn gói BHXH theo lương chính thức của bạnn Full lương thứ 13  thưởng dao độngn 15 ngày nghỉ  10 lá bệnhn Chính sách Văn phòng Đặc biệtn Chuyến đi công tyn Quà tặng trong các sự kiện đặc biệtn Liên kết nhóm hàng thángn Cung cấp laptop 2 màn hìnhn Ghế Ergonomicnhiring open fullstack hybrid remote IT java angular devops mobile QAnnLiên hệ với tôi để biết thêm thông tinnEmail Duyennguyenviecoigmailcom Ms DuyennĐiện thoại 84 287 3030 707  Ext 1024nZalo 085 69 38 576nSkype trực tiếp Cid a7f8289a10e2fbf0nĐược dịch từ Tiếng Anh', '[]', '5', '5', '0'    
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '15000000', '1000000', '355581410', 'yuetengvina@gmail.com', 'Góc đăng hộnCÔNG TY TNHH YUE TENG VINA BẮC NINH TUYỂN DỤNG 2 VỊ TRÍ ITnVị trí tuyển dụng  Frontend EngineernMức lương 50008000RMB  tương đương 15 triệu 28 triệu VNDnyeu caun1Kinh nghiệm phát triển H5 từ 01 năm trở lênn2 Thành thạo các công nghệ phát triển Web frontend như PHPHTML5CSS3JavaScript bao gồm ES6 và thành thạo Ajax DOM BOM XML JSON và các công nghệ liên quan khácn3 Thành thạo sử dụng khung kỹ thuật trong JqueryVueReactAngularn4 Sử dụng thành thạo các công cụ dành cho nhà phát triển để gỡ lỗi mã Hiểu các nguyên tắc kết xuất trình duyệt Có thể phân tích các yêu cầu và phản hồi của trang thông qua các gói dữ liệun5 Sử dụng thành thạo công cụ xây dựng frontend webpacknMọi người có nhu cầu vui lòng liên hệ Ứng Viên Nộp CV qua Zalo 0355581410 hoặc Gmail yuetengvinagmailcomnĐịa điểm làm việc 92 Võ Thị Sáu Ninh Xá TP Bắc NinhnThanks all', '[]', '1', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '20000000', '2000000', 'Unknown', 'thaibinh@ifa.edu.vn', 'TÂN BÌNH TP HCMnVIỆN QUẢN TRỊ VÀ TÀI CHÍNH TUYỂN DỤNGnHiện tại bên mình đang cần tìm ứng viên vị trí Chuyên viên IT có kiến thức vền Backend Laravel PHP MySQL  Cấu hình server linuxFirebasen Kiến thức frontend Reactjs React Native Native Basen WorkpressnÍt nhất 02 năm kinh nghiệm Ưu tiên có kinh nghiệm trong lĩnh vực ElearningnLương 1220 triệunLàm việc tại Quận Tân Bình TP HCMnGửi CV qua email thaibinhifaeduvnnIb mình để biết thêm chi tiết công việc nhé', '[]', '2', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '46000000', '4000000', '906716238', 'thu.vo@reeracoen.com.vn', 'FRONT END  BACK ENDnAutomation software devnLương up 46 Mil grossnĐịa điểm Bắc Ninh xe đưa rước từ Hà NộinnYÊU CẦUn Tốt nghiệp Đại học ngành ITn 5 năm Kn appliation và web serveruser interface và user experiencen Skills Java Cn Tiếng Anh intermediate levelnnZalo 0906716238nEmail thuvoreeracoencomvn', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '25000000', '2000000', '981447103', 'jennie.ly.chu@hrchannels.com', 'BẮC NINH HRCHANNELS TUYỂN DỤNG NHÂN VIÊN LẬP TRÌNH SOFTWARE  25 TRIỆUn ĐỊA ĐIỂM Yên Phong Bắc Ninhn YÊU CẦU 2 năm kinh nghiệm lập trình Software  thành thạo C CnnỨng viên quan tâm vui lòng liên hệ qua IB  Zalo 0981447103 hoặc gửi CV qua email jennielychuhrchannelscom', '[]', '2', '11', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '60000000', '6000000', 'Unknown', 'thanhpham@freec.asia', 'Hybrid  TPHCM Công ty base Mỹ dự án về quản lý dịch vụ thực phẩm tích hợp ở quận 7 tuyển dụngnProcess phỏng vấn 1 vòng offlinenThời gian làm việc Hybrid 1 ngày WFHtuầnnTiếng Anh thành thạo Tất cả vị trínn1 Ruby Developer  Upto 60 milnTừ 4 năm kinh nghiệm với Ruby on RailsnKinh nghiệm với SQLPostgres Databasen2 Frontend Developer  Upto 50 milnTừ 4 năm kinh nghiệm với Angular React StencilnCó kinh nghiệm build Native appnCó kinh nghiệm Unit testn3 Automation Engineer  Upto 50 milnTừ 5 kinh nghiệm Automation TestnCó kinh nghiệm với Cucumber Appium SeleniumnƯu tiên đã có kinh nghiệm viết BDD bằng CucumberSerenityn4 Scrum Master  Upto 40 milnTừ 2 kinh nghiệm là Scrum MasternCó kinh nghiệm với Jira và ConfluencenƯu tiên có chứng chỉ CSM Scrum Master CerfnnPing me for more informationn Email thanhphamfreecasian Zalo Phone O348 398 092', '[]', '4', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '5000000', '0', 'Unknown', 'hr.vietnam@arbin.com', 'DI AN BINH DUONG sát THU DUC HCMC nCTY ARBIN INSTRUMENTS VIET NAMncần tuyển các vị trí sau nSALARY 1000  2000n1 Middle FrontEnd Developer React Angular n1 Senior Software Testing Engineer C MySQL QA n1 Senior Java Backend Developer J2EE SQL Linux n1 Senior C BackEnd Developer C SQL  aspnet n1 Senior Fullstack Developer J2EE Java Angular nnYêu cầu kinh nghiệm từ 3 năm tốt nghiệp Đại học tiếng Anh khá giỏi Xin vui lòng gửi CV về  hrvietnamarbincom', '[]', '3', '5', '4'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '46000000', '4000000', '906716238', 'thu.vo@reeracoen.com.vn', 'FRONT END  BACK ENDnAutomation software devnLương up 46 Mil grossnĐịa điểm Bắc Ninh xe đưa rước từ Hà NộinnYÊU CẦUn Tốt nghiệp Đại học ngành ITn 5 năm Kn appliation và web serveruser interface và user experience   Skills Java Cn Tiếng Anh intermediate levelnnZalo 0906716238nEmail thuvoreeracoencomvn', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '13000000', '1000000', '0339 588 926 ', 'my.nguyen@shr.com.vn', 'Long Thành ĐỒNG NAI SHR VN  Đối tác là DN sản xuất của Nhật cần tuyển các vị trínNHÂN VIÊN IT Lập trình viên 1113trn Yêu cầun Ứng viên NamNữ 2224 tuổin Tốt nghiệp Đại học ngành CNTTĐiện tử viễn thôngn Am hiểu C Java C Python Ngôn ngữ lập trình Webn Có kinh nghiệm quản lý dữ liệu sản xuất của công ty 13 nămn Tiếng Anh giao tiếp và báo cáo Ưu tiên biết thêm Tiếng Nhậtn Quyền lợin Có xe đưa đónn 13 tháng lương  thưởng 2 lầnnăm mỗi lần khoảng 1 tháng lương  lớp học tiếng Nhật tại công tynnỨng viên quan tâm vui lòng nhắn tin zalo 0339 588 926 để nhận JD chi tiết gửi CV về mail mynguyenshrcomvn', '[]', '3', '22', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '1000000', '0', 'Unknown', 'vi.phan@adecco.com', 'Q7HCM Grab Vietnam đang chờ đợi bạn Senior Backend và Middle Fullstack Developernn1 YÊU CẦUn Có từ 3 năm kinh nghiệm FullstackBackend GO preferedn Mạnh về algorithms và data structuresn Tiếng Anh tốt làm việc với Regionn Khả năng giao tiếp và làm việc nhóm tốtn2 MỨC LƯƠNGnMức lương Upto 101Mn WFH 2 ngàytuầnnĐể biết thêm chi tiết vui lòng ib cho mình hoặc apply CV qua viphanadeccocom', '[]', '3', '5', '4'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '50000000', '5000000', '0914.779.655', 'hr@emso.vn', 'TUYỂN DỤNG TRƯỞNG NHÓM PHP  LẬP TRÌNH VIÊN REACTJSnCông ty cổ phần EMSO Việt Nam cần tuyển dụngn02 PHP  2 năm Kinh nghiệm Đã từng làm Reactjs biết drupaln02 Reactjs  1 năm Kinh nghiệm ưu tiên có kinh nghiệm xử lý Performance WebnỨng viên nộp CV qua mail vui lòng ghi rõ Apply Trưởng nhóm PHP hoặc LTV ReastjsnLưu ý EMSO có bước lọc và loại CV trước khi gọi PV và chỉ liên hệ đặt lịch phỏng vẫn những CV đạt yêu cầunYêu cầu trong công việcn Trẻ trung đam mê khám phá và sẵn sàng với mọi thử thách mớin Thời gian làm việc Thứ 2  sáng T7 hàng tuầnnSáng 8h3012h  Chiều 14h18h00 75hngàynHồ sơ xin việc vui lòng gửi vền Email hremsovnn Hotline 0914779655Mrs Hiềnn Địa chỉ Toà A2 Thăng Long Garden 250 Minh Khai Hai Bà Trưng Hà Nội', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '0902.591.062', 'tuyendung3.worklink@gmail.com', 'TỔNG HỢP JOB IT KHU VỰC ĐỒNG NAInn Mong được hỗ trợ và kết nối với các AnhChị ứng viên có nhu cầu tìm việc nGửi CV theo cú pháp Vị trí ứng tuyển  Họ và tênn Email tuyendung3worklinkgmailcomn PhoneZalo 0902591062 MsVynn1 Nhân viên IT Software 15  16 triệunĐịa điểm KCN Long Đức  Đồng Nain Nam Nữ 21  28 tuổi tốt nghiệp CĐ ĐHn 1 năm kinh nghiệm phát triển phần mềm thực tến Có kiến thức C vững chắcn Thành thạo HTML CSS JavaScriptn Ưu tiên có kiến thức về Ruby WebAI xamarinnn2 Nhân viên IT lập trình senior 17  20 triệu  PCnĐịa điểm KCN Long Đức  Đồng NainCó xe đưa rước từ Từ Hàng Xanh Ngã tư Thủ Đức Biên Hòa và Bà Rịa  Vũng Tàun Nam 28  40 tuổi tốt nghiệp Đại họcn 3  5 năm kinh nghiệm vị trí IT lập trìnhn Tiếng Anh giao tiếp tốtn Có kiến thức về các framework FrontEnd và BackEndnn3 IT Manager Thỏa thuậnnĐịa điểm KCN Amata  Đồng NainCó xe đưa đón từ Hồ Chí Minhn Nam Nữ tốt nghiệp Đại học trở lênn Tiếng Anh hoặc tiếng Nhật giao tiếpn 10 năm kinh nghiệm trong lĩnh vực ITn Trên 2 năm kinh nghiệm tại vị trí IT Managern Có kinh nghiệm phát triển vận hành và quản lý hệ thống CNTT Quản lý mạng windows và máy chủ', '[]', '1', '5', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '50000000', '5000000', 'Unknown', 'hr@emso.vn', '250 Minh Khai  HN CÔNG TY CỔ PHẦN EMSO VIỆT NAMnTUYỂN DỤNG LẬP TRÌNH VIÊNTHỰC TẬP SINHnMức lương thỏa thuậnnCác ngôn ngữn Thực tập sinh sinh React JS Node Js Ruby PHP Pythonn Lập trình viên React JS  Kinh nghiệm 1 năm ưu tiên có kinh nghiệm xử lý Performance Webn Lập trình viên Flutter  Kinh nghiệm 2 năm có kinh nghiệm xử lý VideonCông việc Làm việc với team Product Design để phát triển các tính năng phục vụ người dùngnYêu cầun Tốt nghiệp đại học hoặc đang là sinh viên đại học năm 4n Có kiến thức lập trình vị trí tương đươngn Có khả năng đọc hiểu tài liệu tiếng anh chuyên ngànhn Có kỹ năng làm việc nhóm tinh thần trách nhiệmnQuyền lợin Được hỗ trợ tùy theo năng lực khi tham gia vào dự ánn Được hưởng các chế độ phúc lợi theo quy địnhn Được làm việc trong môi trường trẻ trung năng động xét duyệt lương định kỳ 2 lầnnămnnThời gian làm việc T2 đến Sáng T7 8h30  12h00 và 14h00  18h00nCV ứng tuyển vui lòng gửi về email hremsovnnBạn nào quan tâm hãy ib mình hoặc để lại cmt bên dưới nhé', '[]', '1', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '50000000', '5000000', 'Unknown', 'talina.hr13@gmail.com', 'TOPJOBTUYỂN DỤNG BACKEND DEVELOPER NODEJS HNn Range lương upto 50 triệu có thể thỏa thuận theo năng lựcn Có từ 5 năm kinh nghiệm sử dụng Nodejs  làm việc với các dự án blockchain n Có kiến thức và kinh nghiệm phát triển hệ thống cơ sở dữ liệu SQL và NoSQLn Có kinh nghiệm về mạng bảo mật xác thực HTTP Basic OAuth  bảo mật và dữ liệu GDPR mã hóa dữ liệun Làm việc tại Cầu Giấy HNnGửi CV qua mail talinahr13gmailcom', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '26000000', '2000000', 'Unknown', 'trinhphp@kalapa.vn', 'Nam Từ Liêm  Hà Nội KALAPA tuyển DATA ENGINEER  2 NĂM KINH NGHIỆM  UPTO 26MILnYêu cầun  2 năm kinh nghiệm DEn Kiến thức về lập trình cấu trúc dữ liệu  giải thuậtn Kiến thức về xây dựng luồng xử lý dữ liệu batch processing stream procesingn Kiến thức về các loại CSDL RDBMS Graph Databases NoSQL Productsn Kỹ năng sử dụng một trong các ngôn ngữ lập trình Java Python SQLnJD chi tiết httpswwwlinkedincomjobsview3840144964nFlex phúc lợi sương sươngnThu nhập cạnh tranh up to 26mil nThưởng quý thưởng KPInBảo hiểm PVI cho nhân viên và người thânnĂn sáng trưa xế không lo nghĩ chỉ cần tập trung làm việc và đi du lịch 3 kỳnămnnĐịa điểm làm việc Tòa Ecolife số 58 Tố Hữu Phường Mễ Trì Quận Nam Từ Liêm Hà NộinThời gian làm việc 800 AM  500 PM T2  T6nCV ứng tuyển gửi về mail trinhphpkalapavn', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'it@mykibbi.com', 'Remote  HCM Xin chào các bạn mình xin chia sẻ cơ hội việc làm hi vọng có thể kế nối cơ hộinnĐể đáp ứng nhu cầu công việc công ty tuyển dụng thêm các vị trí làm việc từ xa cho đội dev MykibbivnnBackend developernSalary Up to 18MnYêu cầun Trên 2 năm KNn Language NodeJS Pythonn Framework NestJS Seleniumn Database PostgreSQLMySQLSQL Servern Server Azure AWSn Tiếng Anh giao tiếp tốtnFrontend Web developernSalary Up to 15MnYêu cầun Trên 2 năm KNn Language ReactJSn Framework MaterialUI Redux GatsbyJSn Tiếng Anh giao tiếp tốtnFullStacknSalary Up to 25MnYêu cầun Trên 2 năm KNn BE Language NodeJS NestJS Python Seleniumn FE Language ReactJSn Database PostgreSQLMySQLSQL Servern Server Azure AWSn Tiếng Anh giao tiếp tốtnBenefitn Môi trường cởi mở thân thiệnn Thời gian và không gian làm việc chủ độngn Có đầy đủ HĐLĐ BHXH theo quy địnhn Có thưởng Bonus khi thực hiện tốt công việcnnCÔNG TY TNHH CÔNG NGHỆ KIBBI VIỆT NAMn Địa chỉ 59 NGUYỄN PHI KHANH P TÂN ĐỊNH Q1 TPHCMn Gửi Cv vị trí ứng tuyển itmykibbicom', '[]', '2', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '20000000', '17000000', '0968 805 725', 'lethu.worklink@gmail.com', 'IT DEVELOPERn3 năm kinh nghiệm  Mức lương 17  20 mil grossnLàm việc tại KCN Long Đức  Đồng Nai Có xe đưa đón từ HCM Biên HòanLập trình phát triển các chức năng hệ thống QLSXnQuản lý CSDLnfrontend frontenddeveloper C SQL javascript phpdeveloper MVCnnGửi CV về mail để được hỗ trợ job phù hợp nhấtn lethuworklinkgmailcomn SĐTZalo 0968 805 725 Thư', '[]', '3', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '35000000', '3000000', '949762242', 'dung.quach@jt1.vn', 'SHORTTERM PROJECT REMOTE FULLTIME PHP DEVELOPER LARAVEL YII2nHi mọi người hiện tại KH bên em đang có nhu cầu tìm kiếm vị trí PHP Developer Laravel Yii2 cho dự án ngắn hạn có tái kýnEm gửi mọi người thông tin phía dưới nhann PHP Developer Laravel Yii2n Ít nhất 4 năm kinh nghiệm làm PHPn Có kinh nghiệm làm Laravel và Yii2n Biết System Oracle Cloud AWSn Tiếng Anh tốtn Thông tin về jobn Remote fulltimen Domain Làm về quản lý bán vé booking systemn Phỏng vấn online 2 vòngn Mức lương Up to 35mil GROSSnnMọi người có thắc mắc gì thì cứ trao đổi với em nhénEmail dungquachjt1vnnSkype quachthudung1997nZalo 0949762242nCảm ơn mọi người đã đọc tin Chúc mọi người buổi tối vui vẻ ạ ', '[]', '4', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '25000000', '2000000', 'Unknown', 'career@topdev.vn', 'HCM Bananalink tuyển dụng Lâp Trinh Viên Bao Mât Linux Linux Security Developer  From 25trn Yêu cầunKinh nghiêm phân tích sư dung Linux tư 3 năm trơ lênnThiết lập hệ thống phản hồi bảo mật thông qua các ngôn ngữ lập trình như Pythonn Đãi ngộnChê đô BHXH  BHYT đây đu theo Luât lao đông Viêt NamnHô trơ phi gưi xe 150000 VNDthang đô ăn nhe tai văn phongnPhep năm thương lê Têt Bonus dưa theo kêt qua lam viêcn Thời gian làm việc T2  T6 8h30  17h30 nghi trưa 1 tiêng 12h  13hn Địa điểm làm việc 720A Điện Biên Phủ Vinhomes Tân Cảng Phường 22 Quận Bình Thạnh Thành phố Hồ Chí MinhnnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Lâp Trinh Viên Bao Mât Linux  Bananalink', '[]', '3', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '077.544.2130', 'tuyendung2.worklink@gmail.com', ' Đồng Nai TUYỂN DỤNG VỊ TRÍ IT SOFTWAREnĐịa điểm  KCN Long Đức  Đồng NainnLƯƠNG TỪ  15 16TRn NamNữ tuổi từ 21 28n Tốt nghiệp CĐĐH chuyên ngành Khoa học máy tính Tin học ứng dụngCông nghệ phần mềmn Ít nhất 1 năm kinh nghiệm phát triển phần mềm thực tến Kiến thức C Windows Form vững chắcn Thành thạo HTML CSS JavaScriptn Có kiến thức về Ruby WebAPI xamarin là lợi thếnnCV ứng tuyển gửi về email với tiêu đề  TÊN  VỊ TRÍ ỨNG TUYỂN  ĐỊA ĐIỂM nMail tuyendung2worklinkgmailcomnZalo 0775442130', '[]', '1', '22', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '30000000', '3000000', 'Unknown', 'dangtracy.hr.recland@gmail.com', 'REVOTECH  HÀ NỘInCông Ty Cổ Phần Phần Mềm REVOTECH tuyển vị trí Lập Trình Viên Java Web FullstacknSố lượng 03nHình thức fulltimennMÔ TẢ CÔNG VIỆCnTham gia xây dựng và phát triển dự án với khách hàng lớn trong nước và quốc tếnTham gia dự án từ Design Code Unit Test Deploy các hệ thống trong các lĩnh vực Giáo dục Y Tế Hải quan Chính phủnThực hiện tối ưu hiệu năng cho các hệ thống đáp ứng khả năng xử lý hàng trăm nghìn sự kiện đồng thờinReview code training cho các bạn có level thấp hơnnnYÊU CẦUnTốt nghiệp Đại học các chuyên ngành liên quan như công nghệ thông tin an toàn thông tin khoa học máy tínhnCó ít nhất từ 03 năm kinh nghiệm thực tế trong lập trình phần mềm về ứng dụng Web với Java full stacknHiểu ngôn ngữ lập trình JavaJ2EE Spring Spring Boot  Kinh nghiệm làm việc với một số loại cơ sở dữ liệu DBMS MS SQL Server Oracle MySQL PostgresKinh nghiệm làm việc với một trong các công nghệ JavaScript AngularJS React VueJS JQuery nnQUYỀN LỢI  PHÚC LỢInMức thu nhập cạnh tranh lên đến 30 triệu đồng tương xứng với vị trí và đóng gópnMột năm xét tăng lương 2 lầnnThưởng dự án thưởng các ngày lễ tết lương tháng thứ 13nCó năng lực sẽ được đánh giá ngay tại thời điểmnTrợ cấp thai sản cho nhân viên nữnTham gia đầy đủ các chế độ BHXH BHYT nĐược nghỉ phép 12 ngày phép năm mà lương vẫn được nhận bình thườngnTham gia các hoạt động của công ty Liên hoan sinh nhật ít nhất 1 thánglần Được đi du xuân 1 năm 1 lần Du lịchTeam building ít nhất 3 ngày 2 đêm 1 năm 2 lần nghỉ dưỡng và các hoạt động khác  Được hỗ trợ cấp phát chăn gối ngủ cốc uống nước cá nhân Chỗ ngủ trưa thoải máinMôi trường làm việc cởi mở dân chủnThời gian làm việc từ thứ 2  thứ 6 8h30  18h00 hoặc 8h00  17h30nCác bạn quan tâm ib mình để nhận full JD hoặc gửi CV theo email dangtracyhrreclandgmailcomnXin cảm ơn', '[]', '3', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '077.544.2130', 'tuyendung2.worklink@gmail.com', ' Đồng Nai TUYỂN DỤNG VỊ TRÍ IT SOFTWAREnĐịa điểm  KCN Long Đức  Đồng NainnLƯƠNG TỪ  15 16TRn NamNữ tuổi từ 21 28n Tốt nghiệp CĐĐH chuyên ngành Khoa học máy tính Tin học ứng dụngCông nghệ phần mềmn Ít nhất 1 năm kinh nghiệm phát triển phần mềm thực tến Kiến thức C Windows Form vững chắcn Thành thạo HTML CSS JavaScriptn Có kiến thức về Ruby WebAPI xamarin là lợi thếnnCV ứng tuyển gửi về email với tiêu đề  TÊN  VỊ TRÍ ỨNG TUYỂN  ĐỊA ĐIỂM nMail tuyendung2worklinkgmailcomnZalo 0775442130', '[]', '1', '22', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '0902.591.062', 'tuyendung3.worklink@gmail.com', 'TỔNG HỢP JOB IT KHU VỰC ĐỒNG NAInn Mong được hỗ trợ và kết nối với các AnhChị ứng viên có nhu cầu tìm việc nGửi CV theo cú pháp Vị trí ứng tuyển  Họ và tênn Email tuyendung3worklinkgmailcomn PhoneZalo 0902591062 MsVynn1 Nhân viên IT Software 15  16 triệunĐịa điểm KCN Long Đức  Đồng Nain Nam Nữ 21  28 tuổi tốt nghiệp CĐ ĐHn 1 năm kinh nghiệm phát triển phần mềm thực tến Có kiến thức C vững chắcn Thành thạo HTML CSS JavaScriptn Ưu tiên có kiến thức về Ruby WebAI xamarinnn2 Nhân viên IT lập trình senior 17  20 triệu  PCnĐịa điểm KCN Long Đức  Đồng NainCó xe đưa rước từ Từ Hàng Xanh Ngã tư Thủ Đức Biên Hòa và Bà Rịa  Vũng Tàun Nam 28  40 tuổi tốt nghiệp Đại họcn 3  5 năm kinh nghiệm vị trí IT lập trìnhn Tiếng Anh giao tiếp tốtn Có kiến thức về các framework FrontEnd và BackEndnn3 IT Manager Thỏa thuậnnĐịa điểm KCN Amata  Đồng NainCó xe đưa đón từ Hồ Chí Minhn Nam Nữ tốt nghiệp Đại học trở lênn Tiếng Anh hoặc tiếng Nhật giao tiếpn 10 năm kinh nghiệm trong lĩnh vực ITn Trên 2 năm kinh nghiệm tại vị trí IT Managern Có kinh nghiệm phát triển vận hành và quản lý hệ thống CNTT Quản lý mạng windows và máy chủ', '[]', '1', '5', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '17000000', '1000000', 'Unknown', 'career@topdev.vn', 'HCM Junior Middle STARFRUIT VINA tuyển dụng PHP Developer CodeIgniter Laravel  Offer 17tr25trn Yêu cầunCó tối thiểu 2 năm kinh nghiệm trong lĩnh vực phát triển web applicationnThành thạo ngôn ngữ lập trình PHP Laravel  CodeIgniter Framework Restful APInThành thạo sử dụng cơ sở dữ liệu MySQL  MariaDBn Đãi ngộnĐược đóng đầy đủ lương và bảo hiểm xã hội sau thử việcnQuà tặng sinh nhật đặc biệt và tiền thưởng ngày lễnTiền thưởng hiệu suất để đạt được mục tiêu vvnThời gian làm việcnCa cố định 8 tiếngngàynTuần làm việc 55 ngày  Chuyển sang tuần làm việc 5 ngày cho người lao động siêng năng sau 6 thángn Địa điểm làm việc 37 Đường số 2 Phường An Khánh Thành phố Thủ Đức Thành phố Hồ Chí MinhnnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  PHP Developer  STARFRUIT VINA', '[]', '2', '4', '3'        
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '35000000', '20000000', 'Unknown', 'tuyettta@omigroup.vn', 'Bình Thạnh HCM  Tuyển Ruby On Rails developer Middle trở lên CÓ THỂ với thông tin job như saunThu nhập 2035MnMÔ TẢ CÔNG VIỆCnPhát triển ứng dụng Web sử dụng Ruby on RailsnPhân tích yêu cầu hệ thốngđặc điểm kĩ thuậtnHỗ trợ các thành viên khác để giải quyết các vấn đề kĩ thuậtnChỉnh sửa và bảo trì hệ thốngnViết tài liệu kĩ thuậtnYÊU CẦU CÔNG VIỆCnCó kinh nghiệm làm việc với Ruby on Rails và các thư viện phổ biến như RSpec các gem như Devise sidekiq nCó kiến thức về OOP nắm rõ các khái niệm MVC ORM RESTfulnBiết TDD và CI là một lợi thếnSử dụng tốt các database như MySQL MongoDB RedisnBiết sử dung các công cụ hỗ trợ như GIT redmine các hệ điều hành UNIX là một lợi thếnBiết deployment là một lợi thếnKinh nghiêm Có ít nhất 3 năm kinh nghiệm ở vị trí tương đươngnnAnh chị bạn nào qua tâm đến job có thể ứng tuyển hoặc liên hệ qua mail em nhé tuyetttaomigroupvn', '[]', '3', '5', '4'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', 'Unknown', 'linhnx@zen-s.com', 'THỦ ĐỨC ZENS COMPANY TUYỂN DỤNGn1 TRỢ LÝ KINH DOANH  IELTS 65nMô tả công việcnCó thể làm việc trực tiếp với người MỹnThuyết trình các dự án của Công ty với KháchnYêu cầun IELTS 65 trở lên hoặc các chứng chỉ tương đươngn Có khả năng xây dựng bài thuyết trình kỹ năng nghiên cứu và phân tích tốt tư duy nhạy bén nhanh nhẹn cẩn thận và tỉ mỉ trong công việcn2 FLUTTER DEVELOPERnMô tả công việcnPhát triển ứng dụng di động bằng công nghệ Flutter trên cả Android và iOSnPhối hợp với đội nhóm để hoàn thành công việcnThiết kế xây dựng thư viện tối ưu tính năng đã có của ứng dụngnĐề xuất và thực hiện cải tiến performance UIUX ứng dụngnYêu cầu ứng viênnTối thiểu 1 năm kinh nghiệmnCó base về Android Native là lợi thế lớnnBắt buộc thành thạo state managementnCó kinh nghiệm trong việc triển khai các thư viện thứ banHiểu được nguyên lý API UIUX designnNắm vững Dart  Flutter OOP SOLID Design patternnCó kinh nghiệm với ads là lợi thến3 QUYỀN LỢI CHUNGnLương Thỏa thuận theo năng lực Up to 16MnReview lương 2 lầnnămnCompany trip hàng năm teambuilding hàng tuần tổ chức sinh nhật hàng thángnĐược đóng bảo hiểm theo quy định của pháp luậtnThưởng KPI theo năng lựcnThưởng tết lương tháng 13 theo quy định của Công tynLàm việc 5 ngàytuần hỗ trợ remote khi có trường hợp đặc biệtnMôi trường làm việc năng động thoải mái tích cựcn  Lam việc tại 20 đường 34 Khu Đô Thị Vạn Phúc Thành Phố Thủ Đứcn  Thời gian làm việc  Từ thứ 2 đến thứ 6 Hàng tuần từ 900 sáng đến 1800 chiềunn𝑀𝑜𝑖 𝑡ℎ𝑎𝑐 𝑚𝑎𝑐 𝑥𝑖𝑛 𝑣𝑢𝑖 𝑙𝑜𝑛𝑔 𝑙𝑖𝑒𝑛 ℎ𝑒
n Fb ZenS Company  httpswwwfacebookcomzenscompany n Website httpszenscomn Ứng tuyển bằng cách gửi CV về emailn linhnxzenscomnVới tiêu đề email ứng tuyển CV_TÊN  VỊ TRÍ ỨNG TUYỂN', '[]', '1', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '14000000', '1000000', 'Unknown', 'ntuyetnhi.tuyendung@gmail.com', 'Senior Data Scientist  Asilla Việt NamnGiới thiệu chungnVề công ty Asilla là startup tiên phong trong lĩnh vực trí tuệ nhân tạo tập trung vào công nghệ nhận diện hành vi Sau hơn 7 năm hình thành và phát triển Asilla đã có những bước đi chắc chắn đồng hành cùng hơn 20 khách hàng lớn tại Nhật Bản tạo ra giải pháp công nghệ tương lai và vẫn đang tiếp tục mở rộng kinh doanh sang thị trường Việt Nam và Đông Nam Á Bên cạnh đó công ty cũng xây dựng được sản phẩm riêng ứng dụng AI nhận diện hành vi ứng dụng trong lĩnh vực an ninh Với mục tiêu IPO vào năm 2024 Asilla đang rất mong chờ các bạn kỹ sư có tinh thần khởi nghiệp muốn phát triển và thử thách bản thân trong môi trường quốc tế năng động Gia nhập để trở thành những thành viên chủ chốt của Asilla ngay hôm naynĐịa chỉ Tầng 3 Toà HL Số 6 ngõ 82 Duy Tân Cầu Giấy Hà NộinTrang web công ty httpswwwasillavnnMô tả công việcnWe are participating in the Asilla Product team and helping to build AI projects based on analysis Our product is being used by many customers and getting big logs and data Based on these data we need to find the risk  issue and propose the solution to the product teamnSpecificallynAnalyze issues and risks from the current product and quantify itnAnalyze the data from a variety of perspectivesnGive some ideas based on the analysis to improve the accuracy of the productnReport the analysis with an understandable slidenQuyền lợinCompetitive salary up to 2500n14 months salary a yearnOpportunity to receive Stock OptionnTo fully participate in the regimes prescribed by the State such as social insurance health insurance unemployment insurance and annual leavenBe trained and work directly with experienced experts in the field of AInHave the opportunity to do challenging things develop your full potentialnParticipate in team building sessions have fun monthly with the CompanynEnjoy full benefits Happiness birthdaynYoung comfortable working environment dynamic startup spiritnYêu cầunUniversity degree in Computer Science Data Science IT or equivalentnAt least 3 years of experience working as a Data Scientist or AI engineer positionnHaving a strong background in statistics At least confident in mathematicsnProficient with frameworks Pytorch TensorFlownHaving good knowledge and experience about MLOpsnHaving a good knowledge of visualization capable of using BI tools is a plusnProficient in Python CC programming languagesnGood logical  critical thinking skills hardworking and responsible at worknEffective communication skillsnWork time Monday  FridaynWork location Cau Giay District Ha Noi CitynnNẾU CẢM THẤY PHÙ HỢP HÃY GỬI CV VỀ EMAILntuyetnhituyendunggmailcomnTiêu đề mail TÊN  VỊ TRÍ ỨNG TUYỂN  TÊN CÔNG TY  170', '[]', '7', '3', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '45000000', '30000000', 'Unknown', 'linh.nguyen33@reco-vn.com', 'Hàng loạt các job mới mở tại  HN và HCM em mời mn tham khảo nhé ạ chúc mn đầu năm mới có một công việc mới phù hợp ạnHybrid Tân BìnhHCM MiddleSenior ReactJS Middle min 25 năm KN Senior min 5 năm KN trở lên lên vp 2 ngàytuần TA giao tiếp tốt thử việc full lương offer up to 3045MnHybrid Tân BìnhHCM MiddleSenior Java Middle min 25 năm KN Senior min 5 năm KN trở lên lên vp 2 ngàytuần TA giao tiếp tốt thử việc full lương offer up to 3045MnHybrid Tân BìnhHCM Middle Data Engineer từ 25 năm KN trở lên lên vp ít nhất 1 ngàytuần TA giao tiếp tốt B1 thử việc full lương offer up to 30MnHN Senior Java từ 5 năm KN trở lên TA giao tiếp tốt B1  lương up to 45MnXuân LaHồ Tây Senior Golang từ min 5 năm Golang trở lên TA giao tiếp cơ bản lương up to 38MnXuân LaHồ Tây Senior Front End ReactJS hoặc AngularJS Angular 2 từ min 5 năm KN trở lên TA giao tiếp cơ bản lương up to 38Mn Mn quan tâm có thể ping trực tiếp cho em hoặc gửi CV qua Email linhnguyen33recovncom nhé ạ em cảm ơn', '[]', '5', '3', '4'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '0902.591.062', 'tuyendung3.worklink@gmail.com', 'TỔNG HỢP JOB IT KHU VỰC ĐỒNG NAInn Mong được hỗ trợ và kết nối với các AnhChị ứng viên có nhu cầu tìm việc nGửi CV theo cú pháp Vị trí ứng tuyển  Họ và tênn Email tuyendung3worklinkgmailcomn PhoneZalo 0902591062 MsVynn1 Nhân viên IT Software 15  16 triệunĐịa điểm KCN Long Đức  Đồng Nain Nam Nữ 21  28 tuổi tốt nghiệp CĐ ĐHn 1 năm kinh nghiệm phát triển phần mềm thực tến Có kiến thức C vững chắcn Thành thạo HTML CSS JavaScriptn Ưu tiên có kiến thức về Ruby WebAI xamarinnn2 Nhân viên IT lập trình senior 17  20 triệu  PCnĐịa điểm KCN Long Đức  Đồng NainCó xe đưa rước từ Từ Hàng Xanh Ngã tư Thủ Đức Biên Hòa và Bà Rịa  Vũng Tàun Nam 28  40 tuổi tốt nghiệp Đại họcn 3  5 năm kinh nghiệm vị trí IT lập trìnhn Tiếng Anh giao tiếp tốtn Có kiến thức về các framework FrontEnd và BackEndnn3 IT Manager Thỏa thuậnnĐịa điểm KCN Amata  Đồng NainCó xe đưa đón từ Hồ Chí Minhn Nam Nữ tốt nghiệp Đại học trở lênn Tiếng Anh hoặc tiếng Nhật giao tiếpn 10 năm kinh nghiệm trong lĩnh vực ITn Trên 2 năm kinh nghiệm tại vị trí IT Managern Có kinh nghiệm phát triển vận hành và quản lý hệ thống CNTT Quản lý mạng windows và máy chủ', '[]', '1', '5', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '12000000', '965635825', 'Unknown', ' Nguyễn Trãi  Thanh Xuân mình cần tuyển 01 code web từ 2 năm kinh nghiệmnoffer  12M  18Mn Lương tháng 13 hưởng thâm niên các loại thưởng khácnYêu cầu n Có kinh nghiệm từ 2 năm trong ngôn ngữ lập trình Web  HTML CSS n code được các tính năng tương tác của landing page coding websiten Có khả năng làm việc độc lậpnliên hệ ứng tuyển nZalo call 0965635825nHoặc ib trực tiếp cho mình', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '15000000', '1000000', 'Unknown', 'info@ztech.asia', 'TUYỂN DỤNG  VỊ TRÍ  FRESHER REACT NATIVEnCÔNG TYnLương Min 9 triệunMô tả công việcnTham gia vào các dự án về phát triển phần mềm của công tynPhối hợp với các thành viên trong team nghiên cứu phát triển những tính năng của appnTạo giao diện người dùng đáp ứng để truy vấn dữ liệu một cách hiệu quả và tối ưunChi tiết sẽ trao đổi cụ thể khi phỏng vấnnYêu cầu ứng viênnƯu tiên ứng viên đã có ít nhất 6 tháng đến 1 năm kinh nghiệm React NativenCó kinh nghiệm lập trình native Android IOSnCó kinh nghiệm build và public ứng dụng lên playstore appstorenNắm vững kiến thức về JavaScript RESTful APInCó kinh nghiệm làm việc với Google Cloud Service Firebase Service nHiểu biết về một số quy trình phát triển phần mềm như scrum agile nCó khả năng học hỏi nhanh tích cực và chủ động trong công việc Khả năng làm việc độc lập và làm việc nhóm tốtnQuyền lợina Thu nhậpnTrao đổi deal thỏa đáng theo năng lực upto lên đến 15 triệunThưởng nóng thưởng mỗi dự ánnXét tăng lương tùy vào năng lựcnb Bảo hiểm và các chính sách đãi ngộnBảo hiểm theo chế độ nhà nước ban hànhnChế độ sinh nhật hiếu hỉnc Môi trường làm việcnLàm việc trong tập thể toàn những người trẻ năng động cá tính máu lửa và nhiệt huyết trong công việcnMôi trường làm việc mở khuyến khích tối đa sự sáng tạo của nhân viênnd Thời gian làm việcnLàm việc từ thứ 2  thứ 6 thứ 7 cách tuầnnThời gian linh hoạt  8 tiếng  ngàynnLiên hệ gửi CVnIb trực tiếpnEmail infoztechasianĐịa chỉ 35 Đường Số 3 KDC Cityland Phường 10 Gò Vấp Thành phố Hồ Chí Minh', '[]', '1', '5', '2'       
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '16000000', '1000000', '0902.591.062', 'tuyendung3.worklink@gmail.com', 'TỔNG HỢP JOB IT KHU VỰC ĐỒNG NAInn Mong được hỗ trợ và kết nối với các AnhChị ứng viên có nhu cầu tìm việc nGửi CV theo cú pháp Vị trí ứng tuyển  Họ và tênn Email tuyendung3worklinkgmailcomn PhoneZalo 0902591062 MsVynn1 Nhân viên IT Software 15  16 triệunĐịa điểm KCN Long Đức  Đồng Nain Nam Nữ 21  28 tuổi tốt nghiệp CĐ ĐHn 1 năm kinh nghiệm phát triển phần mềm thực tến Có kiến thức C vững chắcn Thành thạo HTML CSS JavaScriptn Ưu tiên có kiến thức về Ruby WebAI xamarinnn2 Nhân viên IT lập trình senior 17  20 triệu  PCnĐịa điểm KCN Long Đức  Đồng NainCó xe đưa rước từ Từ Hàng Xanh Ngã tư Thủ Đức Biên Hòa và Bà Rịa  Vũng Tàun Nam 28  40 tuổi tốt nghiệp Đại họcn 3  5 năm kinh nghiệm vị trí IT lập trìnhn Tiếng Anh giao tiếp tốtn Có kiến thức về các framework FrontEnd và BackEndnn3 IT Manager Thỏa thuậnnĐịa điểm KCN Amata  Đồng NainCó xe đưa đón từ Hồ Chí Minhn Nam Nữ tốt nghiệp Đại học trở lênn Tiếng Anh hoặc tiếng Nhật giao tiếpn 10 năm kinh nghiệm trong lĩnh vực ITn Trên 2 năm kinh nghiệm tại vị trí IT Managern Có kinh nghiệm phát triển vận hành và quản lý hệ thống CNTT Quản lý mạng windows và máy chủ', '[]', '1', '5', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '17000000', '1000000', 'Unknown', 'career@topdev.vn', 'HCM Junior Middle STARFRUIT VINA tuyển dụng PHP Developer CodeIgniter Laravel  Lương 17tr25trn Yêu cầunCó tối thiểu 2 năm kinh nghiệm trong lĩnh vực phát triển web applicationnThành thạo ngôn ngữ lập trình PHP Laravel  CodeIgniter Framework Restful APInThành thạo sử dụng cơ sở dữ liệu MySQL  MariaDBn Đãi ngộnĐược đóng đầy đủ lương và bảo hiểm xã hội sau thử việcnQuà tặng sinh nhật đặc biệt và tiền thưởng ngày lễnTiền thưởng hiệu suất để đạt được mục tiêu vvn Thời gian làm việcnCa cố định 8 tiếngngàynTuần làm việc 55 ngày  Chuyển sang tuần làm việc 5 ngày cho người lao động siêng năng sau 6 thángn Địa điểm làm việc 37 Đường số 2 Phường An Khánh Thành phố Thủ Đức Thành phố Hồ Chí MinhnnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  PHP Developer  STARFRUIT VINA', '[]', '2', '4', '3'       
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '20000000', '2000000', '961886219', 'tuyendung@vietpanpacific.com', 'MỸ ĐÌNH  HÀ NỘInVăn phòng PAN PACIFIC cần tuyển 1 vị trí FrontEnd Dev JavaScriptn Công việc Phát triển mới và bảo trì hệ thống quản lý thời trang OEM Web Oracle DBn YÊU CẦUn1 ít nhất 1 năm kinh nghiệm về ngôn ngữ JavaScriptn2 Kinh nghiệm SQL Select Update Delete Insert Management Tablen3 Bằng Cử nhân Khoa học Máy tính hoặc lĩnh vực liên quann4 Tiếng anh chuyên ngành cơ bảnn QUYỀN LỢIn1 Mức lương thương lượng up to 20Mn2 Lương tháng 13 đóng BHXH đầy đủn3 Thử việc 2 tháng hưởng 100 lươngn4 12 ngày phép năm nghỉ Lễ Tếtn5 Các chế độ phúc lợi đầy đủ theo Luật Lao Độngn LIÊN HỆnMọi người có thể gửi CV ứng tuyển về đcnEmail tuyendungvietpanpacificcomnĐTZalo 0961886219 Ms Dung', '[]', '1', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '15000000', '1000000', 'Unknown', 'career@topdev.vn', 'Hà Nội DTN SOFTWARE SOLUTIONS tuyển dụng Java Developer  Offer 15tr25trn Yêu cầunCó từ 2 năm kinh nghiệm làm việc với Java trở lênnThành thạo các framework java như Spring Struts là 1 lợi thếnCó kinh nghiệm làm việc với các công cụ hỗ trợ phát triển phần mềm như Git Jiran Đãi ngộnThưởng theo dự án lên tới 3 tháng lương mỗi năm và thưởng tháng thứ 13nXét tăng lương hàng nămnĐược đóng bảo hiểm theo quy định của Luật lao độngnHỗ trợ ăn trưa gửi xe miễn phín Thời gian làm việc Từ thứ 2 đến thứ 6 Sáng 9h0011h45 Chiều 13h0018h00n Địa điểm làm việc B12B02 khu đô thị Vinhomes Gardenia đường Hàm Nghi Phường Cầu Diễn Quận Nam Từ Liêm Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Java Developer  DTN', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '2000000', '0', 'Unknown', 'career@topdev.vn', 'Q7HCM Alephon tuyển dụng Software Engineer Analyst CJavaScript or CC SQL  Offer 6001000n Yêu cầun2 năm kinh nghiệm về ít nhất một trong các ngôn ngữ lập trình sau C JavaScript hoặc CCn2 năm kinh nghiệm về SQLnTiếng Anh tốt nói  viếtnĐãi ngộnĐược đảm bảo lương tháng 13nReview lương 2 lầnnămnCung cấp đầy đủ trang thiết bịn Thời gian làm việc Thứ 2  Thứ 6 8h3017h30n Địa điểm làm việc Office 906 Paragon Building 3 Nguyễn Lương Bằng Phường Tân Phú Quận 7 Thành phố Hồ Chí MinhnnGửi CV tiếng Anh về careertopdevvnnTiêu đề Mail  Họ tên  Software Engineer Analyst  Alephon', '[]', '2', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '33000000', '3000000', 'Unknown', 'hr@pt-corp.vn', 'CẦU GIẤY MÌNH CẦN TUYỂN GẤP 1 MOBILE DEV FLUTTERn Mô tả công việcnXây dựng ứng dụng di động phù hợp với dự án của công tynXây dựng mobile app bằng Flutter để ứng dụng chạy trên nền tảng Android hoặc iOSnNghiên cứu và phân tích nghiệp vụ sản phẩm theo nhu cầu của khách hàngnĐề xuất và hiện thực giải pháp khắc phục vấn đề performance cải tiến UIUX của ứng dụngn Yêu cầu ứng viênnTừ 15  2 năm kinh nghiệm với Flutter Từng làm dự án lĩnh vực EducationnCó kiến thức tốt về OOP Data Structures Algorithm UIUXnCó kinh nghiệm làm việc với backend Restful APInCó kinh nghiệm làm việc trên hệ thống quản lý source code Gitnn Ứng tuyểnnGửi CV về mail hrptcorpvnnTiêu đề Họ tên_ Vị trí ứng tuyểnnnCÔNG TY CỔ PHẦN TMDV  CÔNG NGHỆ PTCORPnĐịa chỉ 33 Trung Kính Trung Hoà Cầu Giấy Hà Nội', '[]', '2', '3', '0'      
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '20000000', '2000000', '962376506', 'thu.hipvietnam@gmail.com', 'KCN Thăng Long1  HÀ NỘI Công ty sản xuất của NhậtnTUYỂN NHÂN VIÊN ITnLương 15 20TRnMÔ TẢ CÔNG VIỆCn Quản trị phòng server cập nhật phiên bản window thiết bị backup dữ liệu servern Quản trị mạng máy tính lắp đặt di dời sửa chữa máy tính toàn công tyn Quản trị cơ sở dữ liệu web xin phép onlinewebsite bao gồm cập nhật và update dữ liệu nếu cón Quản trị hệ thống camera phần mềm trạm cânn Lắp đặt di dời sửa chữa camera đường dây điện thoạin Quản lý License win server License win 10 và License Kaperskyn Các công việc khác do cấp trên giao phónYÊU CẦUn Nam tốt nghiệp Cao Đẳng trở lên nghành công nghệ thông tinn 23 năm kinh nghiệm vị trí tương đươngn Biết lập trình phần mềm ngôn ngữ lập trình C CSS HTML javascript ajaxnLH thuhipvietnamgmailcomnZalo 0962376506', '[]', '3', '3', '0'     
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS tuyển dụng Trưởng Phòng Lập Trình  Lương 18tr30trn Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUS', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'Hà Nội MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  Lương 18tr30trn Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUS', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '15000000', '1000000', 'Unknown', 'career@topdev.vn', 'Hà Nội DTN SOFTWARE SOLUTIONS tuyển dụng Java Developer  Lương 15tr25trn Yêu cầunCó từ 2 năm kinh nghiệm làm việc với Java trở lênnThành thạo các framework java như Spring Struts là 1 lợi thếnCó kinh nghiệm làm việc với các công cụ hỗ trợ phát triển phần mềm như Git Jiran Đãi ngộnThưởng theo dự án lên tới 3 tháng lương mỗi năm và thưởng tháng thứ 13nXét tăng lương hàng nămnĐược đóng bảo hiểm theo quy định của Luật lao độngnHỗ trợ ăn trưa gửi xe miễn phín Thời gian làm việc Từ thứ 2 đến thứ 6 Sáng 9h0011h45 Chiều 13h0018h00n Địa điểm làm việc B12B02 khu đô thị Vinhomes Gardenia đường Hàm Nghi Phường Cầu Diễn Quận Nam Từ Liêm Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Java Developer  DTN', '[]', '2', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  18tr30trn Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUSnLink JD httpstopdevvnssG276KUO', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  18tr30trn Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUSnLink JD httpstopdevvnssG276KUO', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  18tr30trn Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏenĐịa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUSnLink JD httpstopdevvnssG276KUO', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'Hà Nội MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  18tr30trn Yêu cầunCó ít nhất 5 năm kinh nghiệm lập trình trong đó có ít nhất 1 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUSnLink JD httpstopdevvns8Wr42OGJ', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  18Mil30Miln Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUSnLink JD httpstopdevvns8Wr42OGJ', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '20000000', '2000000', 'Unknown', 'kieu@doxa.cafe', 'TPHCM QUẬN 2 CẦN TUYỂN CÁC VỊ TRÍn1 MidSenior FrontendnYêu cầun Có ít nhất 01 năm kinh nghiệm frontend phát triển ứng dụng web ReactJS  NextJS Typescript HTML5CSS Tailwind CSS Git SVN n Có khả năng sử dụng tiếng Anh trong công việcn Có kinh nghiệm phát triển các ứng dụng web nội bộ và khách hàngn Đảm bảo tính khả thi về mặt kỹ thuật của thiết kế UIUXn Có khả năng chuyển các yêu cầu kinh doanh sang các giải pháp kỹ thuậtnPhúc lợin Lương 10  20 triệuthángn Team buildingn Training hàng tuần về phát triển sản phẩmn Thưởngn Macbook monitor được cung cấpn Bữa trưa và bữa ăn nhẹn2  Internship FullstacknYêu cầun Sinh viên năm 3 hoặc năm 4 tại các trườngkhoa có ngành máy tính hoặc các ngành liên quan Hoặc những sinh viên năm 2 có những kiến thức cơ bản được liệt kê bên dướin Sinh viên có kiến thức cơ bản về cấu trúc dữ liệu và giải thuật lập trình hướng đối tượng kiến trúc máy tính hệ cơ sở dữ liệu mạng máy tính và truyền thôngn Có kiến thức về ngôn ngữ Javascript Typescript HTML CSS framework ReactJS NextJS TailwindCSS NodeJS cơ sở dữ liệu Sqlite PSQL Figma Miro BoardnPhúc lợin Phụ cấp 1trthángn Ăn sáng ăn trưa cafe mỗi ngàyn Được đào tạo bài bản và làm việc trong môi trường thực tến Có cơ hội làm việc chính có lương sau 3 thángnĐịa chỉ làm việc 12 đường 12 Phường An Khánh Tp Thủ Đức Tp HCMnỨng viên quan tâm inbox mình hoặc gửi CV về mail kieudoxacafe', '[]', '1', '5', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '80000000', '8000000', '0911 3908 27', 'ntuongvi.viecoi@gmail.com', 'Quận 3 HCMC Tuyển dụng Senior Software Engineer JavaCPython  tiếng anh tốtnOffer  80 mil grossnThời gian làm việc linh động chế độ làm việc hybridnYêu cầun Tiếng anh giao tiếp lưu loát làm việc với team Globaln Tối thiểu 7 năm kinh nghiệm Full Stack Developern Kinh nghiệm 5 năm trở lên với Java CPython Typescriptn Kinh nghiệm làm việc với AWSnBenefitsn Phụ cấp ngoài lươngn Quà sinh nhật quà lễ TếtnMôi trường làm việc thoải mái hybrid khi pass probationnTeambuilding hằng nămnBH trên mức full lươngnPremium healthcarenKhám sức khỏe hằng nămnReview lương hằng nămnLương tháng 13nBonus hằng nămnnĐể trao đổi thông tin chi tiết và ứng tuyển vui lòng gửi mail với tiêu đề Tên _ Vị trí ứng tuyểnntuongviviecoigmailcomnSkype tuongvitvnZalo 0911 3908 27 Ms Vi', '[]', '7', '5', '6'       
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  Range Lương 18tr30trn Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUSnLink JD httpstopdevvnsnPnGG45z', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '65000000', '6000000', '0911 3908 27', 'ntuongvi.viecoi@gmail.com', 'Quận 3 HCMC Tuyển dụng Senior Fullstack Developer Java  Angular  Tiếng anh tốtnOffer  65 mil grossnThời gian làm việc linh động chế độ làm việc hybridnYêu cầun Tiếng anh giao tiếp lưu loát làm việc với team globaln Tối thiểu 7 năm kinh nghiệm Software Developern Kinh nghiệm strong với Java Angularn Có kinh nghiệm với MySQL DynamoDBnBenefitsn Phụ cấp ngoài lươngn Quà sinh nhật quà lễ Tếtn Môi trường làm việc thoải mái hybrid khi pass probationn Teambuilding hằng nămn BH trên mức full lươngn Premium healthcaren Khám sức khỏe hằng nămn Review lương hằng nămn Lương tháng 13n Bonus hằng nămnnĐể trao đổi thông tin chi tiết và ứng tuyển vui lòng gửi mail với tiêu đề Tên _ Vị trí ứng tuyểnntuongviviecoigmailcomnSkype tuongvitvnZalo 0911 3908 27 Ms Vi', '[]', '7', '5', '6'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '25000000', '2000000', '0941.697.782', 'ntgiangnhaphangchina.hr@gmail.com', 'Tuyển dụng LẬP TRÌNH VIÊNnPhỏng vấn ngay đi làm luôn hoặc sau Tếtnn1 Số lượng 01 namnn2 Mô tả công việcn Phát triển các sản phẩm của công tyn Xây dựng code có thể sử dụng lại và các thư viện để thuận tiện cho việc sử dụng trong tương lain Thu thập và xử lí các yêu cầu thiết kế và kĩ thuậtn Tham gia vào quá trình phân tích và thiết kế hệ thốngn Nghiên cứu và áp dụng các công nghệ mới để tối ưu hóa hiệu quả phát triển sản phẩmn Đảm bảo sản phẩm làm ra cần phải chạy đúng nghiệp vụ và tốc độ xử lý cũng phải tối ưu cho lượng người dùng lớnn Cải tiến nâng cao chất lượng các dự án hiện cónn3 Yêu cầu ứng viênn Tốt nghiệp các trường ĐH CĐ chuyên ngành CNTT Khoa học máy tính hoặc chuyên ngành có liên quann Có ít nhất 01 năm kinh nghiệm ở vị trí tương đương với các ngôn ngữ NetNodeJSPHPn Sử dụng tốt các công cụ quản lý source code SVN GITn Có kiến thức về OOP UML Design pattern hiểu biết về UIUXn Có kiến thức về CSDL SQL và NoSQLn Có kinh nghiệm về Frontend và Devops là một điểm cộng lớnnn4 Chê độn Lương 25 triệu  PC có thể deal thêm theo năng lựcn BHXH lương tháng 13 liên hoan du lịch thưởng lễ đầy đủnn5 Thời gian làm việcn Từ thứ 2 đến hết thứ 7 8h12h 13h3017h30n Địa chỉ làm việc IP3 Imperial 360 Giải PhóngnnỨng viên vui lòng gửi CV về địa chỉ mailntgiangnhaphangchinahrgmailcomnTiêu đề ghi rõ Họ và tên_Nhân viên ITnnMọi thông tin thắc mắc vui lòng liên hệnTạ Giang 0941697782', '[]', '1', '4', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '80000000', '8000000', '035 30 69 077', 'minhthunguyen.viecoi@gmail.com', ' HYBRID HCM CHÚNG TÔI ĐANG TÌM KIẾM KỸ SƯ RUBY TRÊN RAILS  LÊN ĐẾN 80M GROSS  nMô tả công việcn Thiết kế và phát triển dịch vụ có thể làm một lượng dữ liệu lớnn Thiết kế cơ sở dữ liệu tốt xem xét các yêu cầu chức năng và không chức năngn Viết mã sạch và có thể duy trìn Cải thiện mã bằng cách phản ứng liên tụcn Giám sát hiệu suất ứng dụng và khắc phục lỗi hệ thốngn Đào tạo thành viên trẻgiữanYêu cầunPhải cón Từ 35 năm kinh nghiệm phát triển với Ruby on Railsn Hiểu tốt về các nguyên tắc CHẮC CHẮN các mẫu thiết kế thông dụng và cách làm tốt nhấtn Trải nghiệm vững chắc với MySQL hoặc PostgreSQL bao gồm điều chỉnh hiệu suất và tối ưu hóan Trải nghiệm với kiến trúc hệ thống phức tạp bao gồm liên kết API với hệ thống bên ngoàin Trải nghiệm với việc giám sát và tối ưu hóa hiệu suất ứng dụngn Trải nghiệm kiểm tra tự động hóa kiểm tra E2En Kiến thức sâu rộng về bảo mật webn Sự quen thuộc với CICD Dockern Tiếng Anh giao tiếpn Ý thức sở hữu mạnh mẽnTuyệtCóĐẹpn Trải nghiệm với Amazon Web Servicesn Trải nghiệm với vận hành dịch vụ về sản xuấtn Kinh nghiệm với phát triển friend TypeScript ReactJSVueJSnnLiên hệ với tôi để biết thêm thông tinnEmail minhthunguyenviecoigmailcom Ms ThunZalo 035 30 69 077nSkype trực tiếp Cid 9bbb59e064d9058anĐược dịch từ Tiếng Anh', '[]', '5', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '20000000', '2000000', 'Unknown', 'Hungcr1612@gmail.com', 'CÔNG TY NHẬT TẠI KCN THĂNG LONG 1  ĐÔNG ANH GẦN ĐƯỜNG PHẠM VĂN ĐỒNG CÓ XE ĐƯA ĐÓN TỪ NỘI THÀNH HÀ NỘI CẦN TUYỂN NHÂN VIÊN ITnnYêu cầu công việcn Nam tốt nghiệp Cao Đẳng trở lên ngành công nghệ thông tinn 2  3 năm kinh nghiệm vị trí tương đươngn Biết lập trình phần mềm ngôn ngữ lập trình C CSS HTML javascript ajaxnnMô tả công việcn Quản trị phòng server cập nhật phiên bản windonw thiết bị backup dữ liệu servern Quản trị mạng máy tính lắp đặt di dời sửa chữa máy tính toàn công tyn Quản trị cơ sở dữ liệu web xin phép onlinewebsite bao gồm cập nhật và update dữ liệu nếu cón Quản trị hệ thống camera phần mềm trạm cânn Lắp đặt di dời sửa chữa camera đường dây điện thoạin Quản lý License win server License win 10 và License Kaperskyn Các công việc khác do cấp trên giao phónnLương 20 triệu grossnCV tiếng Việt gửi về mail Hungcr1612gmailcom', '[]', '3', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '25000000', '2000000', 'Unknown', 'maihien.le@careerlink.vn', 'Embedded Software Developer Tiếng Nhật  Bình Thạnh Lương 25 triệu  38 triệunCAREERLINKS CLIENTn Địa điểm làm việc Quận Bình Thạnh Hồ Chí Minhn Nộp đơn ngay httpswwwcareerlinkvntimvieclamembeddedsoftwaredevelopertiengnhatqbinhthanh2753062nMô tả công việcn Phát triển phần mềm nhúng điều khiển động cơ ô tôn Mã hóa các chương trình đã được thiết kế kiểm tra và gỡ lỗi test và debug trong tương lai có thể thiết kế lập trìnhn Thời gian làm việc T2T6 8001700n Chỉ nhận CV đến ngày 29012024nKinh nghiệm  Kỹ năng chi tiếtn Tốt nghiệp Cao Đẳng Đại Học các chuyên ngành liên quann Ngôn ngữ lập trình MATLAB Simulink C C vvn Khả năng về ngôn ngữ tiếng Nhật trình độ N4 trở lên hiểu được bảng vẽ bằng tiếng nhậtn Kinh nghiệm 34 năm kinh nghiệm phát triển phần mềm nhúng bằng MatlabSimulink và có kỹ năng tạo tài liệu thiết kế phần mềm thiết kế kiến trúc thiết kế chi tiếtn Ưu tiên các ứng viên có kinh nghiệm phát tiển phần mềm nhúng liên quan đến CN ô tôn Vui lòng gửi hồ sơ bằng ngôn ngữ Tiếng Nhật file Word qua email maihienlecareerlinkvnn Số điện thoại 0912120719 gặp Ms Mai Hiền', '[]', '4', '5', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  18Mil30Miln Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUS', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '18000000', '1000000', 'Unknown', 'career@topdev.vn', 'HN MOBIFONE PLUS  tuyển dụng Trưởng Phòng Lập Trình  18tr30trn Yêu cầunCó ít nhất 05 năm kinh nghiệm lập trình trong đó có ít nhất 01 năm ở vị trí trưởng nhómnCó kinh nghiệm triển khai backend API Restful kết nối và phục vụ trao đổi dữ liệu giữa các hệ thốngnCó kiển thức về Frontend HTML CSS Javan Đãi ngộnThu nhập tùy theo năng lực và kinh nghiệm 1718 tháng lươngnămnĐược hưởng các chế độ về BHXH BHYT BHTN và các chế độ khác theo quy định của Công tynĐóng bảo hiểm xã hội bảo hiểm sức khỏen Địa điểm làm việc Tầng 3A tòa nhà Harec số 4A Láng Hạ Phường Thành Công Quận Ba Đình Thành phố Hà NộinnGửi CV về careertopdevvnnTiêu đề Mail  Họ tên  Trưởng Phòng Lập Trình  MOBIFONE PLUS', '[]', '5', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '50000000', '5000000', '0974 334 688 ', 'Unknown', 'Hà Nội Product dự án về Blockchain tuyển Backend Engineer Python  Công ty giải mã gen có trụ sở tại US Singapore HCM và HNnLevel từ 4 năm kinh nghiệmnPhúc lợi up to 50M  bảo hiểm full  20 ngày phépnămnĐịa điểm Cầu Giấy Hà NộinQuy trình phỏng vấn nhanh nhẹnnAce quan tâm vui lòng liên hệ qua Zalo 0974 334 688 or inbox mình nhénMany thanks', '[]', '4', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '15000000', '1000000', '963139231', 'hongluyen.hr@gmail.com', ' Thành Thái Cầu Giấy   Sao Bạc nTìm kiếm nhân sự PHP_LARAVELn1_năm_kinh_nghiệmnQuyền lợin Mức lương 1215 triệu đồngtháng tuỳ vào kinh nghiệm và năng lực của ứng viên  Thưởng KPInThưởng tháng 13 thưởng LễTết thưởng hiệu quả kinh doanh của ctyn Thử việc 1  2 tháng nhận 100 lương cứngn Môi trường làm việc thân thiện trẻ trung năng độngn Một năm du lịch 2 lần trong và ngoài nướcn Được traning công việc rõ ràng cụ thể và chi tiết khi vào làmnYêu cầun Kinh nghiệm  1 năm làm việc với PHP và Laraveln Có laptop cá nhânn Sử dụng thành thạo các công nghệ web như HTML CSS và JavaScriptn Kinh nghiệm làm việc với cơ sở dữ liệu MySQL hoặc các hệ quản trị cơ sở dữ liệu khácn Kinh nghiệm tích hợp các dịch vụ của bên thứ ba thông qua APIn Làm việc với Livewire và Tailwind CSS là một lợi thế lớnnThời gian 9h  12h30 14h  18h từ T2  T6 FulltimenĐịa điểm N09B2 Thành Thái Cầu Giấy Hà NộinEmail ứng tuyển gửi về hongluyenhrgmailcomnTiêu đề SAO BẠC_PHPnLiên hệ Zalo call  0963139231 Hồng Luyện', '[]', '1', '3', '0'
        );


        INSERT INTO database_web.recruitment_post (
            max_salary, min_salary, phone_number, email, content, images, experience, location_id, level_id
        ) VALUES (
           '30000000', '3000000', 'Unknown', 'thudt@jobtest.vn', 'HCM_Tân Bình_SENIOR FRONTEND DEVELOPERn Phúc lợin Lương upto 30 mils tùy theo kinh nghiệm và năng lựcn Đóng BHXH đầy đủ theo quy địnhn Thưởng các ngày lễ tết lương tháng 13 lương hiệu suất cv các chế độ phúc lợi khác theo quy định công tyn Nghỉ 1 ngày trong tháng sinh nhậtn Gói bảo hiểm sức khỏe Bảo Việt cho nhân viên làm việc trên 3 thángn Môi trường cởi mở tự chủ trong công việcn Các đề xuất cải tiến nâng cao hiệu quả công việc luôn được xem xét ghi nhậnn Lộ trình thăng tiến rõ ràng review lương 6 tháng lầnn Happy hour team building company tripn Thưởng các ngày lễ lớn trong nămnMô tả công việcn Thiết kế giao diện responsive theo quy trình vận hành của ứng dụngn Code chức năng thao tác người dùng theo yc nghiệp vụ được giao từ Leadern Xử lý dữ liệu đầu vào từ client cho các ứng dụngn Tham gia xây dựng và phát triển các dự án của công tyn Thực hiện xây dựng UI của ứng dụng web app phần mềm hiện đại giàu tương tác với yêu cầu cao về chất lượng và độ tin cậyn Tham gia phân tích thiết kế phát triển và bảo trì ứng dụng phần mềm sẵn cón Chủ động thảo luận nghiên cứu công nghệ áp dụng công nghệ mới vào sản phẩmn Hỗ trợ đồng nghiệp cùng hoàn thiện sản phẩmn Nghiên cứu và lập luận về phương pháp hoặc công nghệ thích hợp để giải quyết vấn đền Đảm bảo tiến độ theo KPI và Task được giaon Chi tiết công việc được trao đổi cụ thể trong quá trình phỏng vấnnnYêu cầu công việcnThành thạo về html  html5 css  css3 javascript jqueryn Thành thạo về bootstrap framework Vuejs 3n Ưu tiên ứng viên có kinh nghiệm làm việc với GraphQL và Mongodbn Có tư duy Logic xử lý dữ liệu backend gửi lên qua API theo tiêu chuẩn có sẵnn Có ý tưởng thiết kế tốt có kiến thức về UXUI designnYc kinh nghiệm từ 2 năm trở lênnĐịa điểm làm việc 18 Ba Vì Phường 4 Tân Bình HCMnThời gian làm việc 8h3017h30 thứ hai  thứ sáun Ứng tuyển gửi CV về mail thudtjobtestvn', '[]', '2', '3', '0'
        );
        
        
        
                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('83', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('84', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('84', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('85', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('86', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('87', '7');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('88', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('88', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('88', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('89', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('90', '15');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('91', '13');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('92', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('92', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('93', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('94', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('94', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('95', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('95', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('95', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('96', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('96', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('97', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('98', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('98', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('98', '8');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('98', '18');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('98', '22');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('99', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('100', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('101', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('101', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('101', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('101', '21');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('102', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('103', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('103', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('104', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('104', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('104', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('105', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('105', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('106', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('106', '21');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('107', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('107', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('107', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('108', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('108', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('108', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('109', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('110', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('110', '7');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('111', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('112', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('112', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('113', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('114', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('115', '7');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('116', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('116', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('116', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('117', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('118', '15');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('119', '13');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('120', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('120', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('121', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('122', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('122', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('123', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('123', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('124', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('125', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('126', '2');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('126', '3');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('127', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('127', '7');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('127', '11');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('127', '16');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('128', '7');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('129', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('129', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('130', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('131', '2');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('131', '3');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('131', '15');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('131', '21');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('132', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('132', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('133', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('134', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('135', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('135', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('136', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('136', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('137', '2');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('137', '3');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('137', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('137', '7');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('138', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('139', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('140', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('141', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('141', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('142', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('143', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('144', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('145', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('146', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('147', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('147', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('148', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('148', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('149', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('150', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('150', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('151', '5');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('152', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('153', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('154', '9');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('154', '12');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('154', '17');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('154', '19');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('155', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('156', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('157', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('158', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('159', '1');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('159', '4');


                INSERT INTO database_web.post_category (post_id, category_id)
                VALUES ('159', '5');




				INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('83', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('84', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('84', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('84', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('84', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('84', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('85', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('85', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('85', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('86', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('87', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('87', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('87', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('88', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('88', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('89', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('89', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('89', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('90', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('91', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('91', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('92', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('92', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('92', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('92', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('92', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('93', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('93', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('93', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('94', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('94', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('94', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('94', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('94', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('95', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('95', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('95', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('95', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('96', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('96', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('97', '11');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('98', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('98', '11');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('99', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('100', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('100', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('100', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('101', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('101', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('101', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('101', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('101', '11');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('102', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('102', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('103', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('104', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('104', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('105', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('106', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('106', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('107', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('107', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('107', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('107', '35');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('108', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('108', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('109', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('109', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('109', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('110', '10');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('111', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('112', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('112', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('112', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('112', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('112', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('113', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('113', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('113', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('114', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('115', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('115', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('115', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('116', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('116', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('117', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('117', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('117', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('118', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('119', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('119', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('120', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('120', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('120', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('120', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('120', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('121', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('121', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('121', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('122', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('122', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('122', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('122', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('122', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('123', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('123', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('123', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('123', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('123', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('124', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('125', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('126', '21');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('126', '36');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('127', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('127', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('128', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('129', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('129', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('129', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('129', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('129', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('130', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('130', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('131', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('131', '36');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('132', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('132', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('132', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('132', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('132', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('133', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('134', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('134', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('134', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('135', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('136', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('136', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('136', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('137', '36');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('138', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('138', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('138', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('138', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('139', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('139', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('139', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('140', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('140', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('140', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('141', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('142', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('142', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('142', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('143', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('143', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('143', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('144', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('144', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('144', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('145', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('145', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('145', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('146', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('146', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('146', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('147', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('147', '11');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('147', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('147', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('148', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('148', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('148', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('148', '11');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('149', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('149', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('149', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('150', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('151', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('151', '13');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('152', '7');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('152', '11');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('153', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('153', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('153', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('153', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('154', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('154', '14');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('155', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('155', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('155', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('156', '5');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('156', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('156', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('157', '4');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('158', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('158', '12');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('158', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('158', '32');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('159', '1');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('159', '6');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('159', '31');


                INSERT INTO database_web.post_programming_languages (post_id, programming_languages_id)
                VALUES ('159', '32');
                
                
                
                
                
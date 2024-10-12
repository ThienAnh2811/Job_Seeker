CREATE TABLE user_type (
	user_type_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	user_typename VARCHAR(20)
);

CREATE TABLE user_acccount (
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	user_type_id INT,
	FOREIGN KEY (user_type_id) REFERENCES user_type (user_type_id),
	email VARCHAR(100) NOT NULL,
	data_of_birth DATE 
	CHECK (data_of_birth <= CAST(GETDATE() AS DATE)),
	gender BIT NOT NULL DEFAULT 1,
	is_active BIT NOT NULL DEFAULT 1,
	sdt VARCHAR (10) 
	CHECK (LEN(sdt) = 10 AND sdt NOT LIKE '%[^0-9]%') NOT NULL,
	sms_notification_active BIT NOT NULL DEFAULT 1,
	email_notification_active BIT NOT NULL DEFAULT 1,
	regis_date DATE DEFAULT GETDATE()
	CHECK (regis_date <= GETDATE()),
	last_login_date DATE,
	last_job_apply_date DATE,
);


CREATE TABLE company (
	id_company INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	company_name VARCHAR(100) NOT NULL,
	profile_description VARCHAR(500),
	business_stream_name VARCHAR(100),
	establishment_date DATE NOT NULL
	CHECK (establishment_date <= GETDATE()),
	company_url VARCHAR(500) NOT NULL,
);
-- SQL schema for recruitment_portal (initial)
CREATE DATABASE IF NOT EXISTS recruitment_portal DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE recruitment_portal;

CREATE TABLE IF NOT EXISTS candidates (
  candidate_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  phone VARCHAR(50),
  education VARCHAR(255),
  skills TEXT,
  resume_path VARCHAR(512),
  active TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS employers (
  employer_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  company_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  industry VARCHAR(255),
  website VARCHAR(255),
  active TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS jobs (
  job_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  employer_id BIGINT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  location VARCHAR(255),
  salary VARCHAR(255),
  skills_required TEXT,
  experience_required VARCHAR(255),
  deadline DATETIME,
  active TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employer_id) REFERENCES employers(employer_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS applications (
  application_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  candidate_id BIGINT NOT NULL,
  job_id BIGINT NOT NULL,
  status VARCHAR(50) DEFAULT 'Applied',
  applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id) ON DELETE CASCADE,
  FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS admins (
  admin_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL
);

-- insert default admin (username: admin, password: admin123)
INSERT INTO admins (username, password_hash)
SELECT 'admin', '$2a$12$Jj2wq3nK1qC4yq7fWw8O6O6jWq9G1n8ZQe2xq1a9bYx3m4n5o6p7' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM admins WHERE username = 'admin');

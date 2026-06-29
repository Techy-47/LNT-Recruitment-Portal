# PRD - Career Opportunities and Recruitment Management Portal

## 1. Project Overview

### Project Name

Career Opportunities and Recruitment Management Portal

### Project Type

Web-Based Recruitment and Placement Management System

### Technology Stack

#### Backend

* Java 17+
* JSP
* Servlets
* JDBC
* Maven

#### Database

* MySQL 8+

#### Frontend

* HTML5
* CSS3
* Bootstrap 5
* JavaScript

#### Server

* Apache Tomcat 10

---

# 2. Problem Statement

Organizations require a centralized platform for managing job postings and recruitment activities.

Job seekers need a portal where they can:

* Create profiles
* Upload resumes
* Search jobs
* Apply for jobs
* Track application status

Employers need a portal where they can:

* Post jobs
* Manage applicants
* Review applications
* Update recruitment status

Administrators require complete system control and analytics.

---

# 3. User Roles

## Candidate

Capabilities:

* Register account
* Login
* Manage profile
* Upload resume
* Search jobs
* Apply to jobs
* Track applications
* View application status

---

## Employer

Capabilities:

* Register company account
* Login
* Create company profile
* Post jobs
* Edit jobs
* Delete jobs
* View applicants
* Update application status

---

## Admin

Capabilities:

* Login
* Manage candidates
* Manage employers
* Manage jobs
* View reports
* View analytics dashboard
* Deactivate users

---

# 4. Functional Requirements

## Authentication Module

### Candidate Registration

Fields:

* Full Name
* Email
* Password
* Phone Number
* Skills
* Education

Validation:

* Email must be unique
* Password minimum 8 characters

---

### Employer Registration

Fields:

* Company Name
* Email
* Password
* Industry
* Website

Validation:

* Unique email
* Unique company name

---

### Login Module

Features:

* Candidate Login
* Employer Login
* Admin Login
* Session Management
* Logout

---

# 5. Candidate Module

## Candidate Dashboard

Display:

* Total Applications
* Active Applications
* Shortlisted Applications
* Rejected Applications

---

## Profile Management

Features:

* View Profile
* Edit Profile
* Upload Resume
* Update Skills

---

## Job Search

Filters:

* Job Title
* Company
* Location
* Skills

---

## Apply Job

Workflow:

Candidate
→ Select Job
→ Apply
→ Application Created

Status:

Applied

---

## Application Tracking

Possible Status:

* Applied
* Under Review
* Shortlisted
* Interview Scheduled
* Selected
* Rejected

---

# 6. Employer Module

## Employer Dashboard

Display:

* Total Jobs Posted
* Active Jobs
* Total Applications
* Shortlisted Candidates

---

## Job Management

Features:

* Create Job
* Edit Job
* Delete Job
* Close Job

Fields:

* Job Title
* Description
* Location
* Salary
* Skills Required
* Experience Required
* Deadline

---

## Applicant Management

Features:

* View Applicants
* Download Resume
* Change Status
* Search Applicants

---

# 7. Admin Module

## Dashboard Metrics

Display:

* Total Candidates
* Total Employers
* Total Jobs
* Total Applications

---

## User Management

Features:

* Activate User
* Deactivate User
* Delete User

---

## Job Monitoring

Features:

* View All Jobs
* Remove Invalid Jobs

---

## Reports

Generate:

* Candidate Report
* Employer Report
* Job Report
* Application Report

---

# 8. Non-Functional Requirements

## Security

* Password Hashing
* Prepared Statements
* SQL Injection Prevention
* Session Validation
* Input Validation

---

## Performance

* Page load under 3 seconds
* Optimized SQL Queries
* Pagination for job listings

---

## Scalability

Design architecture using:

* DAO Pattern
* MVC Pattern
* Service Layer

---

# 9. Database Design

Database Name:

recruitment_portal

---

## Table: candidates

Fields:

* candidate_id (PK)
* full_name
* email
* password_hash
* phone
* education
* skills
* resume_path
* created_at

---

## Table: employers

Fields:

* employer_id (PK)
* company_name
* email
* password_hash
* industry
* website
* created_at

---

## Table: jobs

Fields:

* job_id (PK)
* employer_id (FK)
* title
* description
* location
* salary
* skills_required
* experience_required
* deadline
* created_at

---

## Table: applications

Fields:

* application_id (PK)
* candidate_id (FK)
* job_id (FK)
* status
* applied_at

---

## Table: admins

Fields:

* admin_id (PK)
* username
* password_hash

---

# 10. Relationships

Employer
1 → Many Jobs

Candidate
1 → Many Applications

Job
1 → Many Applications

Application
Many → One Candidate

Application
Many → One Job

---

# 11. Architecture

MVC Architecture

Controller Layer

* LoginServlet
* RegisterServlet
* JobServlet
* ApplicationServlet
* EmployerServlet

Service Layer

* AuthService
* CandidateService
* EmployerService
* JobService
* ApplicationService

DAO Layer

* CandidateDAO
* EmployerDAO
* JobDAO
* ApplicationDAO

Database Layer

* MySQL

---

# 12. Project Structure

RecruitmentPortal/

src/main/java/

controller/

* LoginServlet.java
* RegisterServlet.java
* JobServlet.java
* ApplicationServlet.java

service/

* AuthService.java
* CandidateService.java
* EmployerService.java
* JobService.java

dao/

* CandidateDAO.java
* EmployerDAO.java
* JobDAO.java
* ApplicationDAO.java

model/

* Candidate.java
* Employer.java
* Job.java
* Application.java

util/

* DBConnection.java

src/main/webapp/

candidate/

* dashboard.jsp
* profile.jsp
* jobs.jsp
* applications.jsp

employer/

* dashboard.jsp
* post-job.jsp
* applicants.jsp

admin/

* dashboard.jsp
* reports.jsp

auth/

* login.jsp
* register.jsp

css/
js/

---

# 13. UI Requirements

Theme:

* Modern Professional
* Clean Dashboard Design
* Bootstrap 5

Colors:

* Primary: #0D6EFD
* Secondary: #6C757D
* Success: #198754

Design Requirements:

* Fully Responsive
* Mobile Friendly
* Sidebar Navigation
* Dashboard Cards
* Search Filters
* Data Tables

---

# 14. Future Enhancements

* Email Notifications
* Interview Scheduling
* AI Resume Screening
* Resume Parsing
* Skill Matching Engine
* Placement Analytics
* Chat System
* OTP Authentication

---

# 15. Development Milestones

Phase 1

* Database Design
* Maven Setup
* JDBC Setup

Phase 2

* Authentication Module

Phase 3

* Candidate Module

Phase 4

* Employer Module

Phase 5

* Application Management

Phase 6

* Admin Dashboard

Phase 7

* Reports

Phase 8

* Testing and Deployment

---

# Success Criteria

The project will be considered successful if:

* Candidates can register and apply for jobs
* Employers can post and manage jobs
* Admin can manage the platform
* Data is stored in MySQL
* All CRUD operations work correctly
* Reports are generated successfully
* Application status tracking works end-to-end
* Project follows MVC architecture and JDBC best practices

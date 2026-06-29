# Recruitment Portal

Minimal scaffold for the Career Opportunities and Recruitment Management Portal.

Build and run:

1. Create the database using `sql/create_db.sql` and update DB credentials in `DBConnection.java`.
2. Build the WAR: `mvn clean package`.
3. Deploy the generated WAR to Apache Tomcat 10.

Local toolchain in this repo:

If Maven/Java are not installed globally, this repository supports a local setup in `.tools/`.

PowerShell example:

```powershell
$env:JAVA_HOME = (Resolve-Path .tools\jdk-17.0.12+7).Path
$env:Path = "$env:JAVA_HOME\bin;" + $env:Path
.\.tools\apache-maven-3.9.9\bin\mvn.cmd -B -DskipTests package
```

Docker (recommended):

1. Install Docker and Docker Compose.
2. Copy `.env.example` to `.env` and adjust values if needed.
3. Run:

```bash
docker-compose up --build
```

This starts MySQL and the Tomcat-hosted webapp on `http://localhost:8080`.

Windows helper scripts:

```powershell
.\scripts\docker-build.ps1
.\scripts\docker-up.ps1
.\scripts\docker-down.ps1
```

The database schema is initialized automatically from `sql/create_db.sql` the first time the MySQL volume is created.

CI:

A GitHub Actions workflow is included at `.github/workflows/maven.yml` to build the project on push.

Admin reporting:

- Admin reports page: `/admin/reports`
- Downloadable CSV report types:
	- `/admin/reports?type=candidates`
	- `/admin/reports?type=employers`
	- `/admin/reports?type=jobs`
	- `/admin/reports?type=applications`

Role-based route protection:

- Candidate routes: `/candidate/*` require `candidateId` in session.
- Employer routes: `/employer/*` require `employerId` except login/register endpoints.
- Admin routes: `/admin/*` require `adminId` except admin login.

Notes:
- This scaffold implements candidate registration end-to-end as a starting point.

Admin:

1. Visit `/admin/login` to log in as an administrator. A default admin user `admin` is inserted by the schema (password hashed — change it after first login).
2. The admin UI includes dashboards for metrics, user management (`/admin/users`) and job monitoring (`/admin/jobs`).

Security note: Change default admin password and secure the application before production.

Deployment files:

- `Dockerfile`
- `docker-compose.yml`
- `.dockerignore`
- `.env.example`
- `scripts/docker-up.ps1`
- `scripts/docker-down.ps1`
- `scripts/docker-build.ps1`

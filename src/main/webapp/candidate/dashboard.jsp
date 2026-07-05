<%@ page contentType="text/html;charset=UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Candidate Dashboard</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">

        <style>
            * {
                font-family: 'Poppins', sans-serif;
            }

            body {

                background: #F4F7FC;

            }

            .header-card {

                margin-top: 40px;

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

                border-radius: 22px;

                padding: 40px;

                box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

            }

            .header-card h2 {

                font-weight: 700;

                margin-bottom: 10px;

            }

            .header-card p {

                opacity: .9;

                margin-bottom: 0;

            }

            .stat-card {

                border: none;

                border-radius: 18px;

                padding: 25px;

                box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                transition: .3s;

                height: 100%;

            }

            .stat-card:hover {

                transform: translateY(-5px);

            }

            .stat-icon {

                font-size: 35px;

                color: #2563EB;

                margin-bottom: 15px;

            }

            .quick-card {

                border: none;

                border-radius: 18px;

                box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                transition: .3s;

                text-decoration: none;

                color: #212529;

                display: block;

                padding: 30px;

                height: 100%;

            }

            .quick-card:hover {

                transform: translateY(-6px);

                text-decoration: none;

                color: #2563EB;

            }

            .quick-card i {

                font-size: 40px;

                margin-bottom: 20px;

                color: #2563EB;

            }

            .quick-card h5 {

                font-weight: 600;

            }

            .logout-btn {

                border-radius: 12px;

                padding: 10px 25px;

            }

            .section-title {

                font-weight: 700;

                margin: 40px 0 25px;

            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="header-card">

                <div class="row align-items-center">

                    <div class="col-md-8">

                        <h2>

                            Welcome, ${sessionScope.candidateName} 👋

                        </h2>

                        <p>

                            Discover new opportunities, manage your applications, and keep your profile updated.

                        </p>

                    </div>

                    <div class="col-md-4 text-end">

                        <i class="bi bi-person-workspace display-1"></i>

                    </div>

                    

                </div>

            </div>

            <div class="row mt-4">

                <div class="col-md-4">

                    <div class="stat-card text-center">

                        <div class="stat-icon">

                            <i class="bi bi-file-earmark-check"></i>

                        </div>

                        <h6 class="text-muted">

                            Applications Submitted

                        </h6>

                        <h2>

                            ${totalApplications}

                        </h2>

                    </div>

                </div>

            </div>

            <h3 class="section-title">

                Quick Actions

            </h3>

            <div class="row g-4 mb-5">

                <div class="col-md-4">

                    <a class="quick-card" href="${pageContext.request.contextPath}/job-details">

                        <i class="bi bi-search"></i>

                        <h5>Browse Jobs</h5>

                        <p class="text-muted">

                            Explore the latest job opportunities.

                        </p>

                    </a>

                </div>

                <div class="col-md-4">

                    <a class="quick-card" href="${pageContext.request.contextPath}/my-applications">

                        <i class="bi bi-folder-check"></i>

                        <h5>My Applications</h5>

                        <p class="text-muted">

                            Track every application you've submitted.

                        </p>

                    </a>

                </div>

                <div class="col-md-4">

                    <a class="quick-card" href="${pageContext.request.contextPath}/candidate-profile">

                        <i class="bi bi-person-vcard"></i>

                        <h5>My Profile</h5>

                        <p class="text-muted">

                            View your complete candidate profile.

                        </p>

                    </a>

                </div>

<!-- 
                <div class="col-md-4">

                    <a class="quick-card" href="${pageContext.request.contextPath}/candidate/upload-resume.jsp">

                        <i class="bi bi-file-earmark-arrow-up"></i>

                        <h5>Upload Resume</h5>

                        <p class="text-muted">

                            Upload or replace your latest resume.

                        </p>

                    </a>

                </div> -->

                <div class="col-md-4">

                    <a class="quick-card" href="${pageContext.request.contextPath}/logout">

                        <i class="bi bi-box-arrow-right"></i>

                        <h5>Logout</h5>

                        <p class="text-muted">

                            Securely sign out from your account.

                        </p>

                    </a>

                </div>

            </div>

        </div>

    </body>

    </html>
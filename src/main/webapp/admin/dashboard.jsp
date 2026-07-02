<%@ page contentType="text/html;charset=UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Admin Dashboard</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

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

            .hero {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

                border-radius: 24px;

                padding: 35px 40px;

                margin: 35px 0;

                box-shadow: 0 18px 40px rgba(37, 99, 235, .25);

            }

            .hero h2 {

                font-weight: 700;

                margin-bottom: 8px;

            }

            .hero p {

                margin-bottom: 0;

                opacity: .9;

            }

            .logout-btn {

                border-radius: 30px;

            }

            .stat-card {

                border: none;

                border-radius: 20px;

                transition: .3s;

                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                overflow: hidden;

            }

            .stat-card:hover {

                transform: translateY(-6px);

            }

            .icon-circle {

                width: 65px;

                height: 65px;

                border-radius: 50%;

                display: flex;

                align-items: center;

                justify-content: center;

                color: white;

                font-size: 28px;

            }

            .blue {

                background: #2563EB;

            }

            .green {

                background: #10B981;

            }

            .orange {

                background: #F59E0B;

            }

            .red {

                background: #EF4444;

            }

            .section-title {

                font-size: 24px;

                font-weight: 600;

                color: #1F2937;

                margin-bottom: 20px;

            }

            .action-card {

                background: white;

                border: none;

                border-radius: 18px;

                padding: 28px;

                text-align: center;

                transition: .3s;

                text-decoration: none;

                color: #111827;

                box-shadow: 0 8px 20px rgba(0, 0, 0, .08);

                display: block;

                height: 100%;

            }

            .action-card:hover {

                transform: translateY(-5px);

                color: #2563EB;

            }

            .action-card i {

                font-size: 40px;

                margin-bottom: 15px;

                color: #2563EB;

            }

            .status-card {

                background: white;

                border: none;

                border-radius: 20px;

                padding: 30px;

                box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

            }

            .status-item {

                display: flex;

                align-items: center;

                margin-bottom: 15px;

                font-size: 16px;

            }

            .status-item i {

                color: #22C55E;

                margin-right: 12px;

                font-size: 20px;

            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="hero">

                <div class="d-flex justify-content-between align-items-center flex-wrap">

                    <div>

                        <h2>

                            <i class="bi bi-speedometer2 me-2"></i>

                            Admin Dashboard

                        </h2>

                        <p>

                            Welcome back,

                            <strong>${sessionScope.adminUser}</strong>

                            Manage the Recruitment Portal from one place.

                        </p>

                    </div>

                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-light logout-btn">

                        <i class="bi bi-box-arrow-right me-2"></i>

                        Logout

                    </a>

                </div>

            </div>


            <div class="row g-4">

                <div class="col-lg-3 col-md-6">

                    <div class="card stat-card">

                        <div class="card-body d-flex justify-content-between align-items-center">

                            <div>

                                <small class="text-muted">

                                    Candidates

                                </small>

                                <h2 class="fw-bold">

                                    ${totalCandidates}

                                </h2>

                            </div>

                            <div class="icon-circle blue">

                                <i class="bi bi-people-fill"></i>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-lg-3 col-md-6">

                    <div class="card stat-card">

                        <div class="card-body d-flex justify-content-between align-items-center">

                            <div>

                                <small class="text-muted">

                                    Employers

                                </small>

                                <h2 class="fw-bold">

                                    ${totalEmployers}

                                </h2>

                            </div>

                            <div class="icon-circle green">

                                <i class="bi bi-buildings-fill"></i>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-lg-3 col-md-6">

                    <div class="card stat-card">

                        <div class="card-body d-flex justify-content-between align-items-center">

                            <div>

                                <small class="text-muted">

                                    Jobs

                                </small>

                                <h2 class="fw-bold">

                                    ${totalJobs}

                                </h2>

                            </div>

                            <div class="icon-circle orange">

                                <i class="bi bi-briefcase-fill"></i>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-lg-3 col-md-6">

                    <div class="card stat-card">

                        <div class="card-body d-flex justify-content-between align-items-center">

                            <div>

                                <small class="text-muted">

                                    Applications

                                </small>

                                <h2 class="fw-bold">

                                    ${totalApplications}

                                </h2>

                            </div>

                            <div class="icon-circle red">

                                <i class="bi bi-file-earmark-text-fill"></i>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="mt-5">

                <h3 class="section-title">

                    Quick Actions

                </h3>

                <div class="row g-4">

                    <div class="col-md-3">

                        <a href="${pageContext.request.contextPath}/admin/candidates" class="action-card">

                            <i class="bi bi-people-fill"></i>

                            <h5>Manage Candidates</h5>

                            <p class="text-muted mb-0">

                                View and manage registered candidates.

                            </p>

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a href="${pageContext.request.contextPath}/admin/employers" class="action-card">

                            <i class="bi bi-buildings-fill"></i>

                            <h5>Manage Employers</h5>

                            <p class="text-muted mb-0">

                                View registered employers.

                            </p>

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a href="${pageContext.request.contextPath}/admin/jobs" class="action-card">

                            <i class="bi bi-briefcase-fill"></i>

                            <h5>Manage Jobs</h5>

                            <p class="text-muted mb-0">

                                View, edit and remove jobs.

                            </p>

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a href="${pageContext.request.contextPath}/admin/reports" class="action-card">

                            <i class="bi bi-bar-chart-fill"></i>

                            <h5>Reports</h5>

                            <p class="text-muted mb-0">

                                Analytics and recruitment reports.

                            </p>

                        </a>

                    </div>

                </div>

            </div>


            <div class="mt-5 mb-5">

                <h3 class="section-title">

                    Platform Status

                </h3>

                <div class="status-card">

                    <div class="status-item">

                        <i class="bi bi-check-circle-fill"></i>

                        Database Connected

                    </div>

                    <div class="status-item">

                        <i class="bi bi-check-circle-fill"></i>

                        Resume Storage Active

                    </div>

                    <div class="status-item">

                        <i class="bi bi-check-circle-fill"></i>

                        Recruitment Services Running

                    </div>

                    <div class="status-item">

                        <i class="bi bi-check-circle-fill"></i>

                        Admin Session Verified

                    </div>

                </div>

            </div>

        </div>

    </body>

    </html>
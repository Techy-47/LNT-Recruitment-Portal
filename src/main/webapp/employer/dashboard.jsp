<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Employer Dashboard</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">

        <style>
            * {
                font-family: 'Poppins', sans-serif;
            }

            body {

                background: #F3F6FB;

            }

            .hero {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

                padding: 35px;

                border-radius: 20px;

                box-shadow: 0 15px 40px rgba(37, 99, 235, .25);

                margin-bottom: 35px;

            }

            .hero h2 {

                font-weight: 700;

            }

            .stat-card {

                border: none;

                border-radius: 18px;

                padding: 20px;

                transition: .3s;

                box-shadow: 0 8px 25px rgba(0, 0, 0, .08);

            }

            .stat-card:hover {

                transform: translateY(-6px);

            }

            .stat-icon {

                width: 65px;

                height: 65px;

                display: flex;

                align-items: center;

                justify-content: center;

                border-radius: 15px;

                font-size: 30px;

                color: white;

            }

            .icon-blue {

                background: #2563EB;

            }

            .icon-green {

                background: #16A34A;

            }

            .quick-card {

                border: none;

                border-radius: 18px;

                padding: 25px;

                text-align: center;

                background: white;

                transition: .3s;

                text-decoration: none;

                color: #1E293B;

                box-shadow: 0 8px 25px rgba(0, 0, 0, .08);

                display: block;

            }

            .quick-card:hover {

                transform: translateY(-6px);

                color: #2563EB;

            }

            .quick-card i {

                font-size: 40px;

                margin-bottom: 15px;

            }

            .logout {

                border-radius: 10px;

            }

            .section-title {

                font-weight: 600;

                margin-bottom: 20px;

                color: #1E293B;

            }
        </style>

    </head>

    <body>

        <div class="container py-5">

            <div class="hero">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <h2>
                            Welcome back,
                            <strong>${sessionScope.employerName}</strong>
                        </h2>

                        <p class="mb-0 opacity-75">

                            Manage your recruitment activities from one place.

                        </p>

                    </div>

                    <i class="bi bi-building fs-1"></i>

                </div>

            </div>

            <div class="row g-4">

                <div class="col-md-6">

                    <div class="card stat-card">

                        <div class="d-flex align-items-center justify-content-between">

                            <div>

                                <h6 class="text-muted">

                                    Total Jobs

                                </h6>

                                <h1 class="fw-bold">

                                    ${totalJobs}

                                </h1>

                            </div>

                            <div class="stat-icon icon-blue">

                                <i class="bi bi-briefcase-fill"></i>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-6">

                    <div class="card stat-card">

                        <div class="d-flex align-items-center justify-content-between">

                            <div>

                                <h6 class="text-muted">

                                    Applications

                                </h6>

                                <h1 class="fw-bold">

                                    ${totalApplications}

                                </h1>

                            </div>

                            <div class="stat-icon icon-green">

                                <i class="bi bi-people-fill"></i>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <div class="mt-5">

                <h4 class="section-title">

                    Quick Actions

                </h4>

                <div class="row g-4">

                    <div class="col-md-3">

                        <a class="quick-card" href="${pageContext.request.contextPath}/employer/post-job">

                            <i class="bi bi-plus-circle-fill"></i>

                            <h5>Post Job</h5>

                            <p class="text-muted">

                                Create a new vacancy

                            </p>

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a class="quick-card" href="${pageContext.request.contextPath}/employer/jobs">

                            <i class="bi bi-card-list"></i>

                            <h5>Manage Jobs</h5>

                            <p class="text-muted">

                                View all posted jobs

                            </p>

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a class="quick-card" href="${pageContext.request.contextPath}/employer-applications">

                            <i class="bi bi-file-earmark-person-fill"></i>

                            <h5>Applications</h5>

                            <p class="text-muted">

                                Review candidates

                            </p>

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a class="quick-card" href="${pageContext.request.contextPath}/employer/login?logout=true">

                            <i class="bi bi-box-arrow-right"></i>

                            <h5>Logout</h5>

                            <p class="text-muted">

                                Sign out safely

                            </p>

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </body>

    </html>
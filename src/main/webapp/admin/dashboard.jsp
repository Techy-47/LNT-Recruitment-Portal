<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">
        <title>Admin Dashboard</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <style>
            body {
                background: #f4f6f9;
            }

            .stat-card {
                border: none;
                border-radius: 15px;
                transition: .3s;
                box-shadow: 0 5px 15px rgba(0, 0, 0, .08);
            }

            .stat-card:hover {
                transform: translateY(-5px);
            }

            .icon-box {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 24px;
            }

            .bg-blue {
                background: #0d6efd;
            }

            .bg-green {
                background: #198754;
            }

            .bg-orange {
                background: #fd7e14;
            }

            .bg-red {
                background: #dc3545;
            }

            .dashboard-title {
                font-weight: bold;
            }
        </style>

    </head>

    <body>

        <div class="container py-4">

            <div class="d-flex justify-content-between align-items-center mb-4">

                <h2 class="dashboard-title">
                    Admin Dashboard
                </h2>

                <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Logout
                </a>

            </div>


            <div class="row g-4">

                <div class="col-lg-3 col-md-6">

                    <div class="card stat-card">

                        <div class="card-body d-flex justify-content-between align-items-center">

                            <div>

                                <small class="text-muted">
                                    Candidates
                                </small>

                                <h2>
                                    ${totalCandidates}
                                </h2>

                            </div>

                            <div class="icon-box bg-blue">

                                <i class="fa-solid fa-users"></i>

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

                                <h2>
                                    ${totalEmployers}
                                </h2>

                            </div>

                            <div class="icon-box bg-green">

                                <i class="fa-solid fa-building"></i>

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

                                <h2>
                                    ${totalJobs}
                                </h2>

                            </div>

                            <div class="icon-box bg-orange">

                                <i class="fa-solid fa-briefcase"></i>

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

                                <h2>
                                    ${totalApplications}
                                </h2>

                            </div>

                            <div class="icon-box bg-red">

                                <i class="fa-solid fa-file-lines"></i>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="card mt-5 shadow-sm">

                <div class="card-header">

                    <strong>
                        Quick Actions
                    </strong>

                </div>

                <div class="card-body">

                    <div class="d-flex flex-wrap gap-3">

                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/users">

                            <i class="fa-solid fa-users"></i>
                            Manage Users

                        </a>

                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/candidates">
                            Manage Candidates
                        </a>

                        <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/jobs">

                            <i class="fa-solid fa-briefcase"></i>
                            Manage Jobs

                        </a>

                        <a class="btn btn-warning text-dark" href="${pageContext.request.contextPath}/admin/reports">

                            <i class="fa-solid fa-chart-column"></i>
                            Reports

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </body>

    </html>
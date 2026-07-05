<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Admin Reports</title>

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

            .page-header {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

                padding: 35px;

                border-radius: 22px;

                margin: 35px 0;

                box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

            }

            .page-header h2 {

                font-weight: 700;

                margin-bottom: 8px;

            }

            .report-card {

                background: white;

                border: none;

                border-radius: 20px;

                padding: 28px;

                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                transition: .3s;

                height: 100%;

            }

            .report-card:hover {

                transform: translateY(-6px);

            }

            .report-icon {

                width: 70px;

                height: 70px;

                border-radius: 50%;

                display: flex;

                justify-content: center;

                align-items: center;

                font-size: 30px;

                color: white;

                margin-bottom: 20px;

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

            .download-btn {

                border-radius: 30px;

                margin-top: 15px;

            }

            .back-btn {

                border-radius: 30px;

            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="page-header">

                <div class="d-flex justify-content-between align-items-center flex-wrap">

                    <div>

                        <h2>

                            <i class="bi bi-bar-chart-fill me-2"></i>

                            Reports & Analytics

                        </h2>

                        <p class="mb-0">

                            Export recruitment data and generate reports.

                        </p>

                    </div>

                    <div>

                        <i class="bi bi-file-earmark-arrow-down-fill" style="font-size:60px;"></i>

                    </div>

                </div>

            </div>

            <div class="row g-4">
                <div class="col-md-6 col-lg-3">

                    <div class="report-card">

                        <div class="report-icon blue">

                            <i class="bi bi-people-fill"></i>

                        </div>

                        <h5>Candidate Report</h5>

                        <p class="text-muted">

                            Export all registered candidates in CSV format.

                        </p>

                        <a class="btn btn-primary w-100 download-btn"
                            href="${pageContext.request.contextPath}/admin/reports?type=candidates">

                            <i class="bi bi-download me-2"></i>

                            Download CSV

                        </a>

                    </div>

                </div>

                <div class="col-md-6 col-lg-3">

                    <div class="report-card">

                        <div class="report-icon green">

                            <i class="bi bi-buildings-fill"></i>

                        </div>

                        <h5>Employer Report</h5>

                        <p class="text-muted">

                            Export all registered employers in CSV format.

                        </p>

                        <a class="btn btn-success w-100 download-btn"
                            href="${pageContext.request.contextPath}/admin/reports?type=employers">

                            <i class="bi bi-download me-2"></i>

                            Download CSV

                        </a>

                    </div>

                </div>

                <div class="col-md-6 col-lg-3">

                    <div class="report-card">

                        <div class="report-icon orange">

                            <i class="bi bi-briefcase-fill"></i>

                        </div>

                        <h5>Job Report</h5>

                        <p class="text-muted">

                            Export all job postings with complete details.

                        </p>

                        <a class="btn btn-warning w-100 download-btn"
                            href="${pageContext.request.contextPath}/admin/reports?type=jobs">

                            <i class="bi bi-download me-2"></i>

                            Download CSV

                        </a>

                    </div>

                </div>

                <div class="col-md-6 col-lg-3">

                    <div class="report-card">

                        <div class="report-icon red">

                            <i class="bi bi-file-earmark-text-fill"></i>

                        </div>

                        <h5>Application Report</h5>

                        <p class="text-muted">

                            Export all submitted applications and their status.

                        </p>

                        <a class="btn btn-danger w-100 download-btn"
                            href="${pageContext.request.contextPath}/admin/reports?type=applications">

                            <i class="bi bi-download me-2"></i>

                            Download CSV

                        </a>

                    </div>

                </div>

            </div>

            <div class="mt-5 text-end">

                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-dark back-btn">

                    <i class="bi bi-arrow-left-circle me-2"></i>

                    Back to Dashboard

                </a>

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>
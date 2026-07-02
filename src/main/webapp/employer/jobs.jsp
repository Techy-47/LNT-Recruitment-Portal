<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.lnt.model.Job" %>

            <% List<Job> jobs = (List<Job>) request.getAttribute("jobs");
                    %>

                    <!DOCTYPE html>
                    <html>

                    <head>

                        <meta charset="UTF-8">

                        <title>Manage Jobs</title>

                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                            rel="stylesheet">

                        <link rel="stylesheet"
                            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

                        <link
                            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                            rel="stylesheet">

                        <style>
                            * {
                                font-family: 'Poppins', sans-serif;
                            }

                            body {
                                background: #F4F7FC;
                            }

                            .page-header {

                                background: white;

                                padding: 25px 30px;

                                border-radius: 20px;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                                margin: 40px auto;

                            }

                            .page-title {

                                font-size: 32px;

                                font-weight: 700;

                                margin: 0;

                            }

                            .job-card {

                                background: white;

                                border: none;

                                border-radius: 20px;

                                padding: 25px;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                                transition: .3s;

                                height: 100%;

                            }

                            .job-card:hover {

                                transform: translateY(-8px);

                            }

                            .job-title {

                                font-size: 22px;

                                font-weight: 600;

                                margin-bottom: 20px;

                            }

                            .info {

                                margin-bottom: 12px;

                                color: #64748B;

                            }

                            .info i {

                                color: #2563EB;

                                margin-right: 10px;

                            }

                            .action-btn {

                                border-radius: 10px;

                                padding: 8px 18px;

                            }

                            .empty-card {

                                background: white;

                                padding: 60px;

                                border-radius: 20px;

                                text-align: center;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                            }

                            .back-btn {

                                border-radius: 12px;

                                padding: 10px 25px;

                            }
                        </style>

                    </head>

                    <body>

                        <div class="container py-4">

                            <div class="page-header d-flex justify-content-between align-items-center">

                                <div>

                                    <h2 class="page-title">
                                        Manage Jobs
                                    </h2>

                                    <p class="text-muted mb-0">

                                        View, edit and manage your job postings.

                                    </p>

                                </div>

                                <a href="<%=request.getContextPath()%>/employer/post-job" class="btn btn-primary">

                                    <i class="bi bi-plus-circle me-2"></i>

                                    Post New Job

                                </a>

                            </div>

                            <% if(jobs==null || jobs.isEmpty()){ %>

                                <div class="empty-card">

                                    <i class="bi bi-briefcase display-2 text-primary"></i>

                                    <h3 class="mt-4">

                                        No Jobs Posted Yet

                                    </h3>

                                    <p class="text-muted">

                                        Start hiring by posting your first job opening.

                                    </p>

                                    <a href="<%=request.getContextPath()%>/employer/post-job" class="btn btn-primary">

                                        Create Job

                                    </a>

                                </div>

                                <% } else { %>

                                    <div class="row g-4">

                                        <% for(Job job : jobs){ %>

                                            <div class="col-lg-6">

                                                <div class="job-card">

                                                    <div class="d-flex justify-content-between align-items-start">

                                                        <div>

                                                            <div class="job-title">

                                                                <%=job.getTitle()%>

                                                            </div>

                                                        </div>

                                                        <span class="badge bg-primary">

                                                            Active

                                                        </span>

                                                    </div>

                                                    <div class="info">

                                                        <i class="bi bi-geo-alt-fill"></i>

                                                        <%=job.getLocation()%>

                                                    </div>

                                                    <div class="info">

                                                        <i class="bi bi-cash-stack"></i>

                                                        ₹ <%=job.getSalary()%>

                                                    </div>

                                                    <div class="info">

                                                        <i class="bi bi-calendar-event"></i>

                                                        Deadline :

                                                        <%=job.getDeadline()==null ? "-" :
                                                            job.getDeadline().toLocalDate()%>

                                                    </div>

                                                    <hr>

                                                    <div class="d-flex gap-2">

                                                        <a href="<%=request.getContextPath()%>/employer/edit-job?id=<%=job.getJobId()%>"
                                                            class="btn btn-warning action-btn">

                                                            <i class="bi bi-pencil-square"></i>

                                                            Edit

                                                        </a>

                                                        <form method="post"
                                                            action="<%=request.getContextPath()%>/employer/delete-job">

                                                            <input type="hidden" name="jobId"
                                                                value="<%=job.getJobId()%>">

                                                            <button class="btn btn-danger action-btn"
                                                                onclick="return confirm('Are you sure you want to delete this job?');">

                                                                <i class="bi bi-trash"></i>

                                                                Delete

                                                            </button>

                                                        </form>

                                                    </div>

                                                </div>

                                            </div>

                                            <% } %>

                                    </div>

                                    <% } %>

                                        <div class="mt-5">

                                            <a href="<%=request.getContextPath()%>/employer-dashboard"
                                                class="btn btn-secondary back-btn">

                                                <i class="bi bi-arrow-left"></i>

                                                Back to Dashboard

                                            </a>

                                        </div>

                        </div>

                    </body>

                    </html>
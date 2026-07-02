<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.lnt.model.Job" %>

            <% List<Job> jobs = (List<Job>) request.getAttribute("jobs");
                    %>

                    <% String title=request.getParameter("title"); String location=request.getParameter("location");
                        String skills=request.getParameter("skills"); String salary=request.getParameter("salary"); %>

                        <!DOCTYPE html>
                        <html>

                        <head>

                            <meta charset="UTF-8">

                            <title>Available Jobs</title>

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

                                .hero {

                                    margin: 40px 0 30px;

                                    padding: 40px;

                                    border-radius: 22px;

                                    background: linear-gradient(135deg, #2563EB, #1D4ED8);

                                    color: white;

                                    box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

                                }

                                .hero h2 {

                                    font-weight: 700;

                                }

                                .search-card {

                                    background: white;

                                    padding: 25px;

                                    border-radius: 18px;

                                    box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                                    margin-bottom: 30px;

                                }

                                .form-control {

                                    border-radius: 12px;

                                    padding: 11px;

                                }

                                .form-control:focus {

                                    box-shadow: none;

                                    border-color: #2563EB;

                                }

                                .btn {

                                    border-radius: 12px;

                                }

                                .job-card {

                                    background: white;

                                    border: none;

                                    border-radius: 18px;

                                    padding: 28px;

                                    margin-bottom: 22px;

                                    box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                                    transition: .3s;

                                }

                                .job-card:hover {

                                    transform: translateY(-5px);

                                }

                                .job-title {

                                    font-size: 24px;

                                    font-weight: 600;

                                    margin-bottom: 15px;

                                }

                                .job-meta {

                                    margin-bottom: 10px;

                                    color: #555;

                                }

                                .job-meta i {

                                    color: #2563EB;

                                    margin-right: 8px;

                                }

                                .apply-btn {

                                    padding: 10px 22px;

                                }

                                .view-btn {

                                    padding: 10px 22px;

                                }
                            </style>

                        </head>

                        <body>

                            <div class="container">

                                <div class="hero">

                                    <h2>Find Your Dream Job 🚀</h2>

                                    <p class="mb-0">

                                        Search thousands of opportunities and apply in just one click.

                                    </p>

                                </div>

                                <div class="search-card">

                                    <form method="get" action="${pageContext.request.contextPath}/jobs">

                                        <div class="row g-3">

                                            <div class="col-md-3">
                                                <input type="text" name="title" class="form-control"
                                                    placeholder="Job Title" value="<%= title == null ? "" : title %>">
                                            </div>

                                            <div class="col-md-3">
                                                <input type="text" name="location" class="form-control"
                                                    placeholder="Location"
                                                    value="<%= location == null ? "" : location %>">
                                            </div>

                                            <div class="col-md-3">
                                                <input type="text" name="skills" class="form-control"
                                                    placeholder="Skills" value="<%= skills == null ? "" : skills %>">
                                            </div>

                                            <div class="col-md-3">
                                                <input type="text" name="salary" class="form-control"
                                                    placeholder="Salary" value="<%= salary == null ? "" : salary %>">
                                            </div>
                                            <div class="col-md-12 d-flex gap-2">

                                                <button class="btn btn-primary">

                                                    <i class="bi bi-search me-1"></i>

                                                    Search

                                                </button>

                                                <a href="${pageContext.request.contextPath}/jobs"
                                                    class="btn btn-outline-secondary">

                                                    Reset

                                                </a>

                                                <a href="${pageContext.request.contextPath}/candidate/dashboard"
                                                    class="btn btn-dark ms-auto">

                                                    <i class="bi bi-house-door"></i>

                                                    Dashboard

                                                </a>

                                            </div>

                                        </div>

                                    </form>

                                </div>

                                <% if(jobs==null || jobs.isEmpty()){ %>

                                    <div class="alert alert-warning">

                                        No jobs found matching your search.

                                    </div>

                                    <% } else { %>

                                        <% for(Job job : jobs){ %>

                                            <div class="job-card">

                                                <div class="d-flex justify-content-between align-items-start flex-wrap">

                                                    <div>

                                                        <div class="job-title">

                                                            <a class="text-decoration-none text-dark"
                                                                href="<%=request.getContextPath()%>/job-details?id=<%=job.getJobId()%>">

                                                                <%=job.getTitle()%>

                                                            </a>

                                                        </div>

                                                        <div class="job-meta">

                                                            <i class="bi bi-geo-alt-fill"></i>

                                                            <%=job.getLocation()%>

                                                        </div>

                                                        <div class="job-meta">

                                                            <i class="bi bi-currency-rupee"></i>

                                                            <%=job.getSalary()%>

                                                        </div>

                                                        <div class="job-meta">

                                                            <i class="bi bi-tools"></i>

                                                            <%=job.getSkillsRequired()%>

                                                        </div>

                                                    </div>

                                                    <div class="d-flex gap-2">

                                                        <a href="<%=request.getContextPath()%>/job-details?id=<%=job.getJobId()%>"
                                                            class="btn btn-outline-primary view-btn">

                                                            View Details

                                                        </a>

                                                        <form method="post"
                                                            action="${pageContext.request.contextPath}/apply-job">

                                                            <input type="hidden" name="jobId"
                                                                value="<%=job.getJobId()%>">

                                                            <button class="btn btn-primary apply-btn">

                                                                Apply Now

                                                            </button>

                                                        </form>

                                                    </div>

                                                </div>

                                            </div>

                                            <% } %>

                                                <% } %>

                            </div>

                        </body>

                        </html>
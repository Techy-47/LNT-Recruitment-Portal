<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="com.lnt.model.Job" %>

        <% Job job=(Job) request.getAttribute("job"); %>

            <!DOCTYPE html>
            <html>

            <head>

                <meta charset="UTF-8">

                <title>Job Details</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">

                <style>
                    * {
                        font-family: 'Poppins', sans-serif;
                    }

                    body {
                        background: #F4F7FC;
                    }

                    .profile-header {

                        background: linear-gradient(135deg, #2563EB, #1D4ED8);

                        color: white;

                        padding: 40px;

                        border-radius: 22px;

                        margin: 35px 0;

                        box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

                    }

                    .avatar {

                        width: 90px;

                        height: 90px;

                        border-radius: 50%;

                        background: white;

                        color: #2563EB;

                        display: flex;

                        justify-content: center;

                        align-items: center;

                        font-size: 45px;

                        margin-bottom: 20px;

                    }

                    .info-card {

                        background: white;

                        border: none;

                        border-radius: 20px;

                        padding: 30px;

                        box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                        margin-bottom: 25px;

                    }

                    .info-item {

                        margin-bottom: 22px;

                    }

                    .info-title {

                        font-size: 14px;

                        font-weight: 600;

                        color: #6B7280;

                        margin-bottom: 5px;

                    }

                    .info-value {

                        font-size: 17px;

                        font-weight: 500;

                        color: #111827;

                    }

                    .skill {

                        display: inline-block;

                        padding: 8px 16px;

                        margin: 5px;

                        border-radius: 30px;

                        background: #EAF2FF;

                        color: #2563EB;

                        font-weight: 500;

                    }

                    .action-btn {

                        border-radius: 30px;

                        padding: 12px 24px;

                    }
                </style>

            </head>

            <body>

                <div class="container">

                    <div class="profile-header">

                        <div class="avatar">

                            <i class="bi bi-briefcase-fill"></i>

                        </div>

                        <h2>

                            <%=job.getTitle()%>

                        </h2>

                        <p class="mb-0">

                            Job Details

                        </p>

                    </div>

                    <div class="info-card">

                        <div class="row">

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Job ID

                                </div>

                                <div class="info-value">

                                    #<%=job.getJobId()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Employer ID

                                </div>

                                <div class="info-value">

                                    <%=job.getEmployerId()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Location

                                </div>

                                <div class="info-value">

                                    <i class="bi bi-geo-alt-fill text-danger me-2"></i>

                                    <%=job.getLocation()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Salary

                                </div>

                                <div class="info-value">

                                    ₹ <%=job.getSalary()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Experience

                                </div>

                                <div class="info-value">

                                    <%=job.getExperienceRequired()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Deadline

                                </div>

                                <div class="info-value">

                                    <%=job.getDeadline()%>

                                </div>

                            </div>

                            <div class="col-12">

                                <div class="info-title">

                                    Description

                                </div>

                                <div class="info-value">

                                    <%=job.getDescription()%>

                                </div>

                            </div>

                            <div class="col-12 mt-3">

                                <div class="info-title">

                                    Skills Required

                                </div>

                                <% if(job.getSkillsRequired()!=null){ String[]
                                    skills=job.getSkillsRequired().split(","); for(String s:skills){ %>

                                    <span class="skill">

                                        <%=s.trim()%>

                                    </span>

                                    <% } } %>

                            </div>

                            <div class="col-12 mt-4">

                                <div class="info-title">

                                    Status

                                </div>

                                <% if(job.isActive()){ %>

                                    <span class="badge bg-success fs-6">

                                        Active

                                    </span>

                                    <% }else{ %>

                                        <span class="badge bg-danger fs-6">

                                            Inactive

                                        </span>

                                        <% } %>

                            </div>

                        </div>

                    </div>

                    <div class="info-card">

                        <div class="d-flex gap-3 flex-wrap">

                            <a href="<%=request.getContextPath()%>/admin/jobs" class="btn btn-dark action-btn">

                                <i class="bi bi-arrow-left-circle me-2"></i>

                                Back to Jobs

                            </a>

                            <a href="<%=request.getContextPath()%>/admin/edit-job?id=<%=job.getJobId()%>"
                                class="btn btn-warning action-btn">

                                <i class="bi bi-pencil-fill me-2"></i>

                                Edit Job

                            </a>

                        </div>

                    </div>

                </div>

            </body>

            </html>
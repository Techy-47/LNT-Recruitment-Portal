<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="com.lnt.model.Job" %>

        <% Job job=(Job) request.getAttribute("job"); %>

            <!DOCTYPE html>
            <html>

            <head>

                <meta charset="UTF-8">

                <title>Admin - Edit Job</title>

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

                    .edit-card {

                        max-width: 1000px;

                        margin: 45px auto;

                        background: white;

                        padding: 40px;

                        border-radius: 22px;

                        box-shadow: 0 15px 40px rgba(0, 0, 0, .08);

                    }

                    .page-title {

                        font-size: 32px;

                        font-weight: 700;

                        margin-bottom: 8px;

                    }

                    .subtitle {

                        color: #64748B;

                        margin-bottom: 35px;

                    }

                    .form-label {

                        font-weight: 600;

                        margin-bottom: 8px;

                    }

                    .form-control {

                        padding: 12px;

                        border-radius: 12px;

                    }

                    .form-control:focus {

                        border-color: #2563EB;

                        box-shadow: 0 0 0 .2rem rgba(37, 99, 235, .15);

                    }

                    textarea {

                        resize: none;

                    }

                    .btn {

                        border-radius: 12px;

                        padding: 11px 24px;

                        font-weight: 500;

                    }
                </style>

            </head>

            <body>

                <div class="container">

                    <div class="edit-card">

                        <h2 class="page-title">

                            <i class="bi bi-pencil-square text-primary"></i>

                            Admin - Edit Job

                        </h2>

                        <p class="subtitle">

                            Update any job posted on the Recruitment Portal.

                        </p>

                        <form method="post" action="<%=request.getContextPath()%>/admin/edit-job">

                            <input type="hidden" name="jobId" value="<%=job.getJobId()%>">

                            <div class="row">

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Job Title

                                    </label>

                                    <input class="form-control" name="title" value="<%=job.getTitle()%>" required>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Location

                                    </label>

                                    <input class="form-control" name="location" value="<%=job.getLocation()%>">

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Salary

                                    </label>

                                    <input class="form-control" name="salary" value="<%=job.getSalary()%>">

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Experience Required

                                    </label>

                                    <input class="form-control" name="experienceRequired"
                                        value="<%=job.getExperienceRequired()%>">

                                </div>

                                <div class="col-md-12 mb-3">

                                    <label class="form-label">

                                        Skills Required

                                    </label>

                                    <input class="form-control" name="skillsRequired"
                                        value="<%=job.getSkillsRequired()%>">

                                </div>

                                <div class="col-md-12 mb-3">

                                    <label class="form-label">

                                        Job Description

                                    </label>

                                    <textarea rows="6" class="form-control"
                                        name="description"><%=job.getDescription()%></textarea>

                                </div>

                                <div class="col-md-6 mb-4">

                                    <label class="form-label">

                                        Application Deadline

                                    </label>

                                    <input type="date" class="form-control" name="deadline"
                                        value="<%=job.getDeadline()==null ? "" : job.getDeadline().toLocalDate()%>">

                                </div>

                            </div>

                            <div class="d-flex gap-3">

                                <button class="btn btn-primary">

                                    <i class="bi bi-check-circle-fill me-2"></i>

                                    Update Job

                                </button>

                                <a href="<%=request.getContextPath()%>/admin/jobs" class="btn btn-outline-secondary">

                                    <i class="bi bi-arrow-left me-2"></i>

                                    Back to Jobs

                                </a>

                            </div>

                        </form>

                    </div>

                </div>

            </body>

            </html>
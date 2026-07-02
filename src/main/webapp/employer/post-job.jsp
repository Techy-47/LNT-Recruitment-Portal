<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Post Job</title>

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

            .page-card {

                max-width: 1000px;

                margin: 50px auto;

                background: white;

                border-radius: 22px;

                padding: 40px;

                box-shadow: 0 15px 40px rgba(0, 0, 0, .08);

            }

            .header {

                margin-bottom: 35px;

            }

            .header h2 {

                font-weight: 700;

            }

            .header p {

                color: #64748B;

            }

            .form-label {

                font-weight: 600;

                margin-bottom: 8px;

            }

            .form-control {

                border-radius: 12px;

                padding: 12px;

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

                padding: 10px 24px;

            }

            .section {

                margin-top: 20px;

            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="page-card">

                <div class="header">

                    <h2>

                        <i class="bi bi-briefcase-fill text-primary"></i>

                        Post a New Job

                    </h2>

                    <p>

                        Fill in the details below to publish a new job opening.

                    </p>

                </div>

                <% if(request.getAttribute("error")!=null){ %>

                    <div class="alert alert-danger">

                        <%=request.getAttribute("error")%>

                    </div>

                    <% } %>

                        <form method="post" action="${pageContext.request.contextPath}/employer/post-job">

                            <div class="row">

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Job Title

                                    </label>

                                    <input type="text" name="title" class="form-control" required>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Location

                                    </label>

                                    <input type="text" name="location" class="form-control">

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Salary

                                    </label>

                                    <input type="text" name="salary" class="form-control">

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Experience Required

                                    </label>

                                    <input type="text" name="experience" class="form-control">

                                </div>

                                <div class="col-md-12 mb-3">

                                    <label class="form-label">

                                        Skills Required

                                    </label>

                                    <input type="text" name="skills" class="form-control"
                                        placeholder="Java, Spring Boot, SQL...">

                                </div>

                                <div class="col-md-12 mb-3">

                                    <label class="form-label">

                                        Job Description

                                    </label>

                                    <textarea name="description" rows="6" class="form-control"></textarea>

                                </div>

                                <div class="col-md-6 mb-4">

                                    <label class="form-label">

                                        Application Deadline

                                    </label>

                                    <input type="datetime-local" name="deadline" class="form-control">

                                </div>

                            </div>

                            <div class="d-flex gap-3">

                                <button class="btn btn-primary">

                                    <i class="bi bi-send-fill"></i>

                                    Publish Job

                                </button>

                                <a href="${pageContext.request.contextPath}/employer-dashboard"
                                    class="btn btn-outline-secondary">

                                    <i class="bi bi-arrow-left"></i>

                                    Back

                                </a>

                            </div>

                        </form>

            </div>

        </div>

    </body>

    </html>
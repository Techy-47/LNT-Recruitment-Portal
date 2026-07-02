<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="com.lnt.model.Candidate" %>

        <% Candidate c=(Candidate) request.getAttribute("candidate"); %>

            <!DOCTYPE html>
            <html>

            <head>

                <meta charset="UTF-8">

                <title>Edit Profile</title>

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

                    .header {

                        margin: 40px 0 30px;

                        padding: 40px;

                        border-radius: 20px;

                        background: linear-gradient(135deg, #2563EB, #1D4ED8);

                        color: white;

                        box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

                    }

                    .card-box {

                        background: white;

                        border-radius: 20px;

                        box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                        padding: 35px;

                    }

                    .form-control {

                        border-radius: 12px;

                        padding: 12px;

                    }

                    .btn {

                        border-radius: 10px;

                        padding: 10px 22px;

                    }
                </style>

            </head>

            <body>

                <div class="container">

                    <div class="header">

                        <h2>Edit Profile</h2>

                        <p class="mb-0">
                            Update your personal information.
                        </p>

                    </div>

                    <div class="card-box">

                        <form method="post" action="<%=request.getContextPath()%>/profile">

                            <div class="mb-3">

                                <label class="form-label">
                                    Full Name
                                </label>

                                <input type="text" name="fullName" class="form-control" value="<%=c.getFullName()%>"
                                    required>

                            </div>

                            <div class="mb-3">

                                <label class="form-label">
                                    Email
                                </label>

                                <input type="email" class="form-control" value="<%=c.getEmail()%>" readonly>

                                <div class="form-text">
                                    Email cannot be changed.
                                </div>

                            </div>

                            <div class="mb-3">

                                <label class="form-label">
                                    Phone
                                </label>

                                <input type="text" name="phone" class="form-control"
                                    value="<%=c.getPhone()==null?"":c.getPhone()%>">

                            </div>

                            <div class="mb-3">

                                <label class="form-label">
                                    Education
                                </label>

                                <textarea name="education" rows="3"
                                    class="form-control"><%=c.getEducation()==null?"":c.getEducation()%></textarea>

                            </div>

                            <div class="mb-3">

                                <label class="form-label">
                                    Skills
                                </label>

                                <textarea name="skills" rows="3"
                                    class="form-control"><%=c.getSkills()==null?"":c.getSkills()%></textarea>

                            </div>

                            <div class="d-flex justify-content-between mt-4">

                                <a href="<%=request.getContextPath()%>/profile" class="btn btn-secondary">

                                    <i class="bi bi-arrow-left"></i>

                                    Cancel

                                </a>

                                <button type="submit" class="btn btn-primary">

                                    <i class="bi bi-check-circle"></i>

                                    Save Changes

                                </button>

                            </div>

                        </form>

                    </div>

                </div>

            </body>

            </html>
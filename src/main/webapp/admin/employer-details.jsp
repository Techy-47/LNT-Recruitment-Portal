<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="com.lnt.model.Employer" %>

        <% Employer employer=(Employer)request.getAttribute("employer"); %>

            <!DOCTYPE html>
            <html>

            <head>

                <meta charset="UTF-8">

                <title>Employer Details</title>

                <meta name="viewport" content="width=device-width, initial-scale=1">

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

                        font-size: 42px;

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

                        margin-bottom: 24px;

                    }

                    .info-title {

                        font-size: 14px;

                        font-weight: 600;

                        color: #6B7280;

                        margin-bottom: 6px;

                    }

                    .info-value {

                        font-size: 17px;

                        font-weight: 500;

                        color: #111827;

                    }

                    .action-btn {

                        border-radius: 30px;

                        padding: 12px 24px;

                    }

                    .website-link {

                        text-decoration: none;

                        font-weight: 500;

                    }

                    .website-link:hover {

                        text-decoration: underline;

                    }
                </style>

            </head>

            <body>

                <div class="container">

                    <div class="profile-header">

                        <div class="avatar">

                            <i class="bi bi-building-fill"></i>

                        </div>

                        <h2>

                            <%=employer.getCompanyName()%>

                        </h2>

                        <p class="mb-0">

                            Registered Employer

                        </p>

                    </div>

                    <div class="info-card">

                        <div class="row">

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Company Name

                                </div>

                                <div class="info-value">

                                    <i class="bi bi-buildings-fill text-primary me-2"></i>

                                    <%=employer.getCompanyName()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Email

                                </div>

                                <div class="info-value">

                                    <i class="bi bi-envelope-fill text-primary me-2"></i>

                                    <%=employer.getEmail()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Industry

                                </div>

                                <div class="info-value">

                                    <i class="bi bi-briefcase-fill text-warning me-2"></i>

                                    <%=employer.getIndustry()==null || employer.getIndustry().isBlank()
                                        ? "Not Available" : employer.getIndustry()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Employer ID

                                </div>

                                <div class="info-value">

                                    #<%=employer.getEmployerId()%>

                                </div>

                            </div>

                            <div class="col-12 info-item">

                                <div class="info-title">

                                    Website

                                </div>

                                <div class="info-value">

                                    <% if(employer.getWebsite()!=null && !employer.getWebsite().isBlank()){ %>

                                        <a href="<%=employer.getWebsite()%>" target="_blank" class="website-link">

                                            <i class="bi bi-globe2 me-2"></i>

                                            <%=employer.getWebsite()%>

                                        </a>

                                        <% }else{ %>

                                            <span class="text-muted">

                                                Not Available

                                            </span>

                                            <% } %>

                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="info-card">

                        <div class="d-flex flex-wrap gap-3">

                            <a href="<%=request.getContextPath()%>/admin/employer/jobs?id=<%=employer.getEmployerId()%>"
                                class="btn btn-primary action-btn">

                                <i class="bi bi-briefcase-fill me-2"></i>

                                View Posted Jobs

                            </a>
                            <form method="post" action="<%=request.getContextPath()%>/admin/delete-employer"
                                class="d-inline"
                                onsubmit="return confirmEmployerDelete('<%=employer.getCompanyName()%>');">

                                <input type="hidden" name="employerId" value="<%=employer.getEmployerId()%>">

                                <button type="submit" class="btn btn-danger action-btn">

                                    <i class="bi bi-trash-fill me-2"></i>

                                    Delete Employer

                                </button>

                            </form>

                            <a href="<%=request.getContextPath()%>/admin/employers" class="btn btn-dark action-btn">

                                <i class="bi bi-arrow-left-circle me-2"></i>

                                Back to Employers

                            </a>

                        </div>

                    </div>

                </div>

                <script>

                    function confirmEmployerDelete(company) {

                        return confirm(
                            "Are you sure you want to delete\n\n"
                            + company
                            + "?\n\n"
                            + "This action will permanently delete:\n"
                            + "• Employer Account\n"
                            + "• All Posted Jobs\n"
                            + "• All Applications submitted for those Jobs\n\n"
                            + "This action cannot be undone."
                        );

                    }

                </script>

            </body>

            </html>
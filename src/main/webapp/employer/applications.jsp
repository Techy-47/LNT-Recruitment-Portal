<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.lnt.model.Application" %>

            <% List<Application> applications =
                (List<Application>) request.getAttribute("applications");
                    %>

                    <!DOCTYPE html>
                    <html>

                    <head>

                        <meta charset="UTF-8">

                        <title>Applications Received</title>

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

                                padding: 30px;

                                border-radius: 20px;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                                margin: 40px auto 30px;

                            }

                            .page-title {

                                font-weight: 700;

                                margin-bottom: 5px;

                            }

                            .table-card {

                                background: white;

                                border-radius: 20px;

                                overflow: hidden;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                            }

                            .table {

                                margin: 0;
                            }

                            .table thead {

                                background: #2563EB;

                                color: white;

                            }

                            .table th {

                                border: none;

                                padding: 18px;

                                font-weight: 600;

                            }

                            .table td {

                                vertical-align: middle;

                                padding: 18px;

                            }

                            .table tbody tr {

                                transition: .25s;

                            }

                            .table tbody tr:hover {

                                background: #F8FAFC;

                            }

                            .badge {

                                padding: 8px 14px;

                                border-radius: 30px;

                                font-weight: 500;

                                font-size: 13px;

                            }

                            .btn {

                                border-radius: 10px;

                            }

                            .resume-btn {

                                font-size: 13px;

                            }

                            .empty-card {

                                background: white;

                                padding: 70px;

                                text-align: center;

                                border-radius: 20px;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                            }

                            .action-group {

                                display: flex;

                                gap: 6px;

                                flex-wrap: wrap;

                            }
                        </style>

                    </head>

                    <body>

                        <div class="container">

                            <div class="page-header d-flex justify-content-between align-items-center">

                                <div>

                                    <h2 class="page-title">

                                        Applications Received

                                    </h2>

                                    <p class="text-muted mb-0">

                                        Review applicants and update their hiring status.

                                    </p>

                                </div>

                                <i class="bi bi-people-fill display-5 text-primary"></i>

                            </div>

                            <% if(applications==null || applications.isEmpty()){ %>

                                <div class="empty-card">

                                    <i class="bi bi-file-earmark-person display-1 text-primary"></i>

                                    <h3 class="mt-4">

                                        No Applications Yet

                                    </h3>

                                    <p class="text-muted">

                                        Applications submitted by candidates will appear here.

                                    </p>

                                </div>

                                <% } else { %>

                                    <div class="table-card">

                                        <table class="table align-middle">

                                            <thead>

                                                <tr>

                                                    <th>ID</th>

                                                    <th>Candidate</th>

                                                    <th>Job Title</th>

                                                    <th>Status</th>

                                                    <th>Resume</th>

                                                    <th width="300">

                                                        Actions

                                                    </th>

                                                </tr>

                                            </thead>

                                            <tbody>

                                                <% for(Application app : applications){ %>

                                                    <tr>

                                                        <td>

                                                            <strong>#<%=app.getApplicationId()%></strong>

                                                        </td>

                                                        <td>

                                                            <i class="bi bi-person-circle text-primary me-2"></i>

                                                            <%=app.getCandidateName()%>

                                                        </td>

                                                        <td>

                                                            <%=app.getJobTitle()%>

                                                        </td>

                                                        <td>

                                                            <% String status=app.getStatus(); String badge="bg-primary"
                                                                ; if("Accepted".equalsIgnoreCase(status))
                                                                badge="bg-success" ; else
                                                                if("Rejected".equalsIgnoreCase(status))
                                                                badge="bg-danger" ; else
                                                                if("Shortlisted".equalsIgnoreCase(status))
                                                                badge="bg-warning text-dark" ; %>

                                                                <span class="badge <%=badge%>">

                                                                    <%=status%>

                                                                </span>

                                                        </td>

                                                        <td>

                                                            <% if(app.getResumePath()!=null){ %>

                                                                <a class="btn btn-outline-primary btn-sm resume-btn"
                                                                    target="_blank"
                                                                    href="<%=request.getContextPath()%>/view-resume?file=<%=app.getResumePath()%>">

                                                                    <i class="bi bi-file-earmark-pdf-fill"></i>

                                                                    Resume

                                                                </a>

                                                                <% } else { %>

                                                                    <span class="text-danger">

                                                                        No Resume

                                                                    </span>

                                                                    <% } %>

                                                        </td>

                                                        <td>

                                                            <form
                                                                action="<%=request.getContextPath()%>/update-application-status"
                                                                method="post" class="action-group">

                                                                <input type="hidden" name="applicationId"
                                                                    value="<%=app.getApplicationId()%>">

                                                                <button class="btn btn-success btn-sm" type="submit"
                                                                    name="status" value="Accepted">

                                                                    <i class="bi bi-check-circle"></i>

                                                                    Accept

                                                                </button>

                                                                <button class="btn btn-warning btn-sm" type="submit"
                                                                    name="status" value="Shortlisted">

                                                                    <i class="bi bi-star"></i>

                                                                    Shortlist

                                                                </button>

                                                                <button class="btn btn-danger btn-sm" type="submit"
                                                                    name="status" value="Rejected">

                                                                    <i class="bi bi-x-circle"></i>

                                                                    Reject

                                                                </button>

                                                            </form>

                                                        </td>

                                                    </tr>

                                                    <% } %>

                                            </tbody>

                                        </table>

                                    </div>

                                    <% } %>

                                        <div class="mt-4">

                                            <a href="${pageContext.request.contextPath}/employer-dashboard"
                                                class="btn btn-dark ms-auto">

                                                <i class="bi bi-house-door"></i>

                                                Dashboard

                                            </a>

                                        </div>

                        </div>

                    </body>

                    </html>
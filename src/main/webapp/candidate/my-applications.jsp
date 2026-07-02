<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.lnt.model.Application" %>

            <% List<Application> apps =
                (List<Application>) request.getAttribute("applications");
                    %>

                    <!DOCTYPE html>
                    <html>

                    <head>

                        <meta charset="UTF-8">

                        <title>My Applications</title>

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

                                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                                color: white;

                                padding: 40px;

                                border-radius: 22px;

                                margin: 35px 0;

                                box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

                            }

                            .page-header h2 {

                                font-weight: 700;

                                margin-bottom: 8px;

                            }

                            .application-card {

                                background: #fff;

                                border: none;

                                border-radius: 18px;

                                padding: 25px;

                                margin-bottom: 20px;

                                box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                                transition: .3s;

                            }

                            .application-card:hover {

                                transform: translateY(-4px);

                            }

                            .info {

                                font-size: 15px;

                                color: #555;

                                margin-bottom: 8px;

                            }

                            .info strong {

                                color: #111827;

                            }

                            .badge {

                                font-size: .9rem;

                                padding: 8px 15px;

                                border-radius: 30px;

                            }

                            .bottom-bar {

                                margin-top: 35px;

                            }
                        </style>

                    </head>

                    <body>

                        <div class="row g-3 m-4">

                            <!-- <div class="col-md-3 col-sm-6">
                                <div class="card border-0 shadow-sm rounded-4 text-center p-3">
                                    <i class="bi bi-send-check-fill fs-2 text-primary"></i>
                                    <h3 class="mt-2">
                                        <%=request.getAttribute("appliedCount")%>
                                    </h3>
                                    <p class="text-muted mb-0">Applied</p>
                                </div>
                            </div> -->

                            <div class="col-md-4 col-sm-6">
                                <div class="card border-0 shadow-sm rounded-4 text-center p-3">
                                    <i class="bi bi-star-fill fs-2 text-warning"></i>
                                    <h3 class="mt-2">
                                        <%=request.getAttribute("shortlistedCount")%>
                                    </h3>
                                    <p class="text-muted mb-0">Shortlisted</p>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-6">
                                <div class="card border-0 shadow-sm rounded-4 text-center p-3">
                                    <i class="bi bi-check-circle-fill fs-2 text-success"></i>
                                    <h3 class="mt-2">
                                        <%=request.getAttribute("acceptedCount")%>
                                    </h3>
                                    <p class="text-muted mb-0">Accepted</p>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-6">
                                <div class="card border-0 shadow-sm rounded-4 text-center p-3">
                                    <i class="bi bi-x-circle-fill fs-2 text-danger"></i>
                                    <h3 class="mt-2">
                                        <%=request.getAttribute("rejectedCount")%>
                                    </h3>
                                    <p class="text-muted mb-0">Rejected</p>
                                </div>
                            </div>

                        </div>

                        <div class="container">

                            <div class="page-header">

                                <h2>My Applications</h2>

                                <p class="mb-0">

                                    Track the progress of every job you've applied for.

                                </p>

                            </div>

                            <% if(apps==null || apps.isEmpty()){ %>

                                <div class="alert alert-info shadow-sm">

                                    <i class="bi bi-info-circle-fill me-2"></i>

                                    You haven't applied to any jobs yet.

                                </div>

                                <% } else { %>

                                    <% for(Application a : apps){ %>

                                        <div class="application-card">

                                            <div class="row align-items-center">

                                                <div class="col-md-8">

                                                    <h4 class="fw-bold text-primary mb-3">

                                                        <%=a.getJobTitle()%>

                                                    </h4>

                                                    <div class="info">

                                                        <i class="bi bi-buildings me-2"></i>

                                                        <strong>Company :</strong>

                                                        <%=a.getCompanyName()%>

                                                    </div>

                                                    <div class="info">

                                                        <i class="bi bi-geo-alt-fill me-2"></i>

                                                        <strong>Location :</strong>

                                                        <%=a.getLocation()%>

                                                    </div>

                                                    <div class="info">

                                                        <i class="bi bi-cash-stack me-2"></i>

                                                        <strong>Salary :</strong>

                                                        ₹ <%=a.getSalary()%>

                                                    </div>

                                                    <div class="info">

                                                        <i class="bi bi-calendar-event me-2"></i>

                                                        <strong>Applied On :</strong>

                                                        <%=a.getAppliedAt().toLocalDate()%>

                                                    </div>

                                                    <div class="info">

                                                        <i class="bi bi-hash me-2"></i>

                                                        <strong>Application ID :</strong>

                                                        #<%=a.getApplicationId()%>

                                                    </div>

                                                </div>

                                                <div class="col-md-4 text-md-end">

                                                    <% String status=a.getStatus();
                                                        if("Applied".equalsIgnoreCase(status)){ %>

                                                        <span class="badge bg-primary">

                                                            <i class="bi bi-send-check-fill me-1"></i>

                                                            Applied

                                                        </span>

                                                        <% }else if("Shortlisted".equalsIgnoreCase(status)){ %>

                                                            <span class="badge bg-warning text-dark">

                                                                <i class="bi bi-star-fill me-1"></i>

                                                                Shortlisted

                                                            </span>

                                                            <% }else if("Accepted".equalsIgnoreCase(status)){ %>

                                                                <span class="badge bg-success">

                                                                    <i class="bi bi-check-circle-fill me-1"></i>

                                                                    Accepted

                                                                </span>

                                                                <% }else if("Rejected".equalsIgnoreCase(status)){ %>

                                                                    <span class="badge bg-danger">

                                                                        <i class="bi bi-x-circle-fill me-1"></i>

                                                                        Rejected

                                                                    </span>

                                                                    <% }else{ %>

                                                                        <span class="badge bg-secondary">

                                                                            <%=status%>

                                                                        </span>

                                                                        <% } %>

                                                </div>

                                            </div>

                                        </div>

                                        <% } %>

                                            <% } %>

                                                <div class="bottom-bar m-4 d-flex justify-content-end">

                                                    <a href="<%=request.getContextPath()%>/candidate/dashboard"
                                                        class="btn btn-dark">

                                                        <i class="bi bi-house-door"></i>

                                                        Dashboard

                                                    </a>

                                                </div>

                        </div>

                    </body>

                    </html>
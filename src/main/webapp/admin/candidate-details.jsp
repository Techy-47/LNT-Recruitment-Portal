<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="com.lnt.model.Candidate" %>

        <% Candidate candidate=(Candidate)request.getAttribute("candidate"); %>

            <!DOCTYPE html>
            <html>

            <head>

                <meta charset="UTF-8">

                <title>Candidate Details</title>

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

                            <i class="bi bi-person-fill"></i>

                        </div>

                        <h2>

                            <%=candidate.getFullName()%>

                        </h2>

                        <p class="mb-0">

                            Registered Candidate

                        </p>

                    </div>

                    <div class="info-card">

                        <div class="row">

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Email

                                </div>

                                <div class="info-value">

                                    <i class="bi bi-envelope-fill text-primary me-2"></i>

                                    <%=candidate.getEmail()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Phone

                                </div>

                                <div class="info-value">

                                    <i class="bi bi-telephone-fill text-success me-2"></i>

                                    <%=candidate.getPhone()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Education

                                </div>

                                <div class="info-value">

                                    <i class="bi bi-mortarboard-fill text-warning me-2"></i>

                                    <%=candidate.getEducation()%>

                                </div>

                            </div>

                            <div class="col-md-6 info-item">

                                <div class="info-title">

                                    Candidate ID

                                </div>

                                <div class="info-value">

                                    #<%=candidate.getCandidateId()%>

                                </div>

                            </div>

                            <div class="col-12">

                                <div class="info-title">

                                    Skills

                                </div>

                                <% if(candidate.getSkills()!=null){ String[] skills=candidate.getSkills().split(",");
                                    for(String s:skills){ %>

                                    <span class="skill">

                                        <%=s.trim()%>

                                    </span>

                                    <% } }else{ %>

                                        <span class="text-muted">

                                            No skills available

                                        </span>

                                        <% } %>

                            </div>

                        </div>

                    </div>

                    <div class="info-card">

                        <div class="d-flex flex-wrap gap-3">

                            <% if(candidate.getResumePath()!=null && !candidate.getResumePath().isBlank()){ %>

                                <a href="<%=request.getContextPath()%>/view-resume?file=<%=candidate.getResumePath()%>"
                                    target="_blank" class="btn btn-success action-btn">

                                    <i class="bi bi-file-earmark-pdf-fill me-2"></i>

                                    View Resume

                                </a>

                                <% }else{ %>

                                    <button class="btn btn-secondary action-btn" disabled>

                                        <i class="bi bi-file-earmark-pdf-fill me-2"></i>

                                        Resume Not Uploaded

                                    </button>

                                    <% } %>

                                        <button class="btn btn-danger action-btn" disabled>

                                            <i class="bi bi-trash-fill me-2"></i>

                                            Delete Candidate

                                        </button>

                                        <a href="<%=request.getContextPath()%>/admin/candidates"
                                            class="btn btn-dark action-btn">

                                            <i class="bi bi-arrow-left-circle me-2"></i>

                                            Back to Candidates

                                        </a>

                        </div>

                    </div>

                </div>

            </body>

            </html>
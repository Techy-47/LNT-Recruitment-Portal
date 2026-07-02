<%@ page contentType="text/html;charset=UTF-8" %>
      <%@ page import="com.lnt.model.Candidate" %>

            <% Candidate c=(Candidate) request.getAttribute("candidate"); %>

                  <!DOCTYPE html>
                  <html>

                  <head>

                        <meta charset="UTF-8">

                        <title>My Profile</title>

                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                              rel="stylesheet">

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

                                    margin: 40px 0 30px;

                                    padding: 40px;

                                    border-radius: 22px;

                                    background: linear-gradient(135deg, #2563EB, #1D4ED8);

                                    color: white;

                                    box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

                              }

                              .profile-card {

                                    background: white;

                                    border: none;

                                    border-radius: 20px;

                                    box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                                    overflow: hidden;

                              }

                              .profile-top {

                                    padding: 35px;

                                    text-align: center;

                                    background: #F8FAFC;

                                    border-bottom: 1px solid #E5E7EB;

                              }

                              .profile-avatar {

                                    width: 90px;

                                    height: 90px;

                                    background: #2563EB;

                                    color: white;

                                    font-size: 34px;

                                    font-weight: 600;

                                    border-radius: 50%;

                                    display: flex;

                                    align-items: center;

                                    justify-content: center;

                                    margin: auto;

                                    margin-bottom: 15px;

                              }

                              .profile-body {

                                    padding: 30px;

                              }

                              .info-row {

                                    display: flex;

                                    justify-content: space-between;

                                    padding: 16px 0;

                                    border-bottom: 1px solid #ECECEC;

                              }

                              .info-row:last-child {

                                    border-bottom: none;

                              }

                              .label {

                                    font-weight: 600;

                                    color: #374151;

                              }

                              .value {

                                    color: #6B7280;

                                    text-align: right;

                                    max-width: 60%;

                                    word-break: break-word;

                              }

                              .bottom-actions {

                                    margin-top: 30px;

                              }
                        </style>

                  </head>

                  <body>

                        <div class="container">

                              <div class="profile-header">

                                    <h2>My Profile</h2>

                                    <p class="mb-0">

                                          Manage your personal and professional information.

                                    </p>

                              </div>

                              <div class="profile-card">

                                    <div class="profile-top">

                                          <div class="profile-avatar">

                                                <%= c.getFullName().substring(0,1).toUpperCase() %>

                                          </div>

                                          <h3>
                                                <%= c.getFullName() %>
                                          </h3>

                                          <p class="text-muted mb-0">

                                                Candidate Profile

                                          </p>

                                    </div>

                                    <div class="profile-body">

                                          <div class="info-row">

                                                <div class="label">

                                                      <i class="bi bi-envelope-fill me-2 text-primary"></i>

                                                      Email

                                                </div>

                                                <div class="value">

                                                      <%= c.getEmail() %>

                                                </div>

                                          </div>

                                          <div class="info-row">

                                                <div class="label">

                                                      <i class="bi bi-telephone-fill me-2 text-primary"></i>

                                                      Phone

                                                </div>

                                                <div class="value">

                                                      <%= c.getPhone()==null || c.getPhone().isBlank() ? "Not Added" :
                                                            c.getPhone() %>

                                                </div>

                                          </div>

                                          <div class="info-row">

                                                <div class="label">

                                                      <i class="bi bi-mortarboard-fill me-2 text-primary"></i>

                                                      Education

                                                </div>

                                                <div class="value">

                                                      <%= c.getEducation()==null || c.getEducation().isBlank()
                                                            ? "Not Added" : c.getEducation() %>

                                                </div>

                                          </div>

                                          <div class="info-row">

                                                <div class="label">

                                                      <i class="bi bi-tools me-2 text-primary"></i>

                                                      Skills

                                                </div>

                                                <div class="value">

                                                      <%= c.getSkills()==null || c.getSkills().isBlank() ? "Not Added" :
                                                            c.getSkills() %>

                                                </div>

                                          </div>

                                          <div class="info-row">

                                                <div class="label">

                                                      <i class="bi bi-file-earmark-pdf-fill me-2 text-primary"></i>

                                                      Resume

                                                </div>

                                                <div class="value">

                                                      <% if(c.getResumePath()!=null && !c.getResumePath().isBlank()){ %>

                                                            <a target="_blank" class="btn btn-sm btn-success"
                                                                  href="<%=request.getContextPath()%>/view-resume?file=<%=c.getResumePath()%>">

                                                                  View Resume

                                                            </a>

                                                            <% }else{ %>

                                                                  <div>
                                                                        <a href="<%=request.getContextPath()%>/candidate/upload-resume.jsp"
                                                                              class="btn btn-primary">

                                                                              <i
                                                                                    class="bi bi-file-earmark-pdf-fill me-2 text-primary"></i>

                                                                              Upload Resume

                                                                        </a>
                                                                  </div>

                                                                  <% } %>

                                                </div>

                                          </div>

                                          <div class="bottom-actions d-flex justify-content-between">

                                                <a href="<%=request.getContextPath()%>/edit-profile"
                                                      class="btn btn-primary">

                                                      <i class="bi bi-pencil-square me-2"></i>

                                                      Edit Profile

                                                </a>

                                                <a href="<%=request.getContextPath()%>/candidate/dashboard"
                                                      class="btn btn-dark">

                                                      <i class="bi bi-house-door"></i>

                                                      Dashboard

                                                </a>

                                          </div>

                                    </div>

                              </div>

                        </div>

                  </body>

                  </html>
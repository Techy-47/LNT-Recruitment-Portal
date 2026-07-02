<%@ page contentType="text/html;charset=UTF-8" %>

      <!DOCTYPE html>
      <html>

      <head>

            <meta charset="UTF-8">

            <title>Upload Resume</title>

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

                  .header {

                        margin: 40px 0 30px;

                        padding: 40px;

                        border-radius: 22px;

                        background: linear-gradient(135deg, #2563EB, #1D4ED8);

                        color: white;

                        box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

                  }

                  .upload-card {

                        max-width: 700px;

                        margin: auto;

                        background: white;

                        border: none;

                        border-radius: 20px;

                        padding: 40px;

                        box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                  }

                  .upload-icon {

                        width: 100px;

                        height: 100px;

                        margin: auto;

                        border-radius: 50%;

                        background: #EEF4FF;

                        display: flex;

                        align-items: center;

                        justify-content: center;

                        font-size: 42px;

                        color: #2563EB;

                        margin-bottom: 20px;

                  }

                  .custom-file {

                        border: 2px dashed #CBD5E1;

                        border-radius: 16px;

                        padding: 35px;

                        text-align: center;

                        background: #FAFBFC;

                        transition: .3s;

                  }

                  .custom-file:hover {

                        border-color: #2563EB;

                        background: #F5F9FF;

                  }

                  .form-control {

                        border: none;

                        background: transparent;

                  }

                  .form-control:focus {

                        box-shadow: none;

                  }

                  .btn {

                        border-radius: 12px;

                        padding: 11px 22px;

                  }

                  .tip {

                        background: #F8FAFC;

                        border-left: 5px solid #2563EB;

                        padding: 15px;

                        border-radius: 10px;

                        margin-top: 25px;

                  }
            </style>

      </head>

      <body>

            <div class="container">

                  <div class="header">

                        <h2>Upload Your Resume</h2>

                        <p class="mb-0">

                              A complete and updated resume increases your chances of getting shortlisted.

                        </p>

                  </div>

                  <div class="upload-card">

                        <div class="upload-icon">

                              <i class="bi bi-file-earmark-arrow-up-fill"></i>

                        </div>

                        <h3 class="text-center mb-2">

                              Resume Upload

                        </h3>

                        <p class="text-center text-muted mb-4">

                              Only PDF files are accepted (Maximum 5 MB).

                        </p>

                        <% String msg=request.getParameter("msg"); if("success".equals(msg)){ %>

                              <div class="alert alert-success">

                                    <i class="bi bi-check-circle-fill me-2"></i>

                                    Resume uploaded successfully.

                              </div>

                              <% } if("error".equals(msg)){ %>

                                    <div class="alert alert-danger">

                                          <i class="bi bi-x-circle-fill me-2"></i>

                                          Resume upload failed. Please try again.

                                    </div>

                                    <% } if("invalid".equals(msg)){ %>

                                          <div class="alert alert-warning">

                                                <i class="bi bi-exclamation-triangle-fill me-2"></i>

                                                Only PDF files are allowed.

                                          </div>

                                          <% } %>

                                                <form method="post" enctype="multipart/form-data"
                                                      action="${pageContext.request.contextPath}/upload-resume">

                                                      <div class="custom-file">

                                                            <input type="file" name="resume" accept=".pdf"
                                                                  class="form-control" required>

                                                            <p class="mt-3 mb-0 text-muted">

                                                                  <i class="bi bi-cloud-upload me-2"></i>

                                                                  Choose your latest resume in PDF format

                                                            </p>

                                                      </div>

                                                      <div class="d-flex justify-content-between mt-4">

                                                            <a href="${pageContext.request.contextPath}/candidate/dashboard"
                                                                  class="btn btn-outline-secondary">

                                                                  <i class="bi bi-house-door"></i>

                                                                  Dashboard

                                                            </a>

                                                            <button class="btn btn-primary">

                                                                  <i class="bi bi-upload me-2"></i>

                                                                  Upload Resume

                                                            </button>

                                                      </div>

                                                </form>

                                                <div class="tip">

                                                      <strong>

                                                            <i class="bi bi-lightbulb-fill text-warning"></i>

                                                            Resume Tips

                                                      </strong>

                                                      <ul class="mt-2 mb-0">

                                                            <li>Keep your resume to one or two pages.</li>

                                                            <li>Highlight technical skills and projects.</li>

                                                            <li>Include internships, certifications, and achievements.
                                                            </li>

                                                            <li>Save your resume as a PDF before uploading.</li>

                                                      </ul>

                                                </div>

                  </div>

            </div>

      </body>

      </html>
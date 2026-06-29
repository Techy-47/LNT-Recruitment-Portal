<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%! %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Candidate Dashboard</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        </head>

        <body class="p-4">
            <div class="container">
                <h3>Welcome, ${sessionScope.candidateName}</h3>
                <p>This is a placeholder candidate dashboard.</p>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/jobs">Job Descriptions</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/my-applications">
                    My Applications
                </a>
                <a class="btn btn-success" href="${pageContext.request.contextPath}/candidate-profile">
                    My Profile
                </a>
                <a class="btn btn-warning" href="${pageContext.request.contextPath}/profile">
                    Edit Profile
                </a>
                <a class="btn btn-warning" href="${pageContext.request.contextPath}/candidate/upload-resume.jsp">
                    Upload Resume
                </a>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </body>

        </html>
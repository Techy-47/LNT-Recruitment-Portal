<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employer Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <h2 class="mb-4">
        Welcome, ${sessionScope.employerName}
    </h2>

    <!-- Statistics -->
    <div class="row mb-4">

        <div class="col-md-6">
            <div class="card shadow-sm border-primary">
                <div class="card-body text-center">
                    <h5>Total Jobs Posted</h5>
                    <h1>${totalJobs}</h1>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm border-success">
                <div class="card-body text-center">
                    <h5>Total Applications</h5>
                    <h1>${totalApplications}</h1>
                </div>
            </div>
        </div>

    </div>

    <!-- Buttons -->
    <div class="mb-4">

        <a class="btn btn-primary"
           href="${pageContext.request.contextPath}/employer/post-job">
            Post Job
        </a>

        <a class="btn btn-success"
           href="${pageContext.request.contextPath}/employer-applications">
            View Applications
        </a>

        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </div>

</div>

</body>
</html>
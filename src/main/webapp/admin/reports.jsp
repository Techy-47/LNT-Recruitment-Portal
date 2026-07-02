<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Admin Reports</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <body class="p-4">
        <div class="container">
            <h3>Download Reports</h3>
            <p class="text-muted">Export platform data as CSV files.</p>

            <div class="d-flex flex-wrap gap-2 mb-3">
                <a class="btn btn-primary"
                    href="${pageContext.request.contextPath}/admin/reports?type=candidates">Candidate Report</a>
                <a class="btn btn-primary"
                    href="${pageContext.request.contextPath}/admin/reports?type=employers">Employer Report</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/reports?type=jobs">Job
                    Report</a>
                <a class="btn btn-primary"
                    href="${pageContext.request.contextPath}/admin/reports?type=applications">Application Report</a>
            </div>

            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Back to
                Dashboard</a>
        </div>
    </body>

    </html>
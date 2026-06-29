<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Jobs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
<div class="container">
    <h3>Manage Jobs</h3>
    <a class="btn btn-outline-primary btn-sm mb-3" href="${pageContext.request.contextPath}/admin/dashboard">Back to Dashboard</a>
    <table class="table">
        <thead><tr><th>ID</th><th>Title</th><th>Employer</th><th>Active</th><th>Actions</th></tr></thead>
        <tbody>
        <c:forEach var="j" items="${jobs}">
            <tr>
                <td>${j.job_id}</td>
                <td>${j.title}</td>
                <td>${j.employer_id}</td>
                <td>${j.active}</td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/admin/jobs" style="display:inline-block">
                        <input type="hidden" name="id" value="${j.job_id}" />
                        <button name="action" value="activate" class="btn btn-sm btn-success">Activate</button>
                        <button name="action" value="deactivate" class="btn btn-sm btn-warning">Deactivate</button>
                        <button name="action" value="delete" class="btn btn-sm btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

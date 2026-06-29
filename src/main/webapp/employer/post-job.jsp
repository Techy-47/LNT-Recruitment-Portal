<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
<div class="container">
    <h3>Post a Job</h3>
    <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
    <% } %>
    <form method="post" action="${pageContext.request.contextPath}/employer/post-job">
        <div class="mb-3"><label>Title</label><input name="title" class="form-control" required></div>
        <div class="mb-3"><label>Description</label><textarea name="description" class="form-control"></textarea></div>
        <div class="mb-3"><label>Location</label><input name="location" class="form-control"></div>
        <div class="mb-3"><label>Salary</label><input name="salary" class="form-control"></div>
        <div class="mb-3"><label>Skills</label><input name="skills" class="form-control"></div>
        <div class="mb-3"><label>Experience</label><input name="experience" class="form-control" value="${param.experience}"></div>
        <div class="mb-3"><label>Application Deadline</label><input type="datetime-local" name="deadline" class="form-control" value="${param.deadline}"></div>
        <button class="btn btn-primary">Post</button>
    </form>
</div>
</body>
</html>

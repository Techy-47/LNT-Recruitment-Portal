<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employer Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">
<div class="container">
    <h3>Employer Login</h3>
    <form method="post" action="${pageContext.request.contextPath}/employer/login">
        <div class="mb-3"><label>Email</label><input name="email" type="email" class="form-control" required></div>
        <div class="mb-3"><label>Password</label><input name="password" type="password" class="form-control" required></div>
        <button class="btn btn-primary">Login</button>
    </form>
</div>
</body>
</html>

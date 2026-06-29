<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Recruitment Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Login</h3>
                    <form method="post" action="${pageContext.request.contextPath}/login">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input name="email" type="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" required>
                        </div>
                        <button class="btn btn-primary">Login</button>
                        <a class="btn btn-link" href="${pageContext.request.contextPath}/register">Register</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

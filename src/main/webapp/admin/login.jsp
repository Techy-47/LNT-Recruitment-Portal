<%@ page contentType="text/html;charset=UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Admin Login | L&T Recruitment Portal</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">

        <style>
            * {
                font-family: 'Poppins', sans-serif;
            }

            body {

                min-height: 100vh;

                display: flex;

                justify-content: center;

                align-items: center;

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

            }

            .login-card {

                width: 100%;
                max-width: 430px;

                background: white;

                border: none;

                border-radius: 22px;

                padding: 40px;

                box-shadow: 0 20px 45px rgba(0, 0, 0, .18);

            }

            .logo {

                width: 80px;
                height: 80px;

                margin: auto;

                border-radius: 50%;

                background: #EAF2FF;

                display: flex;

                justify-content: center;

                align-items: center;

                color: #2563EB;

                font-size: 34px;

                margin-bottom: 20px;

            }

            h3 {

                font-weight: 700;

                text-align: center;

                margin-bottom: 8px;

            }

            .subtitle {

                color: #6B7280;

                text-align: center;

                margin-bottom: 30px;

            }

            .form-control {

                height: 50px;

                border-radius: 12px;

            }

            .btn-login {

                height: 50px;

                border-radius: 12px;

                font-weight: 600;

                font-size: 16px;

            }

            .back-btn {

                border-radius: 12px;

                margin-top: 15px;

            }
        </style>

    </head>

    <body>

        <div class="login-card">

            <div class="logo">

                <i class="bi bi-shield-lock-fill"></i>

            </div>

            <h3>Admin Login</h3>

            <p class="subtitle">

                Secure access to Recruitment Portal Administration

            </p>

            <% String error=(String)request.getAttribute("error"); if(error!=null){ %>

                <div class="alert alert-danger">

                    <i class="bi bi-exclamation-circle-fill me-2"></i>

                    <%=error%>

                </div>

                <% } %>

                    <form method="post" action="<%=request.getContextPath()%>/admin/login">

                        <div class="mb-3">

                            <label class="form-label">

                                Username

                            </label>

                            <div class="input-group">

                                <span class="input-group-text">

                                    <i class="bi bi-person-fill"></i>

                                </span>

                                <input type="text" name="username" class="form-control" placeholder="Enter username"
                                    required>

                            </div>

                        </div>

                        <div class="mb-4">

                            <label class="form-label">

                                Password

                            </label>

                            <div class="input-group">

                                <span class="input-group-text">

                                    <i class="bi bi-lock-fill"></i>

                                </span>

                                <input type="password" name="password" id="password" class="form-control"
                                    placeholder="Enter password" required>

                                <button class="btn btn-outline-secondary" type="button" onclick="togglePassword()">

                                    <i class="bi bi-eye" id="eyeIcon"></i>

                                </button>

                            </div>

                        </div>

                        <button class="btn btn-primary w-100 btn-login">

                            <i class="bi bi-box-arrow-in-right me-2"></i>

                            Login

                        </button>

                    </form>

                    <a href="<%=request.getContextPath()%>/" class="btn btn-outline-dark w-100 back-btn">

                        <i class="bi bi-arrow-left-circle me-2"></i>

                        Back to Home

                    </a>

        </div>

        <script>

            function togglePassword() {

                const password = document.getElementById("password");

                const eye = document.getElementById("eyeIcon");

                if (password.type === "password") {

                    password.type = "text";

                    eye.className = "bi bi-eye-slash";

                } else {

                    password.type = "password";

                    eye.className = "bi bi-eye";

                }

            }

        </script>

    </body>

    </html>
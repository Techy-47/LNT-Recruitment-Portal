<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Employer Registration</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">

        <style>
            * {
                font-family: 'Poppins', sans-serif;
            }

            body {

                background: #EEF3FA;

                height: 100vh;

                display: flex;

                align-items: center;

                justify-content: center;

            }

            .register-card {

                max-width: 1100px;

                width: 100%;

                border-radius: 24px;

                overflow: hidden;

                background: white;

                box-shadow: 0 20px 50px rgba(0, 0, 0, .12);

            }

            .left-panel {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

                padding: 60px 45px;

                height: 100%;

                display: flex;

                flex-direction: column;

                justify-content: center;

            }

            .left-panel h1 {

                font-weight: 700;

                margin-bottom: 20px;

            }

            .left-panel p {

                opacity: .9;

                line-height: 1.8;

            }

            .feature {

                margin-top: 18px;

                font-size: 15px;

            }

            .feature i {

                margin-right: 10px;

            }

            .right-panel {

                padding: 45px;

            }

            .form-title {

                font-weight: 700;

                margin-bottom: 8px;

            }

            .form-subtitle {

                color: #64748B;

                margin-bottom: 30px;

            }

            .input-group-text {

                background: white;

                border-right: none;

            }

            .form-control {

                border-left: none;

                padding: 12px;

            }

            .form-control:focus {

                box-shadow: none;

                border-color: #ced4da;

            }

            .input-group {

                margin-bottom: 20px;

            }

            .btn-register {

                background: #2563EB;

                color: white;

                padding: 12px;

                border-radius: 12px;

                font-weight: 600;

            }

            .btn-register:hover {

                background: #1D4ED8;

                color: white;

            }

            .login-link {

                text-align: center;

                margin-top: 20px;

            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="register-card">

                <div class="row g-0">

                    <div class="col-lg-5">

                        <div class="left-panel">

                            <h1>

                                L&T Recruitment

                            </h1>

                            <p>

                                Hire exceptional talent faster with a modern recruitment platform designed for companies
                                of every size.

                            </p>

                            <div class="feature">

                                <i class="bi bi-check-circle-fill"></i>

                                Post unlimited job openings

                            </div>

                            <div class="feature">

                                <i class="bi bi-check-circle-fill"></i>

                                Review applications easily

                            </div>

                            <div class="feature">

                                <i class="bi bi-check-circle-fill"></i>

                                Manage hiring in one place

                            </div>

                        </div>

                    </div>

                    <div class="col-lg-7">

                        <div class="right-panel">

                            <h2 class="form-title">

                                Create Employer Account

                            </h2>

                            <p class="form-subtitle">

                                Register your company and start hiring today.

                            </p>

                            <form method="post" action="${pageContext.request.contextPath}/employer/register">

                                <div class="input-group">

                                    <span class="input-group-text">

                                        <i class="bi bi-building"></i>

                                    </span>

                                    <input type="text" name="companyName" class="form-control"
                                        placeholder="Company Name" required>

                                </div>

                                <div class="input-group">

                                    <span class="input-group-text">

                                        <i class="bi bi-envelope"></i>

                                    </span>

                                    <input type="email" name="email" class="form-control" placeholder="Company Email"
                                        required>

                                </div>

                                <div class="input-group">

                                    <span class="input-group-text">

                                        <i class="bi bi-lock"></i>

                                    </span>

                                    <input type="password" id="password" name="password" class="form-control"
                                        placeholder="Password" required>

                                    <span class="input-group-text" style="cursor:pointer;" onclick="togglePassword()">

                                        <i id="eyeIcon" class="bi bi-eye"></i>

                                    </span>

                                </div>

                                <div class="input-group">

                                    <span class="input-group-text">

                                        <i class="bi bi-briefcase"></i>

                                    </span>

                                    <input type="text" name="industry" class="form-control" placeholder="Industry">

                                </div>

                                <div class="input-group">

                                    <span class="input-group-text">

                                        <i class="bi bi-globe"></i>

                                    </span>

                                    <input type="text" name="website" class="form-control" placeholder="Website">

                                </div>

                                <button class="btn btn-register w-100">

                                    Create Account

                                </button>

                            </form>

                            <div class="login-link">

                                Already have an account?

                                <a href="${pageContext.request.contextPath}/employer/login">

                                    Login

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script>

            function togglePassword() {

                const password = document.getElementById("password");
                const icon = document.getElementById("eyeIcon");

                if (password.type === "password") {

                    password.type = "text";

                    icon.classList.remove("bi-eye");

                    icon.classList.add("bi-eye-slash");

                } else {

                    password.type = "password";

                    icon.classList.remove("bi-eye-slash");

                    icon.classList.add("bi-eye");

                }

            }

        </script>

    </body>

    </html>
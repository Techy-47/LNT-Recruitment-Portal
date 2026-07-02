<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">

        <title>Candidate Login</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {

                min-height: 100vh;

                display: flex;

                align-items: center;

                justify-content: center;

                background: linear-gradient(135deg, #EEF4FF, #F8FAFC);

            }

            .login-card {

                width: 100%;

                max-width: 1050px;

                background: #fff;

                border-radius: 24px;

                overflow: hidden;

                box-shadow: 0 20px 45px rgba(0, 0, 0, .12);

            }

            .left-panel {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

                padding: 60px 45px;

                display: flex;

                flex-direction: column;

                justify-content: center;

                height: 100%;

            }

            .left-panel h1 {

                font-size: 40px;

                font-weight: 700;

                margin-bottom: 18px;

            }

            .left-panel p {

                opacity: .9;

                line-height: 1.8;

                margin-bottom: 35px;

            }

            .feature {

                margin-bottom: 18px;

                font-size: 16px;

            }

            .feature i {

                margin-right: 10px;

            }

            .right-panel {

                padding: 50px;

            }

            .right-panel h2 {

                font-weight: 700;

                margin-bottom: 8px;

            }

            .subtitle {

                color: #6B7280;

                margin-bottom: 35px;

            }

            .input-group {

                margin-bottom: 22px;

            }

            .input-group-text {

                background: white;

                border-right: none;

            }

            .form-control {

                border-left: none;

                padding: 13px;

            }

            .form-control:focus {

                box-shadow: none;

                border-color: #ced4da;

            }

            .toggle-password {

                cursor: pointer;

            }

            .btn-login {

                background: #2563EB;

                color: white;

                padding: 12px;

                font-weight: 600;

                border-radius: 12px;

                transition: .3s;

            }

            .btn-login:hover {

                background: #1D4ED8;

                color: white;

            }

            .footer-text {

                margin-top: 25px;

                text-align: center;

                color: #6B7280;

            }

            .footer-text a {

                text-decoration: none;

                font-weight: 600;

            }

            @media(max-width:991px) {

                .left-panel {

                    display: none;

                }

                .right-panel {

                    padding: 35px;

                }

            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="login-card">

                <div class="row g-0">

                    <div class="col-lg-5">

                        <div class="left-panel">

                            <h1>Recruitment Portal</h1>

                            <p>

                                Welcome back! Log in to explore new job opportunities, manage your applications, and
                                keep your profile updated.

                            </p>

                            <div class="feature">

                                <i class="bi bi-search"></i>

                                Browse Latest Jobs

                            </div>

                            <div class="feature">

                                <i class="bi bi-file-earmark-check"></i>

                                Track Your Applications

                            </div>

                            <div class="feature">

                                <i class="bi bi-person-circle"></i>

                                Manage Your Profile

                            </div>

                        </div>

                    </div>

                    <div class="col-lg-7">

                        <div class="right-panel">

                            <h2>Candidate Login</h2>

                            <p class="subtitle">

                                Sign in to continue your job search journey.

                            </p>

                            <form method="post" action="${pageContext.request.contextPath}/login">

                                <div class="input-group">

                                    <span class="input-group-text">

                                        <i class="bi bi-envelope-fill"></i>

                                    </span>

                                    <input type="email" name="email" class="form-control" placeholder="Email Address"
                                        required>

                                </div>

                                <div class="input-group">

                                    <span class="input-group-text">

                                        <i class="bi bi-lock-fill"></i>

                                    </span>

                                    <input type="password" id="password" name="password" class="form-control"
                                        placeholder="Password" required>

                                    <span class="input-group-text toggle-password" onclick="togglePassword()">

                                        <i id="eyeIcon" class="bi bi-eye"></i>

                                    </span>

                                </div>

                                <button class="btn btn-login w-100">

                                    <i class="bi bi-box-arrow-in-right me-2"></i>

                                    Login

                                </button>

                            </form>

                            <div class="footer-text">

                                Don't have an account?

                                <a href="${pageContext.request.contextPath}/register">

                                    Create Account

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
                const eye = document.getElementById("eyeIcon");

                if (password.type === "password") {

                    password.type = "text";

                    eye.classList.remove("bi-eye");
                    eye.classList.add("bi-eye-slash");

                } else {

                    password.type = "password";

                    eye.classList.remove("bi-eye-slash");
                    eye.classList.add("bi-eye");

                }

            }

        </script>

    </body>

    </html>
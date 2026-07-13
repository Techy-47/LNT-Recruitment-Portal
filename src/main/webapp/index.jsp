<%@ page contentType="text/html;charset=UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>L&T Recruitment Portal</title>

        <!-- Bootstrap -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Google Font -->

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet">

        <style>
            * {
                font-family: 'Poppins', sans-serif;
            }

            html {
                scroll-behavior: smooth;
            }

            body {

                margin: 0;

                background: #F8FAFC;

                color: #1E293B;

                overflow-x: hidden;

            }

            a {
                text-decoration: none;
            }

            /* ===========================
   Navbar
=========================== */

            .navbar-custom {

                position: fixed;

                top: 20px;

                left: 50%;

                transform: translateX(-50%);

                width: 92%;

                max-width: 1300px;

                background: rgba(255, 255, 255, .75);

                backdrop-filter: blur(18px);

                -webkit-backdrop-filter: blur(18px);

                border: 1px solid rgba(255, 255, 255, .35);

                border-radius: 18px;

                padding: 14px 28px;

                box-shadow: 0 12px 35px rgba(15, 23, 42, .08);

                z-index: 999;

            }

            .logo {

                font-size: 26px;

                font-weight: 700;

                color: #2563EB;

            }

            .logo span {

                color: #0F172A;

            }

            .nav-link-custom {

                color: #334155;

                font-weight: 500;

                margin-left: 22px;

                transition: .3s;

            }

            .nav-link-custom:hover {

                color: #2563EB;

            }

            .login-btn {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

                padding: 10px 22px;

                border-radius: 50px;

                font-weight: 600;

                transition: .3s;

            }

            .login-btn:hover {

                color: white;

                transform: translateY(-2px);

                box-shadow: 0 10px 25px rgba(37, 99, 235, .25);

            }

            .dropdown-menu {

                border: none;

                border-radius: 15px;

                padding: 12px;

                box-shadow: 0 15px 40px rgba(0, 0, 0, .10);

            }

            .dropdown-item {

                border-radius: 10px;

                padding: 10px 14px;

            }

            .dropdown-item:hover {

                background: #EFF6FF;

                color: #2563EB;

            }

            /* ===========================
   Hero Section
=========================== */

            .hero {

                min-height: 100vh;

                display: flex;

                align-items: center;

                background: linear-gradient(135deg, #EFF6FF 0%, #FFFFFF 55%, #DBEAFE 100%);

                padding: 140px 0 80px;

                position: relative;

                overflow: hidden;

            }

            .hero::before {

                content: "";

                position: absolute;

                width: 420px;

                height: 420px;

                background: #60A5FA;

                opacity: .12;

                border-radius: 50%;

                top: -120px;

                right: -120px;

            }

            .hero::after {

                content: "";

                position: absolute;

                width: 300px;

                height: 300px;

                background: #2563EB;

                opacity: .08;

                border-radius: 50%;

                bottom: -120px;

                left: -120px;

            }

            .hero-title {

                font-size: 58px;

                font-weight: 800;

                line-height: 1.15;

                color: #0F172A;

            }

            .hero-title span {

                color: #2563EB;

            }

            .hero-text {

                font-size: 18px;

                color: #64748B;

                margin: 30px 0;

                line-height: 1.8;

                max-width: 550px;

            }

            .hero-btn {

                padding: 15px 34px;

                border-radius: 50px;

                font-weight: 600;

                transition: .3s;

            }

            .hero-primary {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                color: white;

            }

            .hero-primary:hover {

                color: white;

                transform: translateY(-3px);

                box-shadow: 0 15px 35px rgba(37, 99, 235, .25);

            }

            .hero-secondary {

                border: 2px solid #2563EB;

                color: #2563EB;

            }

            .hero-secondary:hover {

                background: #2563EB;

                color: white;

            }

            .hero-card {

                background: white;

                border-radius: 28px;

                padding: 40px;

                box-shadow: 0 20px 50px rgba(15, 23, 42, .10);

            }


            /* ===========================
   Statistics Section
=========================== */

            .statistics {

                padding: 90px 0;

                background: #FFFFFF;

            }

            .section-title {

                font-size: 42px;

                font-weight: 700;

                color: #0F172A;

            }

            .section-subtitle {

                color: #64748B;

                max-width: 650px;

                margin: 15px auto 60px;

                line-height: 1.8;

            }

            .stat-card {

                background: white;

                border-radius: 22px;

                padding: 40px 25px;

                text-align: center;

                border: 1px solid #E2E8F0;

                transition: .35s;

                height: 100%;

            }

            .stat-card:hover {

                transform: translateY(-10px);

                box-shadow: 0 18px 45px rgba(37, 99, 235, .12);

            }

            .stat-icon {

                width: 80px;

                height: 80px;

                border-radius: 50%;

                margin: auto;

                display: flex;

                justify-content: center;

                align-items: center;

                font-size: 34px;

                color: white;

                margin-bottom: 25px;

            }

            .blue {

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

            }

            .green {

                background: linear-gradient(135deg, #10B981, #059669);

            }

            .orange {

                background: linear-gradient(135deg, #F59E0B, #D97706);

            }

            .purple {

                background: linear-gradient(135deg, #8B5CF6, #7C3AED);

            }

            .stat-number {

                font-size: 42px;

                font-weight: 800;

                color: #0F172A;

            }

            .stat-title {

                margin-top: 10px;

                color: #64748B;

                font-weight: 500;

            }

            /* ===========================
   Features Section
=========================== */

            .features {

                padding: 100px 0;

                background: #F8FAFC;

            }

            .feature-card {

                background: white;

                border-radius: 24px;

                padding: 35px 30px;

                height: 100%;

                transition: .35s;

                border: 1px solid #E2E8F0;

                box-shadow: 0 8px 25px rgba(15, 23, 42, .05);

            }

            .feature-card:hover {

                transform: translateY(-12px);

                box-shadow: 0 20px 45px rgba(37, 99, 235, .15);

            }

            .feature-icon {

                width: 72px;

                height: 72px;

                border-radius: 18px;

                display: flex;

                justify-content: center;

                align-items: center;

                font-size: 30px;

                color: white;

                margin-bottom: 25px;

            }

            .feature-card h4 {

                font-weight: 700;

                margin-bottom: 15px;

                color: #0F172A;

            }

            .feature-card p {

                color: #64748B;

                line-height: 1.8;

                margin: 0;

            }

            /* ===========================
   How It Works
=========================== */

            .how-it-works {

                padding: 100px 0;

                background: #FFFFFF;

            }

            .timeline {

                position: relative;

                max-width: 900px;

                margin: 70px auto 0;

            }

            .timeline::before {

                content: "";

                position: absolute;

                left: 50%;

                top: 0;

                transform: translateX(-50%);

                width: 4px;

                height: 100%;

                background: #DBEAFE;

                border-radius: 50px;

            }

            .timeline-item {

                position: relative;

                width: 50%;

                padding: 20px 40px;

                margin-bottom: 35px;

            }

            .timeline-item.left {

                left: 0;

                text-align: right;

            }

            .timeline-item.right {

                left: 50%;

            }

            .timeline-content {

                background: white;

                padding: 28px;

                border-radius: 20px;

                border: 1px solid #E2E8F0;

                box-shadow: 0 10px 30px rgba(15, 23, 42, .08);

                transition: .35s;

            }

            .timeline-content:hover {

                transform: translateY(-8px);

                box-shadow: 0 18px 40px rgba(37, 99, 235, .12);

            }

            .timeline-dot {

                position: absolute;

                top: 45px;

                width: 22px;

                height: 22px;

                background: #2563EB;

                border: 5px solid white;

                border-radius: 50%;

                box-shadow: 0 0 0 5px #DBEAFE;

            }

            .timeline-item.left .timeline-dot {

                right: -11px;

            }

            .timeline-item.right .timeline-dot {

                left: -11px;

            }

            .timeline-icon {

                width: 65px;

                height: 65px;

                border-radius: 16px;

                display: flex;

                align-items: center;

                justify-content: center;

                font-size: 28px;

                color: white;

                margin-bottom: 18px;

            }

            .timeline-content h4 {

                font-weight: 700;

                margin-bottom: 10px;

            }

            .timeline-content p {

                margin: 0;

                color: #64748B;

                line-height: 1.8;

            }

            @media(max-width:991px) {

                .timeline::before {

                    left: 25px;

                }

                .timeline-item {

                    width: 100%;

                    left: 0 !important;

                    padding-left: 70px;

                    padding-right: 15px;

                    text-align: left !important;

                }

                .timeline-dot {

                    left: 14px !important;

                    right: auto !important;

                }

            }

            /* ===========================
   Platform Modules
=========================== */

            .modules {

                padding: 100px 0;

                background: #F8FAFC;

            }

            .module-card {

                background: white;

                border-radius: 28px;

                padding: 40px;

                height: 100%;

                transition: .35s;

                border: 1px solid #E2E8F0;

                overflow: hidden;

                position: relative;

            }

            .module-card:hover {

                transform: translateY(-10px);

                box-shadow: 0 20px 45px rgba(37, 99, 235, .12);

            }

            .module-icon {

                width: 90px;

                height: 90px;

                border-radius: 24px;

                display: flex;

                align-items: center;

                justify-content: center;

                font-size: 42px;

                color: white;

                margin-bottom: 25px;

            }

            .module-card h3 {

                font-weight: 700;

                margin-bottom: 18px;

            }

            .module-card ul {

                list-style: none;

                padding: 0;

                margin: 25px 0;

            }

            .module-card ul li {

                margin-bottom: 14px;

                color: #475569;

            }

            .module-card ul li i {

                color: #10B981;

                margin-right: 10px;

            }

            .module-btn {

                border-radius: 50px;

                padding: 12px 24px;

                font-weight: 600;

            }

            /* ===========================
   CTA Section
=========================== */

            .cta {

                padding: 100px 0;

                background: #F8FAFC;

            }

            .cta-box {

                position: relative;

                overflow: hidden;

                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                border-radius: 30px;

                padding: 80px 50px;

                color: white;

                text-align: center;

                box-shadow: 0 25px 60px rgba(37, 99, 235, .30);

            }

            .cta-box::before {

                content: "";

                position: absolute;

                width: 320px;

                height: 320px;

                background: rgba(255, 255, 255, .08);

                border-radius: 50%;

                top: -120px;

                right: -100px;

            }

            .cta-box::after {

                content: "";

                position: absolute;

                width: 260px;

                height: 260px;

                background: rgba(255, 255, 255, .05);

                border-radius: 50%;

                bottom: -120px;

                left: -90px;

            }

            .cta-box>* {

                position: relative;

                z-index: 2;

            }

            .cta-box h2 {

                font-size: 48px;

                font-weight: 800;

                margin-bottom: 20px;

            }

            .cta-box p {

                max-width: 760px;

                margin: auto;

                opacity: .92;

                font-size: 18px;

                line-height: 1.8;

            }

            .cta-btn {

                padding: 15px 34px;

                border-radius: 50px;

                font-weight: 600;

                transition: .3s;

            }

            .cta-white {

                background: white;

                color: #2563EB;

            }

            .cta-white:hover {

                background: #F1F5F9;

                color: #2563EB;

                transform: translateY(-3px);

            }

            .cta-outline {

                border: 2px solid white;

                color: white;

            }

            .cta-outline:hover {

                background: white;

                color: #2563EB;

            }

            /* ===========================
   Footer
=========================== */

            .footer {

                background: #0F172A;

                color: #CBD5E1;

                padding: 80px 0 25px;

            }

            .footer-logo {

                font-size: 30px;

                font-weight: 700;

                color: white;

                margin-bottom: 18px;

            }

            .footer-logo span {

                color: #3B82F6;

            }

            .footer-text {

                line-height: 1.8;

                color: #94A3B8;

                max-width: 340px;

            }

            .footer h5 {

                color: white;

                margin-bottom: 22px;

                font-weight: 700;

            }

            .footer ul {

                list-style: none;

                padding: 0;

                margin: 0;

            }

            .footer ul li {

                margin-bottom: 12px;

            }

            .footer ul li a {

                color: #94A3B8;

                transition: .3s;

            }

            .footer ul li a:hover {

                color: white;

                padding-left: 6px;

            }

            .footer-contact i {

                color: #3B82F6;

                margin-right: 10px;

            }

            .social-icons {

                display: flex;

                gap: 14px;

                margin-top: 25px;

            }

            .social-icons a {

                width: 44px;

                height: 44px;

                border-radius: 50%;

                display: flex;

                justify-content: center;

                align-items: center;

                background: #1E293B;

                color: white;

                transition: .3s;

            }

            .social-icons a:hover {

                background: #2563EB;

                transform: translateY(-4px);

            }

            .footer-bottom {

                border-top: 1px solid rgba(255, 255, 255, .08);

                margin-top: 55px;

                padding-top: 22px;

                color: #94A3B8;

                font-size: 15px;

            }

            .footer-bottom strong {

                color: white;

            }
        </style>

    </head>

    <body>
        <nav class="navbar-custom">

            <div class="d-flex justify-content-between align-items-center">

                <a href="<%=request.getContextPath()%>/" class="logo">

                    L&T <span>Recruitment</span>

                </a>

                <div class="d-none d-lg-flex align-items-center">

                    <a href="#home" class="nav-link-custom">Home</a>

                    <a href="#features" class="nav-link-custom">Features</a>

                    <a href="#statistics" class="nav-link-custom">Statistics</a>

                    <a href="#about" class="nav-link-custom">About</a>

                </div>

                <div class="dropdown">

                    <a class="login-btn dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">

                        Login

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>

                            <a class="dropdown-item" href="<%=request.getContextPath()%>/candidate/login">

                                <i class="bi bi-person me-2"></i>

                                Candidate Login

                            </a>

                        </li>

                        <li>

                            <a class="dropdown-item" href="<%=request.getContextPath()%>/employer/login">

                                <i class="bi bi-building me-2"></i>

                                Employer Login

                            </a>

                        </li>

                        <li>

                            <a class="dropdown-item" href="<%=request.getContextPath()%>/admin/login">

                                <i class="bi bi-shield-lock me-2"></i>

                                Admin Login

                            </a>

                        </li>

                    </ul>

                </div>

            </div>

        </nav>

        <section class="hero" id="home">

            <div class="container-xl">

                <div class="row align-items-center">

                    <div class="col-lg-6">

                        <h1 class="hero-title">

                            Build Your

                            <span>Dream Career</span>

                            With Confidence

                        </h1>

                        <p class="hero-text">

                            Discover exciting opportunities, connect with top employers,
                            and manage your recruitment journey through one modern platform.
                            Whether you're searching for your next role or hiring exceptional talent,
                            L&T Recruitment Portal makes the process simple and efficient.

                        </p>

                        <div class="d-flex flex-wrap gap-3">

                            <a href="<%=request.getContextPath()%>/jobs" class="btn hero-btn hero-primary">

                                <i class="bi bi-search me-2"></i>

                                Find Jobs

                            </a>

                            <a href="<%=request.getContextPath()%>/employer/register"
                                class="btn hero-btn hero-secondary">

                                <i class="bi bi-building-add me-2"></i>

                                Hire Talent

                            </a>

                        </div>

                    </div>

                    <div class="col-lg-6 mt-5 mt-lg-0">

                        <div class="hero-card">

                            <img src="<%=request.getContextPath()%>/assets/1.png" class="img-fluid"
                                alt="Recruitment">

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="statistics" id="statistics">

            <div class="container-xl">

                <div class="text-center mb-5">

                    <h2 class="section-title">

                        Trusted by Professionals

                    </h2>

                    <p class="section-subtitle">

                        Empowering job seekers and employers through a reliable,
                        efficient, and modern recruitment platform.

                    </p>

                </div>

                <div class="row g-4">

                    <div class="col-md-6 col-lg-3">

                        <div class="stat-card">

                            <div class="stat-icon blue">

                                <i class="bi bi-people-fill"></i>

                            </div>

                            <div class="stat-number">

                                25K+

                            </div>

                            <div class="stat-title">

                                Registered Candidates

                            </div>

                        </div>

                    </div>

                    <div class="col-md-6 col-lg-3">

                        <div class="stat-card">

                            <div class="stat-icon green">

                                <i class="bi bi-buildings-fill"></i>

                            </div>

                            <div class="stat-number">

                                500+

                            </div>

                            <div class="stat-title">

                                Hiring Companies

                            </div>

                        </div>

                    </div>

                    <div class="col-md-6 col-lg-3">

                        <div class="stat-card">

                            <div class="stat-icon orange">

                                <i class="bi bi-briefcase-fill"></i>

                            </div>

                            <div class="stat-number">

                                1200+

                            </div>

                            <div class="stat-title">

                                Active Job Openings

                            </div>

                        </div>

                    </div>

                    <div class="col-md-6 col-lg-3">

                        <div class="stat-card">

                            <div class="stat-icon purple">

                                <i class="bi bi-award-fill"></i>

                            </div>

                            <div class="stat-number">

                                95%

                            </div>

                            <div class="stat-title">

                                Hiring Success Rate

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="features" id="features">

            <div class="container-xl">

                <div class="text-center mb-5">

                    <h2 class="section-title">

                        Why Choose L&T Recruitment Portal?

                    </h2>

                    <p class="section-subtitle">

                        A complete recruitment platform designed to simplify hiring,
                        improve collaboration, and provide a seamless experience for
                        candidates, employers, and administrators.

                    </p>

                </div>

                <div class="row g-4">

                    <!-- Feature 1 -->

                    <div class="col-md-6 col-lg-4">

                        <div class="feature-card">

                            <div class="feature-icon blue">

                                <i class="bi bi-file-earmark-arrow-up-fill"></i>

                            </div>

                            <h4>Resume Management</h4>

                            <p>

                                Upload, store and securely access resumes with a dedicated
                                resume viewer integrated into the platform.

                            </p>

                        </div>

                    </div>

                    <!-- Feature 2 -->

                    <div class="col-md-6 col-lg-4">

                        <div class="feature-card">

                            <div class="feature-icon green">

                                <i class="bi bi-search"></i>

                            </div>

                            <h4>Smart Job Search</h4>

                            <p>

                                Browse opportunities using filters and quickly find
                                jobs that match your skills and interests.

                            </p>

                        </div>

                    </div>

                    <!-- Feature 3 -->

                    <div class="col-md-6 col-lg-4">

                        <div class="feature-card">

                            <div class="feature-icon orange">

                                <i class="bi bi-building-fill-gear"></i>

                            </div>

                            <h4>Employer Dashboard</h4>

                            <p>

                                Post jobs, manage vacancies, review applicants and
                                update recruitment status from one dashboard.

                            </p>

                        </div>

                    </div>

                    <!-- Feature 4 -->

                    <div class="col-md-6 col-lg-4">

                        <div class="feature-card">

                            <div class="feature-icon purple">

                                <i class="bi bi-bar-chart-fill"></i>

                            </div>

                            <h4>Analytics & Reports</h4>

                            <p>

                                Access visual analytics, platform insights and export
                                detailed CSV reports for administrative purposes.

                            </p>

                        </div>

                    </div>

                    <!-- Feature 5 -->

                    <div class="col-md-6 col-lg-4">

                        <div class="feature-card">

                            <div class="feature-icon blue">

                                <i class="bi bi-shield-lock-fill"></i>

                            </div>

                            <h4>Secure Authentication</h4>

                            <p>

                                Role-based access with dedicated login systems for
                                Candidates, Employers and Administrators.

                            </p>

                        </div>

                    </div>

                    <!-- Feature 6 -->

                    <div class="col-md-6 col-lg-4">

                        <div class="feature-card">

                            <div class="feature-icon green">

                                <i class="bi bi-diagram-3-fill"></i>

                            </div>

                            <h4>Application Tracking</h4>

                            <p>

                                Track every stage of recruitment from application
                                submission to selection with real-time status updates.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="how-it-works" id="about">

            <div class="container">

                <div class="text-center">

                    <h2 class="section-title">

                        How It Works

                    </h2>

                    <p class="section-subtitle">

                        A simple recruitment journey designed for both candidates and employers.

                    </p>

                </div>

                <div class="timeline">

                    <div class="timeline-item left">

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-icon blue">

                                <i class="bi bi-person-plus-fill"></i>

                            </div>

                            <h4>Create an Account</h4>

                            <p>

                                Register as a Candidate or Employer and securely access the recruitment portal.

                            </p>

                        </div>

                    </div>

                    <div class="timeline-item right">

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-icon green">

                                <i class="bi bi-person-vcard-fill"></i>

                            </div>

                            <h4>Complete Your Profile</h4>

                            <p>

                                Add your personal details, upload your resume, or create your company profile.

                            </p>

                        </div>

                    </div>

                    <div class="timeline-item left">

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-icon orange">

                                <i class="bi bi-search"></i>

                            </div>

                            <h4>Find or Post Jobs</h4>

                            <p>

                                Candidates search and apply for jobs while employers publish new opportunities.

                            </p>

                        </div>

                    </div>

                    <div class="timeline-item right">

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-icon purple">

                                <i class="bi bi-clipboard-check-fill"></i>

                            </div>

                            <h4>Application Review</h4>

                            <p>

                                Employers review applications, shortlist candidates and update recruitment status.

                            </p>

                        </div>

                    </div>

                    <div class="timeline-item left">

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-icon blue">

                                <i class="bi bi-trophy-fill"></i>

                            </div>

                            <h4>Get Hired</h4>

                            <p>

                                Track your application progress and take the next step in your professional career.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="modules">

            <div class="container">

                <div class="text-center mb-5">

                    <h2 class="section-title">

                        Built For Everyone

                    </h2>

                    <p class="section-subtitle">

                        Three dedicated portals designed to simplify every stage of the recruitment process.

                    </p>

                </div>

                <div class="row g-4">

                    <!-- Candidate -->

                    <div class="col-lg-4">

                        <div class="module-card">

                            <div class="module-icon blue">

                                <i class="bi bi-person-workspace"></i>

                            </div>

                            <h3>Candidate Portal</h3>

                            <p>

                                Everything a job seeker needs to build a successful career.

                            </p>

                            <ul>

                                <li><i class="bi bi-check-circle-fill"></i> Profile Management</li>

                                <li><i class="bi bi-check-circle-fill"></i> Resume Upload</li>

                                <li><i class="bi bi-check-circle-fill"></i> Browse Jobs</li>

                                <li><i class="bi bi-check-circle-fill"></i> Apply Online</li>

                                <li><i class="bi bi-check-circle-fill"></i> Track Applications</li>

                            </ul>

                            <a href="<%=request.getContextPath()%>/candidate/login" class="btn btn-primary module-btn">

                                Candidate Login

                            </a>

                        </div>

                    </div>

                    <!-- Employer -->

                    <div class="col-lg-4">

                        <div class="module-card">

                            <div class="module-icon green">

                                <i class="bi bi-buildings-fill"></i>

                            </div>

                            <h3>Employer Portal</h3>

                            <p>

                                Recruit talented professionals through an efficient hiring workflow.

                            </p>

                            <ul>

                                <li><i class="bi bi-check-circle-fill"></i> Post Jobs</li>

                                <li><i class="bi bi-check-circle-fill"></i> Manage Vacancies</li>

                                <li><i class="bi bi-check-circle-fill"></i> View Applications</li>

                                <li><i class="bi bi-check-circle-fill"></i> Resume Viewer</li>

                                <li><i class="bi bi-check-circle-fill"></i> Candidate Selection</li>

                            </ul>

                            <a href="<%=request.getContextPath()%>/employer/login" class="btn btn-success module-btn">

                                Employer Login

                            </a>

                        </div>

                    </div>

                    <!-- Admin -->

                    <div class="col-lg-4">

                        <div class="module-card">

                            <div class="module-icon purple">

                                <i class="bi bi-shield-lock-fill"></i>

                            </div>

                            <h3>Admin Portal</h3>

                            <p>

                                Complete administrative control over the recruitment ecosystem.

                            </p>

                            <ul>

                                <li><i class="bi bi-check-circle-fill"></i> Dashboard</li>

                                <li><i class="bi bi-check-circle-fill"></i> User Management</li>

                                <li><i class="bi bi-check-circle-fill"></i> Job Management</li>

                                <li><i class="bi bi-check-circle-fill"></i> Reports</li>

                                <li><i class="bi bi-check-circle-fill"></i> Analytics</li>

                            </ul>

                            <a href="<%=request.getContextPath()%>/admin/login" class="btn btn-dark module-btn">

                                Admin Login

                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="cta">

            <div class="container">

                <div class="cta-box">

                    <h2>

                        Ready to Take the Next Step?
                    </h2>

                    <p>

                        Whether you're searching for your first opportunity or building a high-performing team, our
                        platform provides the tools you need to succeed.

                    </p>

                    <div class="d-flex justify-content-center flex-wrap gap-3 mt-5">

                        <a href="<%=request.getContextPath()%>/candidate/register" class="btn cta-btn cta-white">

                            <i class="bi bi-person-plus-fill me-2"></i>

                            Start Your Career

                        </a>

                        <a href="<%=request.getContextPath()%>/employer/register" class="btn cta-btn cta-outline">

                            <i class="bi bi-building-add me-2"></i>

                            Hire Talent

                        </a>

                    </div>

                </div>

            </div>

        </section>
        <footer class="footer">

            <div class="container">

                <div class="row gy-5">

                    <div class="col-lg-4">

                        <div class="footer-logo">

                            L&T <span>Recruitment</span>

                        </div>

                        <p class="footer-text">

                            Connecting talented professionals with leading organizations through
                            a secure, modern and efficient recruitment platform built using
                            Java Full Stack technologies.

                        </p>

                        <div class="social-icons">

                            <a href="#"><i class="bi bi-github"></i></a>

                            <a href="#"><i class="bi bi-linkedin"></i></a>

                            <a href="#"><i class="bi bi-twitter-x"></i></a>

                            <a href="#"><i class="bi bi-envelope-fill"></i></a>

                        </div>

                    </div>

                    <div class="col-lg-2">

                        <h5>

                            Quick Links

                        </h5>

                        <ul>

                            <li><a href="#home">Home</a></li>

                            <li><a href="#features">Features</a></li>

                            <li><a href="#statistics">Statistics</a></li>

                            <li><a href="#about">How It Works</a></li>

                        </ul>

                    </div>

                    <div class="col-lg-3">

                        <h5>

                            Portal Access

                        </h5>

                        <ul>

                            <li>

                                <a href="<%=request.getContextPath()%>/candidate/login">

                                    Candidate Login

                                </a>

                            </li>

                            <li>

                                <a href="<%=request.getContextPath()%>/employer/login">

                                    Employer Login

                                </a>

                            </li>

                            <li>

                                <a href="<%=request.getContextPath()%>/admin/login">

                                    Admin Login

                                </a>

                            </li>

                            <li>

                                <a href="<%=request.getContextPath()%>/candidate/register">

                                    Create Account

                                </a>

                            </li>

                        </ul>

                    </div>

                    <div class="col-lg-3">

                        <h5>

                            Contact

                        </h5>

                        <ul class="footer-contact">

                            <li>

                                <i class="bi bi-envelope-fill"></i>

                                support@lntportal.com

                            </li>

                            <li>

                                <i class="bi bi-geo-alt-fill"></i>

                                Punjab, India

                            </li>

                            <li>

                                <i class="bi bi-clock-fill"></i>

                                Monday - Friday

                            </li>

                            <li>

                                <i class="bi bi-shield-check"></i>

                                Secure Recruitment Platform

                            </li>

                        </ul>

                    </div>

                </div>

                <div class="footer-bottom">

                    <div class="d-lg-flex justify-content-between align-items-center">

                        <div>

                            © 2026

                            <strong>

                                L&T Recruitment Portal

                            </strong>

                            All Rights Reserved.

                        </div>
                    </div>

                </div>

            </div>

        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    </body>

    </html>
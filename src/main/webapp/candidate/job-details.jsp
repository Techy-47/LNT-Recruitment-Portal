<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="com.lnt.model.Job" %>
        <%@ page import="java.time.format.DateTimeFormatter" %>

            <% Job job=(Job) request.getAttribute("job"); DateTimeFormatter formatter=DateTimeFormatter.ofPattern("dd MMM yyyy"); %>

                <!DOCTYPE html>
                <html>

                <head>

                    <meta charset="UTF-8">

                    <title>Job Details</title>

                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

                    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                        rel="stylesheet">

                    <style>
                        * {
                            font-family: 'Poppins', sans-serif;
                        }

                        body {

                            background: #F4F7FC;

                        }

                        .hero {

                            background: linear-gradient(135deg, #2563EB, #1D4ED8);

                            color: white;

                            border-radius: 24px;

                            padding: 40px;

                            margin: 35px 0;

                            box-shadow: 0 18px 40px rgba(37, 99, 235, .25);

                        }

                        .hero h2 {

                            font-weight: 700;

                            margin-bottom: 15px;

                        }

                        .hero-info {

                            display: flex;

                            flex-wrap: wrap;

                            gap: 20px;

                            margin-top: 20px;

                            font-size: 15px;

                        }

                        .hero-info span {

                            display: flex;

                            align-items: center;

                            gap: 8px;

                            background: rgba(255, 255, 255, .15);

                            padding: 10px 18px;

                            border-radius: 30px;

                        }

                        .section-card {

                            background: #fff;

                            border: none;

                            border-radius: 20px;

                            padding: 28px;

                            margin-bottom: 25px;

                            box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                        }

                        .section-title {

                            font-size: 22px;

                            font-weight: 600;

                            color: #1D4ED8;

                            margin-bottom: 18px;

                        }

                        .skill-badge {

                            display: inline-block;

                            background: #E8F1FF;

                            color: #2563EB;

                            padding: 10px 18px;

                            border-radius: 30px;

                            margin: 6px;

                            font-weight: 500;

                        }

                        .apply-box {

                            background: white;

                            border-radius: 22px;

                            padding: 30px;

                            text-align: center;

                            box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                            margin-bottom: 40px;

                        }

                        .apply-btn {

                            padding: 14px 45px;

                            border-radius: 40px;

                            font-size: 18px;

                            font-weight: 600;

                        }

                        .back-btn {

                            border-radius: 30px;

                            padding: 10px 22px;

                        }
                    </style>

                </head>

                <body>

                    <div class="container">

                        <div class="mt-4">

                            <a href="<%=request.getContextPath()%>/jobs" class="btn btn-outline-dark back-btn">

                                <i class="bi bi-arrow-left-circle me-2"></i>

                                Back to Browse Jobs

                            </a>

                        </div>


                        <div class="hero">

                            <h2>

                                <i class="bi bi-briefcase-fill me-2"></i>

                                <%=job.getTitle()%>

                            </h2>

                            <p class="mb-0">

                                Explore the opportunity and apply if it matches your skills.

                            </p>

                            <div class="hero-info">

                                <span>

                                    <i class="bi bi-geo-alt-fill"></i>

                                    <%=job.getLocation()%>

                                </span>

                                <span>

                                    <i class="bi bi-cash-stack"></i>

                                    ₹ <%=job.getSalary()%>

                                </span>

                                <span>

                                    <i class="bi bi-person-workspace"></i>

                                    <%=job.getExperienceRequired()%>

                                </span>

                                <span>

                                    <i class="bi bi-calendar-event"></i>

                                    <% if(job.getDeadline()!=null){ %>

                                        Apply Before
                                        <%=job.getDeadline().format(formatter)%>

                                            <% }else{ %>

                                                No Deadline

                                                <% } %>

                                </span>

                            </div>

                        </div>


                        <div class="section-card">

                            <div class="section-title">

                                <i class="bi bi-file-earmark-text-fill me-2"></i>

                                Job Description

                            </div>

                            <p class="mb-0">

                                <%=job.getDescription()%>

                            </p>

                        </div>


                        <div class="section-card">

                            <div class="section-title">

                                <i class="bi bi-lightbulb-fill me-2"></i>

                                Required Skills

                            </div>

                            <% if(job.getSkillsRequired()!=null){ String[] skills=job.getSkillsRequired().split(",");
                                for(String skill : skills){ %>

                                <span class="skill-badge">

                                    <%=skill.trim()%>

                                </span>

                                <% } } %>

                        </div>


                        <div class="section-card">

                            <div class="section-title">

                                <i class="bi bi-info-circle-fill me-2"></i>

                                Job Information

                            </div>

                            <div class="row">

                                <div class="col-md-6 mb-3">

                                    <strong>

                                        <i class="bi bi-geo-alt-fill me-2 text-primary"></i>

                                        Location

                                    </strong>

                                    <br>

                                    <%=job.getLocation()%>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <strong>

                                        <i class="bi bi-cash-stack me-2 text-success"></i>

                                        Salary

                                    </strong>

                                    <br>

                                    ₹ <%=job.getSalary()%>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <strong>

                                        <i class="bi bi-person-workspace me-2 text-warning"></i>

                                        Experience

                                    </strong>

                                    <br>

                                    <%=job.getExperienceRequired()%>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <strong>

                                        <i class="bi bi-calendar-event me-2 text-danger"></i>

                                        Application Deadline

                                    </strong>

                                    <br>

                                    <% if(job.getDeadline()!=null){ %>

                                        <%=job.getDeadline().format(formatter)%>

                                            <% }else{ %>

                                                Not Specified

                                                <% } %>

                                </div>

                            </div>

                        </div>


                        <div class="apply-box">

                            <h4 class="fw-bold mb-3">

                                Ready to Apply?

                            </h4>

                            <p class="text-muted mb-4">

                                Submit your application and let recruiters review your profile.

                            </p>

                            <form method="post" action="<%=request.getContextPath()%>/apply-job">

                                <input type="hidden" name="jobId" value="<%=job.getJobId()%>">

                                <button class="btn btn-success apply-btn">

                                    <i class="bi bi-send-check-fill me-2"></i>

                                    Apply Now

                                </button>

                            </form>

                        </div>

                    </div>

                </body>

                </html>
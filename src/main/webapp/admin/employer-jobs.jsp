<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.lnt.model.Employer" %>
            <%@ page import="com.lnt.model.Job" %>

                <% Employer employer=(Employer)request.getAttribute("employer"); List<Job> jobs=(List<Job>
                        )request.getAttribute("jobs");
                        %>

                        <!DOCTYPE html>
                        <html>

                        <head>

                            <meta charset="UTF-8">

                            <title>Employer Jobs</title>

                            <meta name="viewport" content="width=device-width, initial-scale=1">

                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                                rel="stylesheet">

                            <link rel="stylesheet"
                                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

                            <link
                                href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
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

                                    padding: 35px;

                                    border-radius: 22px;

                                    margin: 35px 0;

                                    box-shadow: 0 18px 40px rgba(37, 99, 235, .22);

                                }

                                .hero h2 {

                                    font-weight: 700;

                                    margin-bottom: 5px;

                                }

                                .summary-card {

                                    background: white;

                                    border: none;

                                    border-radius: 18px;

                                    box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                                }

                                .summary-icon {

                                    width: 65px;

                                    height: 65px;

                                    border-radius: 50%;

                                    background: #EAF2FF;

                                    display: flex;

                                    align-items: center;

                                    justify-content: center;

                                    font-size: 30px;

                                    color: #2563EB;

                                }

                                .search-box {

                                    height: 48px;

                                    border-radius: 14px;

                                }

                                .job-card {

                                    background: white;

                                    border: none;

                                    border-radius: 18px;

                                    padding: 25px;

                                    box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                                    transition: .3s;

                                    margin-bottom: 20px;

                                }

                                .job-card:hover {

                                    transform: translateY(-4px);

                                }

                                .info {

                                    margin-bottom: 10px;

                                    color: #555;

                                }

                                .info strong {

                                    color: #111827;

                                }

                                .badge-skill {

                                    background: #EEF4FF;

                                    color: #2563EB;

                                    padding: 7px 12px;

                                    border-radius: 20px;

                                    margin: 3px;

                                    display: inline-block;

                                    font-size: 13px;

                                    font-weight: 500;

                                }
                            </style>

                        </head>

                        <body>

                            <div class="container">

                                <div class="hero">

                                    <h2>

                                        <i class="bi bi-buildings-fill me-2"></i>

                                        <%=employer.getCompanyName()%>

                                    </h2>

                                    <p class="mb-0">

                                        Jobs posted by this employer

                                    </p>

                                </div>

                                <div class="row mb-4">

                                    <div class="col-md-4">

                                        <div class="card summary-card">

                                            <div class="card-body d-flex align-items-center">

                                                <div class="summary-icon">

                                                    <i class="bi bi-briefcase-fill"></i>

                                                </div>

                                                <div class="ms-3">

                                                    <h3>

                                                        <%=jobs==null ? 0 : jobs.size()%>

                                                    </h3>

                                                    <small class="text-muted">

                                                        Total Jobs

                                                    </small>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                    <div class="col-md-8">

                                        <input type="text" id="searchInput" class="form-control search-box"
                                            placeholder="Search by title, location, skills or salary...">

                                    </div>

                                </div>

                                <% if(jobs==null || jobs.isEmpty()){ %>

                                    <div class="alert alert-info">

                                        <i class="bi bi-info-circle-fill me-2"></i>

                                        This employer hasn't posted any jobs.

                                    </div>

                                    <% }else{ %>

                                        <div id="jobContainer">
                                            <% for(Job job : jobs){ %>

                                                <div class="job-card">

                                                    <div
                                                        class="d-flex justify-content-between align-items-start flex-wrap">

                                                        <div>

                                                            <h4 class="fw-bold mb-3">

                                                                <i class="bi bi-briefcase-fill text-primary me-2"></i>

                                                                <%=job.getTitle()%>

                                                            </h4>

                                                        </div>

                                                        <span class="badge bg-primary">

                                                            Job ID #<%=job.getJobId()%>

                                                        </span>

                                                    </div>

                                                    <div class="info">

                                                        <strong>

                                                            <i class="bi bi-geo-alt-fill text-danger me-2"></i>

                                                            Location :

                                                        </strong>

                                                        <%=job.getLocation()%>

                                                    </div>

                                                    <div class="info">

                                                        <strong>

                                                            <i class="bi bi-currency-rupee text-success me-2"></i>

                                                            Salary :

                                                        </strong>

                                                        <%=job.getSalary()%>

                                                    </div>

                                                    <div class="info">

                                                        <strong>

                                                            <i class="bi bi-award-fill text-warning me-2"></i>

                                                            Experience :

                                                        </strong>

                                                        <%=job.getExperienceRequired()%>

                                                    </div>

                                                    <div class="info">

                                                        <strong>

                                                            <i class="bi bi-card-text text-primary me-2"></i>

                                                            Description :

                                                        </strong>

                                                        <%=job.getDescription()%>

                                                    </div>

                                                    <div class="info">

                                                        <strong>

                                                            <i class="bi bi-tools text-secondary me-2"></i>

                                                            Skills :

                                                        </strong>

                                                        <br><br>

                                                        <% if(job.getSkillsRequired()!=null){ String[]
                                                            skills=job.getSkillsRequired().split(","); for(String
                                                            skill:skills){ %>

                                                            <span class="badge-skill">

                                                                <%=skill.trim()%>

                                                            </span>

                                                            <% } }else{ %>

                                                                <span class="text-muted">

                                                                    No Skills Mentioned

                                                                </span>

                                                                <% } %>

                                                    </div>

                                                    <% if(job.getDeadline()!=null){ %>

                                                        <div class="info">

                                                            <strong>

                                                                <i class="bi bi-calendar-event-fill text-info me-2"></i>

                                                                Deadline :

                                                            </strong>

                                                            <%=job.getDeadline().toLocalDate()%>

                                                        </div>

                                                        <% } %>

                                                </div>

                                                <% } %>

                                        </div>

                                        <% } %>

                                            <div
                                                class="d-flex justify-content-between align-items-center mt-4 flex-wrap">

                                                <div class="text-muted">

                                                    Showing

                                                    <strong>

                                                        <%=jobs==null ? 0 : jobs.size()%>

                                                    </strong>

                                                    job(s)

                                                </div>

                                                <a href="<%=request.getContextPath()%>/admin/employer?id=<%=employer.getEmployerId()%>"
                                                    class="btn btn-dark rounded-pill">

                                                    <i class="bi bi-arrow-left-circle me-2"></i>

                                                    Back to Employer

                                                </a>

                                            </div>

                            </div>

                            <script>

                                const search = document.getElementById("searchInput");

                                if (search) {

                                    search.addEventListener("keyup", function () {

                                        const filter = this.value.toLowerCase();

                                        const cards = document.querySelectorAll(".job-card");

                                        cards.forEach(function (card) {

                                            const text = card.innerText.toLowerCase();

                                            card.style.display = text.includes(filter) ? "" : "none";

                                        });

                                    });

                                }

                            </script>

                        </body>

                        </html>
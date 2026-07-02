<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.lnt.model.Candidate" %>

            <% List<Candidate> candidates =
                (List<Candidate>) request.getAttribute("candidates");
                    %>

                    <!DOCTYPE html>
                    <html>

                    <head>

                        <meta charset="UTF-8">

                        <title>Manage Candidates</title>

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

                            .page-header {

                                background: linear-gradient(135deg, #2563EB, #1D4ED8);

                                color: white;

                                padding: 35px;

                                border-radius: 22px;

                                margin: 35px 0;

                                box-shadow: 0 18px 40px rgba(37, 99, 235, .22);

                            }

                            .page-header h2 {

                                font-weight: 700;

                                margin-bottom: 8px;

                            }

                            .summary-card {

                                background: white;

                                border: none;

                                border-radius: 18px;

                                box-shadow: 0 8px 25px rgba(0, 0, 0, .08);

                                transition: .3s;

                            }

                            .summary-card:hover {

                                transform: translateY(-5px);

                            }

                            .summary-icon {

                                width: 65px;

                                height: 65px;

                                border-radius: 50%;

                                display: flex;

                                justify-content: center;

                                align-items: center;

                                background: #EAF2FF;

                                color: #2563EB;

                                font-size: 30px;

                            }

                            .table-card {

                                background: white;

                                border: none;

                                border-radius: 20px;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                                overflow: hidden;

                            }

                            .table thead {

                                background: #2563EB;

                                color: white;

                            }

                            .table th {

                                border: none;

                                padding: 16px;

                            }

                            .table td {

                                vertical-align: middle;

                                padding: 18px 16px;

                            }

                            .table tbody tr:hover {

                                background: #F8FAFF;

                            }

                            .candidate-avatar {

                                width: 48px;

                                height: 48px;

                                border-radius: 50%;

                                background: #EAF2FF;

                                color: #2563EB;

                                display: flex;

                                justify-content: center;

                                align-items: center;

                                font-size: 22px;

                                margin-right: 12px;

                            }

                            .skill {

                                display: inline-block;

                                background: #EEF4FF;

                                color: #2563EB;

                                padding: 6px 12px;

                                border-radius: 20px;

                                margin: 3px;

                                font-size: 13px;

                                font-weight: 500;

                            }

                            .search-box {

                                border-radius: 14px;

                                height: 48px;

                            }

                            .back-btn {

                                border-radius: 30px;

                            }

                            .empty-card {

                                background: white;

                                border: none;

                                border-radius: 20px;

                                padding: 50px;

                                text-align: center;

                                box-shadow: 0 10px 30px rgba(0, 0, 0, .08);

                            }

                            .empty-card i {

                                font-size: 70px;

                                color: #2563EB;

                            }
                        </style>

                    </head>

                    <body>

                        <div class="container">

                            <% String success=(String) session.getAttribute("success"); String error=(String)
                                session.getAttribute("error"); if(success !=null){ %>

                                <div class="alert alert-success alert-dismissible fade show mt-4">

                                    <i class="bi bi-check-circle-fill me-2"></i>

                                    <%=success%>

                                        <button class="btn-close" data-bs-dismiss="alert">
                                        </button>

                                </div>

                                <% session.removeAttribute("success"); } if(error !=null){ %>

                                    <div class="alert alert-danger alert-dismissible fade show mt-4">

                                        <i class="bi bi-exclamation-triangle-fill me-2"></i>

                                        <%=error%>

                                            <button class="btn-close" data-bs-dismiss="alert">
                                            </button>

                                    </div>

                                    <% session.removeAttribute("error"); } %>

                                        <div class="page-header">

                                            <div class="d-flex justify-content-between align-items-center flex-wrap">

                                                <div>

                                                    <h2>

                                                        <i class="bi bi-people-fill me-2"></i>

                                                        Manage Candidates

                                                    </h2>

                                                    <p class="mb-0">

                                                        View and manage all registered candidates on the Recruitment
                                                        Portal.

                                                    </p>

                                                </div>

                                                <div class="text-end">

                                                    <h3 class="fw-bold">

                                                        <%= candidates==null ? 0 : candidates.size() %>

                                                    </h3>

                                                    <small>Total Candidates</small>

                                                </div>

                                            </div>

                                        </div>

                                        <div class="row mb-4">

                                            <div class="col-md-4">

                                                <div class="card summary-card">

                                                    <div class="card-body d-flex align-items-center">

                                                        <div class="summary-icon">

                                                            <i class="bi bi-people-fill"></i>

                                                        </div>

                                                        <div class="ms-3">

                                                            <h3 class="mb-0">

                                                                <%= candidates==null ? 0 : candidates.size() %>

                                                            </h3>

                                                            <small class="text-muted">

                                                                Registered Candidates

                                                            </small>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                            <div class="col-md-8">

                                                <input type="text" id="searchInput" class="form-control search-box"
                                                    placeholder="🔍 Search by name, email, education or skills...">

                                            </div>

                                        </div>

                                        <% if(candidates==null || candidates.isEmpty()){ %>

                                            <div class="empty-card">

                                                <i class="bi bi-people-fill"></i>

                                                <h3 class="mt-4">

                                                    No Candidates Found

                                                </h3>

                                                <p class="text-muted">

                                                    There are currently no registered candidates.

                                                </p>

                                            </div>

                                            <% } else { %>

                                                <div class="table-card">

                                                    <table class="table align-middle mb-0" id="candidateTable">

                                                        <thead>

                                                            <tr>

                                                                <th>Candidate</th>

                                                                <th>Contact</th>

                                                                <th>Education</th>

                                                                <th>Skills</th>

                                                                <th class="text-center">Actions</th>

                                                            </tr>

                                                        </thead>

                                                        <tbody>
                                                            <% for(Candidate c : candidates){ %>

                                                                <tr>

                                                                    <td>

                                                                        <div class="d-flex align-items-center">

                                                                            <div class="candidate-avatar">

                                                                                <i class="bi bi-person-fill"></i>

                                                                            </div>

                                                                            <div>

                                                                                <div class="fw-semibold">

                                                                                    <%=c.getFullName()%>

                                                                                </div>

                                                                                <small class="text-muted">

                                                                                    Candidate ID #
                                                                                    <%=c.getCandidateId()%>

                                                                                </small>

                                                                            </div>

                                                                        </div>

                                                                    </td>

                                                                    <td>

                                                                        <div>

                                                                            <i
                                                                                class="bi bi-envelope-fill text-primary me-2"></i>

                                                                            <%=c.getEmail()%>

                                                                        </div>

                                                                        <div class="mt-2">

                                                                            <i
                                                                                class="bi bi-telephone-fill text-success me-2"></i>

                                                                            <%=c.getPhone()%>

                                                                        </div>

                                                                    </td>

                                                                    <td>

                                                                        <%=c.getEducation()%>

                                                                    </td>

                                                                    <td>

                                                                        <% if(c.getSkills()!=null &&
                                                                            !c.getSkills().isBlank()){ String[]
                                                                            skills=c.getSkills().split(","); for(String
                                                                            skill:skills){ %>

                                                                            <span class="skill">

                                                                                <%=skill.trim()%>

                                                                            </span>

                                                                            <% } }else{ %>

                                                                                <span class="text-muted">

                                                                                    Not Available

                                                                                </span>

                                                                                <% } %>

                                                                    </td>

                                                                    <td class="text-center">

                                                                        <a href="<%=request.getContextPath()%>/admin/candidate?id=<%=c.getCandidateId()%>"
                                                                            class="btn btn-outline-primary btn-sm me-2">

                                                                            <i class="bi bi-eye-fill"></i>

                                                                            View

                                                                        </a>

                                                                        <form method="post"
                                                                            action="<%=request.getContextPath()%>/admin/delete-candidate"
                                                                            class="d-inline"
                                                                            onsubmit="return confirmDelete('<%=c.getFullName()%>');">

                                                                            <input type="hidden" name="candidateId"
                                                                                value="<%=c.getCandidateId()%>">

                                                                            <button type="submit"
                                                                                class="btn btn-outline-danger btn-sm">

                                                                                <i class="bi bi-trash-fill"></i>

                                                                                Delete

                                                                            </button>

                                                                        </form>

                                                                    </td>

                                                                </tr>

                                                                <% } %>

                                                        </tbody>

                                                    </table>

                                                </div>

                                                <% } %>

                                                    <div
                                                        class="mt-4 d-flex justify-content-between align-items-center flex-wrap">

                                                        <div class="text-muted">

                                                            Showing

                                                            <strong>

                                                                <%= candidates==null ? 0 : candidates.size() %>

                                                            </strong>

                                                            candidate(s)

                                                        </div>

                                                        <a href="<%=request.getContextPath()%>/admin/dashboard"
                                                            class="btn btn-dark back-btn">

                                                            <i class="bi bi-arrow-left-circle me-2"></i>

                                                            Back to Dashboard

                                                        </a>

                                                    </div>

                        </div>

                        <script>

                            const searchInput = document.getElementById("searchInput");

                            if (searchInput) {

                                searchInput.addEventListener("keyup", function () {

                                    const filter = this.value.toLowerCase();

                                    const rows = document.querySelectorAll("#candidateTable tbody tr");

                                    rows.forEach(function (row) {

                                        const text = row.innerText.toLowerCase();

                                        row.style.display = text.includes(filter) ? "" : "none";

                                    });

                                });

                            }

                            function confirmDelete(name) {

                                return confirm(
                                    "Are you sure you want to delete\n\n"
                                    + name
                                    + "?\n\nThis action cannot be undone."
                                );

                            }

                        </script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

                    </body>

                    </html>
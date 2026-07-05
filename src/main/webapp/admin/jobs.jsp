<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html>

        <head>

            <meta charset="UTF-8">

            <title>Manage Jobs</title>

            <meta name="viewport" content="width=device-width, initial-scale=1">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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

                .job-icon {

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

                .search-box {

                    height: 48px;

                    border-radius: 14px;

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

                <c:if test="${not empty sessionScope.success}">

                    <div class="alert alert-success alert-dismissible fade show mt-4">

                        <i class="bi bi-check-circle-fill me-2"></i>

                        ${sessionScope.success}

                        <button class="btn-close" data-bs-dismiss="alert"></button>

                    </div>

                    <c:remove var="success" scope="session" />

                </c:if>

                <c:if test="${not empty sessionScope.error}">

                    <div class="alert alert-danger alert-dismissible fade show mt-4">

                        <i class="bi bi-exclamation-triangle-fill me-2"></i>

                        ${sessionScope.error}

                        <button class="btn-close" data-bs-dismiss="alert"></button>

                    </div>

                    <c:remove var="error" scope="session" />

                </c:if>

                <div class="page-header">

                    <div class="d-flex justify-content-between align-items-center flex-wrap">

                        <div>

                            <h2>

                                <i class="bi bi-briefcase-fill me-2"></i>

                                Manage Jobs

                            </h2>

                            <p class="mb-0">

                                View and manage all jobs posted on the Recruitment Portal.

                            </p>

                        </div>

                        <div class="text-end">

                            <h3 class="fw-bold">

                                ${jobs.size()}

                            </h3>

                            <small>Total Jobs</small>

                        </div>

                    </div>

                </div>

                <div class="row mb-4">

                    <div class="col-md-4">

                        <div class="card summary-card">

                            <div class="card-body d-flex align-items-center">

                                <div class="summary-icon">

                                    <i class="bi bi-briefcase-fill"></i>

                                </div>

                                <div class="ms-3">

                                    <h3 class="mb-0">

                                        ${jobs.size()}

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
                            placeholder="🔍 Search by title, employer ID or location...">

                    </div>

                </div>
                <c:choose>

                    <c:when test="${empty jobs}">

                        <div class="empty-card">

                            <i class="bi bi-briefcase-fill"></i>

                            <h3 class="mt-4">

                                No Jobs Found

                            </h3>

                            <p class="text-muted">

                                There are currently no jobs available.

                            </p>

                        </div>

                    </c:when>

                    <c:otherwise>

                        <div class="table-card">

                            <table class="table align-middle mb-0" id="jobTable">

                                <thead>

                                    <tr>

                                        <th>Job</th>

                                        <th>Employer</th>

                                        <th>Location</th>

                                        <th>Salary</th>

                                        <th>Status</th>

                                        <th class="text-center">Actions</th>

                                    </tr>

                                </thead>

                                <tbody>

                                    <c:forEach var="j" items="${jobs}">

                                        <tr>

                                            <td>

                                                <div class="d-flex align-items-center">

                                                    <div class="job-icon">

                                                        <i class="bi bi-briefcase-fill"></i>

                                                    </div>

                                                    <div>

                                                        <div class="fw-semibold">

                                                            ${j.title}

                                                        </div>

                                                        <small class="text-muted">

                                                            Job ID #${j.jobId}

                                                        </small>

                                                    </div>

                                                </div>

                                            </td>

                                            <td>
                                                Employer #${j.employerId}
                                            </td>

                                            <td>
                                                <i class="bi bi-geo-alt-fill text-danger me-1"></i>
                                                ${j.location}
                                            </td>
                                            <td>
                                                ₹ ${j.salary}
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${j.active}">
                                                        <span class="badge bg-success">
                                                            Active
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-danger">
                                                            Inactive
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <a href="${pageContext.request.contextPath}/job-details?id=${j.jobId}"
                                                    class="btn btn-outline-primary btn-sm me-1">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/admin/edit-job?id=${j.jobId}"
                                                    class="btn btn-outline-warning btn-sm me-1">
                                                    <i class="bi bi-pencil-fill"></i>
                                                </a>
                                                <form method="post"
                                                    action="${pageContext.request.contextPath}/admin/jobs"
                                                    class="d-inline">
                                                    <input type="hidden" name="id" value="${j.jobId}">
                                                    <c:choose>
                                                        <c:when test="${j.active}">
                                                            <button type="submit" name="action" value="deactivate"
                                                                class="btn btn-outline-secondary btn-sm me-1">
                                                                <i class="bi bi-pause-fill"></i>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="submit" name="action" value="activate"
                                                                class="btn btn-outline-success btn-sm me-1">
                                                                <i class="bi bi-play-fill"></i>
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <button type="submit" name="action" value="delete"
                                                        class="btn btn-outline-danger btn-sm"
                                                        onclick="return confirmDelete('${j.title}')">
                                                        <i class="bi bi-trash-fill"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="mt-4 d-flex justify-content-between align-items-center flex-wrap">
                    <div class="text-muted">
                        Showing
                        <strong>
                            ${jobs.size()}
                        </strong>
                        job(s)
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-dark ms-auto">
                        <i class="bi bi-house-door"></i>
                        Dashboard
                    </a>
                </div>
            </div>
            <script>
                const searchInput = document.getElementById("searchInput");
                if (searchInput) {
                    searchInput.addEventListener("keyup", function () {
                        const filter = this.value.toLowerCase();
                        const rows = document.querySelectorAll("#jobTable tbody tr");
                        rows.forEach(function (row) {
                            const text = row.innerText.toLowerCase();
                            row.style.display = text.includes(filter) ? "" : "none";
                        });
                    });
                }
                function confirmDelete(title) {
                    return confirm(
                        "Are you sure you want to delete\n\n"
                        + title +
                        "\n\nThis action cannot be undone."
                    );
                }
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>
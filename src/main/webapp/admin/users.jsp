<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Admin - Users</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="preconnect" href="https://fonts.googleapis.com">

            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

            <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
        </head>

        <body class="p-4">
            <div class="container">
                <h3>Manage Users</h3>
                <a class="btn btn-outline-primary btn-sm mb-3"
                    href="${pageContext.request.contextPath}/admin/dashboard">Back to Dashboard</a>

                <h5>Candidates</h5>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <td>${c.active}</td>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${candidates}">
                            <tr>
                                <td>${c.candidate_id}</td>
                                <td>${c.full_name}</td>
                                <td>${c.email}</td>
                                <td>${c.active}</td>
                                <td>
                                    <form method="post" action="${pageContext.request.contextPath}/admin/users/action"
                                        style="display:inline-block">
                                        <input type="hidden" name="type" value="candidate" />
                                        <input type="hidden" name="id" value="${c.candidate_id}" />
                                        <button name="action" value="activate"
                                            class="btn btn-sm btn-success">Activate</button>
                                        <button name="action" value="deactivate"
                                            class="btn btn-sm btn-warning">Deactivate</button>
                                        <button name="action" value="delete"
                                            class="btn btn-sm btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <h5>Employers</h5>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Company</th>
                            <th>Email</th>
                            <th>Active</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="e" items="${employers}">
                            <tr>
                                <td>${e.employer_id}</td>
                                <td>${e.company_name}</td>
                                <td>${e.email}</td>
                                <td>${e.active}</td>
                                <td>
                                    <form method="post" action="${pageContext.request.contextPath}/admin/users/action"
                                        style="display:inline-block">
                                        <input type="hidden" name="type" value="employer" />
                                        <input type="hidden" name="id" value="${e.employer_id}" />
                                        <button name="action" value="activate"
                                            class="btn btn-sm btn-success">Activate</button>
                                        <button name="action" value="deactivate"
                                            class="btn btn-sm btn-warning">Deactivate</button>
                                        <button name="action" value="delete"
                                            class="btn btn-sm btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </body>

        </html>
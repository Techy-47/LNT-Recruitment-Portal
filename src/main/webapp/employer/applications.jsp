<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.lnt.model.Application" %>

            <html>

            <head>
                <title>Applications Received</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="container mt-4">

                <h2>Applications Received</h2>

                <% List<Application> applications =
                    (List<Application>) request.getAttribute("applications");
                        %>

                        <% if(applications==null || applications.isEmpty()){ %>

                            <div class="alert alert-info">
                                No applications received yet.
                            </div>

                            <% } else { %>

                                <table class="table table-bordered table-hover align-middle">

                                    <thead class="table-dark">
                                        <tr>
                                            <th>Application ID</th>
                                            <th>Candidate</th>
                                            <th>Job</th>
                                            <th>Status</th>
                                            <th>Resume</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <% for(Application app : applications){ %>

                                            <tr>

                                                <td>
                                                    <%= app.getApplicationId() %>
                                                </td>

                                                <td>
                                                    <%= app.getCandidateName() %>
                                                </td>

                                                <td>
                                                    <%= app.getJobTitle() %>
                                                </td>

                                                <td>
                                                    <span class="badge bg-primary">
                                                        <%= app.getStatus() %>
                                                    </span>
                                                </td>

                                                <td>

                                                    <% if(app.getResumePath() !=null){ %>

                                                        <a class="btn btn-sm btn-success" target="_blank"
                                                            href="<%= request.getContextPath() + " /" +
                                                            app.getResumePath() %>">

                                                            View Resume

                                                        </a>

                                                        <% } else { %>

                                                            <span class="text-danger">
                                                                No Resume
                                                            </span>

                                                            <% } %>

                                                </td>

                                                <td>

                                                    <form
                                                        action="<%=request.getContextPath()%>/update-application-status"
                                                        method="post" class="d-flex gap-1">

                                                        <input type="hidden" name="applicationId"
                                                            value="<%=app.getApplicationId()%>">

                                                        <button class="btn btn-success btn-sm" type="submit"
                                                            name="status" value="Accepted">

                                                            Accept

                                                        </button>

                                                        <button class="btn btn-warning btn-sm" type="submit"
                                                            name="status" value="Shortlisted">

                                                            Shortlist

                                                        </button>

                                                        <button class="btn btn-danger btn-sm" type="submit"
                                                            name="status" value="Rejected">

                                                            Reject

                                                        </button>

                                                    </form>

                                                </td>

                                            </tr>

                                            <% } %>

                                    </tbody>

                                </table>

                                <% } %>

                                    <br>

                                    <a class="btn btn-secondary"
                                        href="<%=request.getContextPath()%>/employer/dashboard.jsp">

                                        Back

                                    </a>

            </body>

            </html>
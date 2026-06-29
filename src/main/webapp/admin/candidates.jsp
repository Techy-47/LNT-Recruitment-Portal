<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lnt.model.Candidate" %>

<html>

<head>

    <title>Manage Candidates</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>

<body class="container mt-4">

<h2>Manage Candidates</h2>

<%
    List<Candidate> candidates =
            (List<Candidate>) request.getAttribute("candidates");
%>

<% if(candidates == null || candidates.isEmpty()){ %>

<div class="alert alert-warning">
    No candidates found.
</div>

<% } else { %>

<table class="table table-bordered table-hover">

    <thead class="table-dark">

    <tr>

        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Education</th>
        <th>Skills</th>
        <th>Action</th>

    </tr>

    </thead>

    <tbody>

    <% for(Candidate c : candidates){ %>

    <tr>

        <td><%= c.getCandidateId() %></td>

        <td><%= c.getFullName() %></td>

        <td><%= c.getEmail() %></td>

        <td><%= c.getPhone() %></td>

        <td><%= c.getEducation() %></td>

        <td><%= c.getSkills() %></td>

        <td>

            <button
                    class="btn btn-danger btn-sm"
                    disabled>

                Delete

            </button>

        </td>

    </tr>

    <% } %>

    </tbody>

</table>

<% } %>

<br>

<a
        class="btn btn-secondary"
        href="<%=request.getContextPath()%>/admin/dashboard">

    Back

</a>

</body>

</html>
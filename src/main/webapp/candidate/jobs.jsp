<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lnt.model.Job" %>

<html>
<head>
    <title>Available Jobs</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="container mt-4">

<h2>Available Jobs</h2>

<%
List<Job> jobs = (List<Job>) request.getAttribute("jobs");

for(Job job : jobs){
%>

<div class="card mb-3">
    <div class="card-body">

        <h4><%= job.getTitle() %></h4>

        <p>
            <strong>Location:</strong>
            <%= job.getLocation() %>
        </p>

        <p>
            <strong>Salary:</strong>
            <%= job.getSalary() %>
        </p>

        <p>
            <strong>Skills:</strong>
            <%= job.getSkillsRequired() %>
        </p>

        <form method="post"
      action="${pageContext.request.contextPath}/apply-job">

    <input type="hidden"
           name="jobId"
           value="<%= job.getJobId() %>">

    <button type="submit"
            class="btn btn-primary">
        Apply
    </button>

</form>

    </div>
</div>

<%
}
%>

</body>
</html>
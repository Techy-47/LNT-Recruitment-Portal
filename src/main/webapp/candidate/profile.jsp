<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.lnt.model.Candidate" %>

<%
Candidate c =
(Candidate) request.getAttribute("candidate");
%>

<html>
<head>
<title>My Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body class="container mt-4">

<h2>My Profile</h2>

<table class="table table-bordered">

<tr>
<td>Full Name</td>
<td><%= c.getFullName() %></td>
</tr>

<tr>
<td>Email</td>
<td><%= c.getEmail() %></td>
</tr>

<tr>
<td>Phone</td>
<td><%= c.getPhone() %></td>
</tr>

<tr>
<td>Education</td>
<td><%= c.getEducation() %></td>
</tr>

<tr>
<td>Skills</td>
<td><%= c.getSkills() %></td>
</tr>

<tr>
<td>Resume</td>
<td><%= c.getResumePath() %></td>
</tr>

</table>

<a href="<%=request.getContextPath()%>/candidate/dashboard.jsp"
   class="btn btn-secondary">
   Back
</a>

</body>
</html>
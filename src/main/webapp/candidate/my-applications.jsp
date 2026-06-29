<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lnt.model.Application" %>

<html>
<head>
    <title>My Applications</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="container mt-4">

<h2>My Applications</h2>

<table class="table table-bordered">

<tr>
    <th>Application ID</th>
    <th>Job ID</th>
    <th>Status</th>
</tr>

<%
List<Application> apps =
    (List<Application>) request.getAttribute("applications");

for(Application a : apps){
%>

<tr>
    <td><%= a.getApplicationId() %></td>
    <td><%= a.getJobId() %></td>
    <td><%= a.getStatus() %></td>
</tr>

<%
}
%>

</table>

</body>
</html>
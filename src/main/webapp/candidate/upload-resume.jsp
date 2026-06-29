<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Upload Resume</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body class="container mt-5">

<h2>Upload Resume (PDF)</h2>

<%
String msg=request.getParameter("msg");

if("success".equals(msg)){
%>

<div class="alert alert-success">
Resume uploaded successfully.
</div>

<%
}

if("error".equals(msg)){
%>

<div class="alert alert-danger">
Upload failed.
</div>

<%
}

if("invalid".equals(msg)){
%>

<div class="alert alert-warning">
Only PDF files are allowed.
</div>

<%
}
%>

<form method="post"
      enctype="multipart/form-data"
      action="${pageContext.request.contextPath}/upload-resume">

<div class="mb-3">

<label class="form-label">
Select Resume
</label>

<input
type="file"
name="resume"
accept=".pdf"
class="form-control"
required>

</div>

<button class="btn btn-primary">
Upload Resume
</button>

<a href="${pageContext.request.contextPath}/candidate/dashboard.jsp"
class="btn btn-secondary">
Back
</a>

</form>

</body>
</html>
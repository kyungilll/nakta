<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
		String img = request.getParameter("img");
	%>
	<h2><%= title %></h2><br>
	<p><%= img %></p>
</body>
</html>
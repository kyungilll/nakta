<%@page import="music.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//������ �ٹ����� 12�� url �� �����
		MusicDAO dao = new MusicDAO();
		String[] cover = dao.mainImage();
	%>
	<p><%=cover[0] %></p>
</body>
</html>
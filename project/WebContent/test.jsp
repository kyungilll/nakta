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
		//메인의 앨범사진 12개 url 을 끌어옴
		MusicDAO dao = new MusicDAO();
		String[] cover = dao.mainImage();
	%>
	<p><%=cover[0] %></p>
</body>
</html>
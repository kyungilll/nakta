<%@page import="music.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
</head>
<body>
	<jsp:useBean id="dto" class="music.MemberDTO"></jsp:useBean>
	<%
		MemberDAO dao = new MemberDAO();
		String InputId = request.getParameter("id");
		String str = "";

		if(InputId == dao.idCheck(InputId)){
			str = "NO";
			out.write(str);
		}else{
			str = "YES";
			out.write(str);
		}
	%>

</body>
</html>
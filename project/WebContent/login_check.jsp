<%@page import="music.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login_Check</title>
	</head>
	<body>
		<%
			String InputId = request.getParameter("id");
			String InputPw = request.getParameter("pw");
			
			MemberDAO dao = MemberDAO.getInstance();
			boolean result = dao.LoginCheck(InputId, InputPw);
			
			if(result == true){
				session.setAttribute("sessionId", InputId);
				response.sendRedirect("main.jsp");
			} else if(result == false){
				response.sendRedirect("login.jsp");
			}
		 %>
	</body>
</html>
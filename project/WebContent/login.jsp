<%@page import="music.MemberDTO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="music.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login Page</title>
	</head>
	<body>
		<center>
			<h1>환영합니다~</h1>
			<hr color="yellow" size="5">
			<form action="login_check.jsp">
				ID : <input type="text" name="id"> <br>
				PW : <input type="password" name="pw"> <br>
				<input type="submit" value="로그인">
				<a href = "signIn.html"><input type="button" value="회원가입"></a>
			</form>
		</center>
		
	</body>
</html>
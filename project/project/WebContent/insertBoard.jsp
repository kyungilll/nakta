<%@page import="bean.BoardDTO"%>
<%@page import="bean.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>insertBoard</title>
   </head>
   <body>
      <jsp:useBean id="dto" class="bean.BoardDTO"></jsp:useBean>
      <jsp:setProperty property="*" name="dto"/>
      <%
         BoardDAO dao = new BoardDAO();
         dao.insert(dto);
      %>
   </body>
</html>
<%@page import="music.BoardDAO"%>
<%@page import="music.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 글쓰기</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
			integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
			crossorigin="anonymous">
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
	</head>
	<body>
		<jsp:useBean id="dto" class="music.BoardDTO"></jsp:useBean>
		<jsp:setProperty property="*" name="dto" />
		<%
			BoardDAO dao = new BoardDAO();
			BoardDTO dto2 = dao.insert();
		%>
		<div id="top">
			<div id="title"></div>
				
			<div id="search">
				<form action="">
					<input type="text" id="searchbox"
						style="width: 400px; height: 45px;" placeholder="검색어를 입력해주세요.">
					<button type="submit" class="btn btn-primary btn-lg">검색</button>
				</form>
			</div>
			
			<div id = "info">
					<table>
						<tr>
							<td>
								<img src = "img/Camel.png">
							</td>
							<td>
							<%= dto.getId() %>님 안녕하세요!
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id="menu">
			<table>
				<ul>
					<li class="menuselect"><a href="">음원차트</a>
					<li class="menuselect"><a href="">최신음악</a>
					<li class="menuselect"><a href="">매거진</a>
					<li class="menuselect"><a href="">공지사항</a>
				</ul>
			</table>
		</div>
		<hr class="hr">
		<div id="board">
			
			<form action="boardList.jsp">
				<table width="800px" cellpadding="0" cellspacing="0" border="0">
					<tr style="background: url('img/table_mid.gif')"repeat-x; text-align:center;>
						<td width="5"><img src="img/table_left.gif" width="5"
							height="30"></td>
						<td align="center">글쓰기</td>
						<td width="5"><img src="img/table_right.gif" width="5"
							height="30"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>&nbsp;</td>
						<td align="center"><b>제목</b></td>
						<td><input name="title" type="text" size="85" maxlength="100"
							placeholder="제목을 작성해주세요."></td>
					</tr>
					<tr height="2" bgcolor="#dddddd">
						<td colspan="5"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><b>작성자</b></td>
						<td><%=dto.getId()%></td>
			
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><b>비밀번호</b></td>
						<td><input name="pass" type="password" size="10" maxlength="4"
							placeholder="네 글자"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center"><b>내용</b></td>
						<td><textarea name="content" cols="85" rows="13"
								placeholder="내용을 작성해주세요."></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4"></td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
					</tr>
				</table>
				<center>
					<button type="submit" class="btn btn-warning">게시글 등록</button>
					<button type="button" class="btn btn-danger" 
						OnClick="javascript:history.back(-1)">취소</button>
				</center>
			</form>
	
		</div>

	</body>
</html>
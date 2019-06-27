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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(function() { // 입력된 값들을 모두 넘김
				$("#submit").click(function() {
					var d = jQuery("#form").serialize();
					$.ajax({
						url : "insertBoard.jsp",
						data : d,
						dataType : "text",
						success : function(result) {
							alert("게시글이 등록되었습니다.");
							location.href = 'boardList.jsp';
						}
					});
					return false;
				});
			});
		</script>
		</head>
<body>
	<div id = "top">
			<div id = "title">
				<a href="main.jsp"><img src="images/Title.png" style="border-radius: 10px 10px 10px 10px"></a>
			</div>
			
			<div id = "search">
				<form action="">
					<input type="text" id = "searchbox" style = "width: 400px; height: 45px;" placeholder="검색어를 입력해주세요.">
					<button type="submit" class="btn btn-primary btn-lg">검색</button>
				</form>
			</div>
			
			<div id = "login">
				<table>
					<tr>
						<td>
							<img src = "images/Camel.png">
						</td>
						<td width="150px">
							<%
								Object userId = session.getAttribute("InputId");
								if(userId != null){
							%>
							<b><%=session.getAttribute("InputId") %></b>님<br>안녕하세요 :)
							
							<form action="logout.jsp">
								<button type="submit" id="logout" class="btn btn-dark">로그아웃</button>
							</form>
							
							<%}else{%>
							<form action="login.jsp">
								<button type="submit" id = "loginbutton" class="btn btn-info">로그인</button>
							</form>
							<%} %>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id = "menu">
			<table>
				<ul>
					<li class = "menuselect"><a href = "">음원차트</a>
					<li class = "menuselect"><a href = "newmusic.jsp">최신음악</a>
					<li class = "menuselect"><a href = "">뉴스토픽</a>
					<li class = "menuselect"><a href = "">에디터추천</a>
					<li class = "menuselect"><a href = "boardList.jsp">공지사항</a>
				</ul>
			</table>
		</div>
	<hr class="hr">
	<div id="board" style="position: absolute; left: 475px; width: 900px; height: 800px;">
			<form id="form" name="form" method="POST">
				<table width="800px" height="30px" cellpadding="0" cellspacing="0" border="0">
					<tr style="background: url('img/table_mid.gif')"repeat-x; text-align:center;>
						<td width="5"><img src="img/table_left.gif" width="5"
							height="30"></td>
						<td align="center">글쓰기</td>
						<td width="5"><img src="img/table_right.gif" width="5"
							height="30"></td>
					</tr>
				</table>
				<table width="800px">
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
						<td><%=session.getAttribute("InputId")%></td>
						<input type="hidden" name="Input" value="<%=session.getAttribute("InputId")%>">
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
			
			<button type="submit" id="submit" class="btn btn-warning" style="margin-left:330px;">게시글 등록</button>
			<button type="button" class="btn btn-danger" OnClick="javascript:history.back(-1)">취소</button>
		</form>

	</div>

</body>
</html>
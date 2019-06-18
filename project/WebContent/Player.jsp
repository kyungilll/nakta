<%@page import="music.MusicDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="music.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악을 태우다 낙타</title>
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
	<div id="top">
		<div id="top">
			<div id="title" Onclick="location.href='Main.jsp'"
				style="cursor: pointer;"></div>

			<div id="search">
				<form action="">
					<input type="text" id="searchbox"
						style="width: 400px; height: 45px;" placeholder="검색어를 입력해주세요.">
					<button type="submit" class="btn btn-primary btn-lg">검색</button>
				</form>
			</div>

			<div id="login">
				<table>
					<tr>
						<td><img src="images/Camel.png"></td>
						<td>
							<form action="">
								<button type="submit" id="loginbutton" class="btn btn-info">로그인</button>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="menu">
			<table>
				<ul>
					<li class="menuselect"><a href="rank.jsp">음원차트</a>
					<li class="menuselect"><a href="">최신음악</a>
					<li class="menuselect"><a href="">매거진</a>
					<li class="menuselect"><a href="">공지사항</a>
				</ul>
			</table>
		</div>
		<hr class="hr">
		<!-- Example single danger button -->

		<div class="btn-group">
			<!-- 정렬하기 버튼 -->
			<button type="button" class="btn btn-danger dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Action</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">Action</a> <a
					class="dropdown-item" href="#">Another action</a> <a
					class="dropdown-item" href="#">Something else here</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Separated link</a>
			</div>
		</div>


		<div id="top50">
			<!-- TOP 50 차트 -->
			<div align="center" id="top50">
				<table border="10">
					<tbody border="10">
						<tr id="list">

							<td align="center">IMAGE</td>
							<td align="center">RANK</td>
							<td align="center">TITLE</td>

						</tr>
						<%
							MusicDAO dao = new MusicDAO();
							dao.drop(); /* DB에 있는 자료 모두 버리고 순번 초기화 */
							dao.top50(); /* top50개 음원 제목, 가수명 DB입력 */
							String[] cover = dao.image(); /* 앨범사진 URL을 배열로 만듦 */

							ArrayList listAll = new ArrayList();
							listAll = dao.selectAll();
							for (int i = 0; i < listAll.size(); i++) {
								MusicDTO dto = (MusicDTO) listAll.get(i);
								String album = cover[i];
						%>
						<tr id="list">

							<td align="center"><img alt="이미지 없음" src=<%=album%>></td>
							<td align="center"><%=dto.getNum() + "위"%></td>
							<td align="center"><%=dto.getTitle()%> <br> <br> <%=dto.getArtist()%></td>

						</tr>
						<%
							}
						%>
					</tbody>
				</table>

			</div>
		</div>
		<div id="under">
			회사소개 | 이용약관 | 개인정보처리방침 | 청소년보호정책 | 이메일주소무단수집거부 | 서비스 이용문의
			<div id="under2">
				<img alt="이미지가 없습니다." src="under2.png">
			</div>
</body>
</html>
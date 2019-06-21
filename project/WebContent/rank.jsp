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
			<div id="title">
				<a href="Main.jsp"><img src="images/Title.png"
					style="border-radius: 10px 10px 10px 10px"></a>
			</div>

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
		<div><!-- 세션(음악번호: numList / 제목: titleList -->
			최근 재생한 음악 :
			<%
			ArrayList<Integer> numList = (ArrayList<Integer>) session.getAttribute("mnum");
			ArrayList<String> titleList = (ArrayList<String>) session.getAttribute("title");
			if(numList.size()<=1){ //세션에 저장된 내용이 한 개 이하일 때
			%><br>
			<table>
			<tbody>
			
			<td>
				<a href="">현재 <%=numList.get(0)+1%>위</a>
				<a href=""><%=titleList.get(0)%></a>
			</td>
			
			<% } else{	// 두 개 이상일 때
				for(int i =1; i<numList.size();i++){
			%> <br>
			<td>
				<a href="player.jsp?mnum=<%=numList.get(numList.size()-i)%>">현재 <%=numList.get(numList.size()-i)+1%>위</a>
				<a href="player.jsp?mnum=<%=numList.get(numList.size()-i)%>"><%=titleList.get(titleList.size()-i)%></a>
			</td>
			<% } } %>
			</tbody>
			</table>
		</div>
		<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
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
							<td align="center"><%=dto.getTitle()%> <br> <%=dto.getArtist()%>
								<br>
							<br>

								<button type="button" name="num1"
									class="btn btn-sm btn-block blue"
									onclick="javascript:location.href='player.jsp?mnum=<%=i%>'">재생</button></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>

			</div>
			<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
		</div>
		<div id="under">
			회사소개 | 이용약관 | 개인정보처리방침 | 청소년보호정책 | 이메일주소무단수집거부 | 서비스 이용문의
			<div id="under2">
				<img alt="이미지가 없습니다." src="under2.png">
			</div>
</body>
</html>
<%@page import="java.io.Console"%>
<%@page import="music.MusicDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="music.MusicDAO"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<div id = "top">
			<div id = "title">
				<a href="Main.jsp"><img src="images/Title.png" style="border-radius: 10px 10px 10px 10px"></a>
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
					<td><img src="images/Camel.png" alt="이미지 없음"></td>
					<td>
						<form action="login.jsp">
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
	
	<div id="middle">
		<div id="album" class="album">
			<table>
				<tbody>
					<%
						//메인의 앨범사진 1~4 / 4~8번 url 을 끌어옴
						MusicDAO dao = new MusicDAO();
						ArrayList<String> cover = dao.mainImage();
					%>
					<tr>
						<%
							for (int i = 0; i < 4; i++) {
								String x = cover.get(i);
						%>
						<td><a href=""><img alt="이미지 없음" src=<%=x%> width=173px,
								height=173px id="mainimage"></a></td>
						<%
							}
						%>

					</tr>
					<tr>
						<%
							for (int i = 4; i < 8; i++) {
								String x = cover.get(i);
						%>
						<td><a href=""><img alt="이미지 없음" src=<%=x%> width=173px,
								height=173px id="mainimage"></a></td>
						<%
							}
						%>

					</tr>

				</tbody>
			</table>

		</div>

		<div id="chart">
			<table>
				<tr>인기검색어
				</tr>
				<!-- 인기검색어 가져오기 -->
				<hr>
				<%
					MusicDTO dto = new MusicDTO();
					String url1 = "https://www.genie.co.kr/chart/top200";
					Document doc = null;
					try {
						doc = Jsoup.connect(url1).get();
					} catch (IOException e) {
						e.printStackTrace();
					}
					Elements element = doc.select("div.aside_realtime"); //검색어 틀
					// 원하는 내용이 있는 틀(?) 입력
					ArrayList list = new ArrayList();
					int n = 1;
					for (Element y : element.select("a")) { // 검색어
						String word = y.text();
				%>
				<tr>
					<td><%=n + "위 "%></td>

					<td><a href=""><%=word%></a>
					<td>
				</tr>
				<%
					n++;
					}
				%>
			</table>
		</div>
	</div>

	<div id="bottom">
		<div id="notice">
			<table>
				<tbody>
					<tr align="center">실시간 차트
					</tr>
					<hr>
					<%
						dao.drop(); /* DB에 있는 자료 모두 버리고 순번 초기화 */
						dao.top50(); /* top50개 음원 제목, 가수명 DB입력 */
						String[] cover1 = dao.image(); /* 앨범사진 URL을 배열로 만듦 */
						ArrayList listAll = new ArrayList();
						listAll = dao.selectAll();
						for (int i = 0; i < 10; i++) {
							MusicDTO dto1 = (MusicDTO) listAll.get(i);
							String album = cover1[i];
					%>
					<tr id="list">
						<td align="center"><%=dto1.getNum() + "위"%></td>
						<td align="left"><a href=""><%=dto1.getTitle()%></a></td>
						<td align="left"><a href=""><%=dto1.getArtist()%></a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>

		<div id="news"></div>
		<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	</div>
	<div id="under">
		회사소개 | 이용약관 | 개인정보처리방침 | 청소년보호정책 | 이메일주소무단수집거부 | 서비스 이용문의
		<div id="under2"></div>
	</div>
</body>
</html>
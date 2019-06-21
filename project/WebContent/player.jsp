<%@page import="java.io.Console"%>
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
		<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
		<div id="middle">
			<%
				
				// rank.jsp에서 넘어온 숫자(노래번호)로 크롤링 된 내용 중 맞는 사진을 찾음
				int num = Integer.parseInt(request.getParameter("mnum"));
				// 받아온 번호(문자)를 숫자(num)로 변환 (1~50)

				MusicDAO dao = new MusicDAO();
				MusicDTO dto = new MusicDTO();
				dao.drop(); /* DB에 있는 자료 모두 버리고 순번 초기화 */
				dao.top50(); /* top50개 음원 제목, 가수명 DB입력 */
				String[] cover1 = dao.image(); /* 앨범사진 URL을 배열로 만듦 */

				for (int i = 0; i < 50; i++) {
					if (i == num) {
			%>
			<img alt="이미지 없음" src="<%=cover1[i]%>">
			<%
				} else {
					}
				}
			%>
			<audio controls id="player">
				<source src="audio/<%=num%>.mp3" type="audio/mpeg">
			</audio>
			<!-- rank.jsp 에서 넘어온 숫자(노래순번)으로 50곡중 노래재생 -->
		</div>
		<%
			// 최근 들은 음악의 번호를 Arraylist 에 추가
			ArrayList<Integer> numList = (ArrayList<Integer>) session.getAttribute("mnum"); // 세션에 저장된 최근 음악번호 가져옴
			
			if (numList == null) { // 목록이 있으면 추가, 없으면 새로 만들어서 추가
				numList = new ArrayList<>();
				numList.add(num); 
				session.setAttribute("mnum", numList); //넘어온 노래의 순번을 세션에 추가
			} else {
				numList.add(num);
				session.setAttribute("mnum", numList); //넘어온 노래의 순번을 세션에 추가
			}
		%>

		<%
			ArrayList<String> titleList = (ArrayList<String>) session.getAttribute("title"); // 세션에 저장된 최근 음악제목 가져옴
			ArrayList mlist = dao.selectAll(); // 저장된 50곡 정보가져옴
			MusicDTO dto1 = (MusicDTO) mlist.get(num); // 해당하는 번호의 노래정보 DTO
			
			if (titleList == null) { // 목록이 있으면 추가, 없으면 새로 만들어서 추가
				titleList = new ArrayList<>();
				titleList.add(dto1.getTitle());
				session.setAttribute("title", titleList);
			} else {
				titleList.add(dto1.getTitle());
				session.setAttribute("title", titleList);
			}
		%>
		<div><!-- 세션(음악번호: numList / 제목: titleList -->
			최근 재생한 음악 :
			<%
			numList = (ArrayList<Integer>) session.getAttribute("mnum");
			titleList = (ArrayList<String>) session.getAttribute("title");
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
		<div id="under">
			회사소개 | 이용약관 | 개인정보처리방침 | 청소년보호정책 | 이메일주소무단수집거부 | 서비스 이용문의
			<div id="under2">
				<img alt="이미지가 없습니다." src="under2.png">
			</div>
</body>
</html>
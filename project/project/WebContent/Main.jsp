<%@page import="java.io.Console"%>
<%@page import="bean.MusicDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.MusicDAO"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>

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
	<link rel="stylesheet" type="text/css" href= "style.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(function(){
				$("#logout").submit(function(){
					$.ajax({
						url:"logout.jsp",
						success:function(){
							alert("로그아웃 되었습니다.");
						}
					});
					return false;
				});
			});
		</script>
</head>
<body>
	<div id="top">
		<div id="title">
			<a href="Main.jsp"><img src="images/Title.png"
				style="border-radius: 10px 10px 10px 10px"></a>
		</div>

		<div id = "search">
            <form action="search.jsp">
               <input type="text" id = "searchbox" style = "width: 400px; height: 45px;" placeholder="검색어를 입력해주세요." name="search">
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
					<li class = "menuselect"><a href = "graph.jsp">시각화</a>
					<li class = "menuselect"><a href = "boardList.jsp">공지사항</a>
				</ul>
			</table>
		</div>
	<hr class="hr">
			<div id="recent">
			<!-- 세션(음악번호: numList / 제목: titleList -->
			최근 재생한 음악 :
			<%
				ArrayList<Integer> numList = (ArrayList<Integer>) session.getAttribute("mnum");
				ArrayList<String> titleList = (ArrayList<String>) session.getAttribute("title");
				ArrayList<String> artistList = (ArrayList<String>) session.getAttribute("artist");

				if (numList == null) {

				} else if (numList.size() == 1) { //세션에 저장된 내용이 한 개 이하일 때
			%><br>
			<table width="500">
				<tbody>

					<td><a class="btn btn-primary"
						href="player.jsp?mnum=<%=numList.get(0)%>&title=<%=titleList.get(0)%>&artist=<%=artistList.get(0)%>" target="_blank"><%=artistList.get(0)%> / <%=titleList.get(0)%></a></td>

					<%
						} else { // 두 개 이상일 때
							for (int i = 1; i <= numList.size(); i++) {
					%>
					<br>
					<td><a class="btn btn-primary"
						href="player.jsp?mnum=<%=numList.get(numList.size() - i)%> &title=<%=titleList.get(titleList.size() - i)%> &artist=<%=artistList.get(artistList.size() - i)%>" target="_blank"><%=artistList.get(artistList.size() - i)%> / <%=titleList.get(titleList.size() - i)%></a>
					</td>
					<%
						}
						}
					%>
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
					<td><%=n + "위 "%> <a href="search.jsp?search=<%=word%>"><%=word%></a></td>
				</tr>
				<%
					n++;
					}
				%>
			</table>
		</div>
	</div>

	<div id="bottom" style="border: 10px;">
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
						<td align="center" width=40;><%=dto1.getNum() + "위"%></td>
						<td align="left"><a class="btn btn-primary"
							href="search.jsp?search=<%=dto1.getTitle()%>"><%=dto1.getTitle()%></a></td>
						<td align="left"><a class="btn btn-primary"
							href="search.jsp?search=<%=dto1.getArtist()%>"><%=dto1.getArtist()%></a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div id = "news">
					<h6>뉴스토픽</h6>
					<hr>
					<ul id = "news1">
						<%
							String url2 = "https://www.genie.co.kr/magazine?ctid=1";//뉴스토픽 크롤링
							int i=0;
							try {
								doc = Jsoup.connect(url2).get();
							} catch (IOException e) {
								e.printStackTrace();
							}
							String[] number ={"","","",""};
							element = doc.select("div.list-normal");
							for(Element check : element.select("li > a")){//페이지 번호를 받아오는중
								if(i<4){
									String dump=check.toString();
									number[i] = dump.substring(46,50);
									i++;
								}
								
							}
							i=0;
							for(Element el : element.select("div.info > p")){
								if(i < 4){
								String news = el.text();//뉴스 타이틀
								
		
						%>
					 		<li id = "news1"><a href="Magazine.jsp?search=<%= number[i] %>"><%= news %></a></li>
						<%
								i++;
								}
							}
						%>
					</ul>
				</div>
		</div>

		
		<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	</div>
	<div id="under">
		회사소개 | 이용약관 | 개인정보처리방침 | 청소년보호정책 | 이메일주소무단수집거부 | 서비스 이용문의
		<div id="under2"></div>
	</div>
</body>
</html>
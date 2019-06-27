<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>음악을 태우다 낙타</title>
		<link rel="stylesheet" type="text/css" href= "style2.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var check = false;
				$("#selectAll").change(function() {
					if(check == true){
						$("#song-list input").attr("checked", false);
						check = false;
					}else{
						$("#song-list input").attr("checked", true);
						check = true;
					}
				});
				$("#form").submit(function() {
					alert("로그인이 필요합니다");
					return false;
				});
			});
			function playsong() {
				window.open("PlaySong.jsp", "PlaySong", "width=500, height=600,");
			}
			function save(title,songimg) {
				
			}
		</script>
	</head>
<body>
		<%
			String query = request.getParameter("search");
			String url = "https://www.genie.co.kr/search/searchSong?query="+query;
			Document doc = null;
			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		%>
		<div id = "top">
			<div id = "title">
			</div>
			
			<div id = "search">
				<form action="지니.jsp">
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
						<td>
							<form action="">
								<button type="submit" id = "loginbutton" class="btn btn-info">로그인</button>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id = "menu">
			<table>
				<ul>
					<li class = "menuselect"><a href = "">음원차트</a>
					<li class = "menuselect"><a href = "">최신음악</a>
					<li class = "menuselect"><a href = "">뉴스토픽</a>
					<li class = "menuselect"><a href = "">에디터추천</a>
					<li class = "menuselect"><a href = "">공지사항</a>
				</ul>
			</table>
		</div>
		<hr class = "hr">
		<div id = "middle">
			<div id = "album">
			<h2>검색 결과</h2>
				<div id="current">
					<ul>
						<li><a href="search.jsp?search=<%= query %>">통합검색</a></li>
						<li><a href="#">곡</a></li>
						<li><a href="AlbumSearch.jsp?search=<%= query %>">앨범</a></li>
						<li>동영상</li>
						<li><a href="MagazineSearch.jsp?search=<%= query %>">매거진</a></li>
					</ul>
				</div>
			
			<hr class="hr">
			
			곡 전체선택<input type="checkbox" id="selectAll">
			<form action="" id="form">
			<button type="submit"><img src="images/save.PNG"></button>
			<table border="2" width="700">
				
				<% 
					String title = null;
					int cnt=0;
					ArrayList list = new ArrayList();
					Elements element = doc.select("div.search_song");
					// 원하는 내용이 있는 틀(?) 입력
					for(Element name : element.select("tr.list > td.info > a[title]")){ // 노래 이름
						list.add(name.text());
					}
					
					for(Element songimg : element.select("tr.list > td > a > img")){ // 노래 이미지
						
						title = (String)list.get(cnt);
						cnt++;
				%>
				<tr id="song-list" >
					<td width="60"><input type="checkbox"></td>
					<td class="number" style="text-align: center;"><%= cnt %></td>
					<td class="simg" style="width: 65px;"><%= songimg %></td>
					<td style="text-align: center;">
						<%= title %><br>
						<a href="" onclick="playsong();" return false;>
							<img src="images/listen.PNG" style="width: 50px; height: 30px;">
						</a>
						<a href="" onclick="save(title,songimg);" return false;>
							<img src="images/save.PNG" style="width: 50px; height: 30px;">
						</a>
					
					</td>
				</tr>
				<% 
					}
				%>
			</table>
			</form>
				
			</div>
			
			<div id = "hotsearch">
				<h5>인기 검색어</h5>
				<br>
				<ol>
					<% 
						String rank = null;
						element = doc.select("div.aside_realtime");//인기 검색어
						
						for(Element el : element.select("li > a")){
							rank = el.text();
							
					%>
						<li><a href="지니.jsp?search=<%= rank %>"><%= rank %></a></li>
					<% 
						}
					%>
				</ol>
			</div>
		</div>
		
		<div id="bottom">
			
		</div>
		<!-- <div id = "under">
			<a href = "">회사소개</a> | <a href ="">이용약관</a> | <a href="">개인정보처리방침</a> | <a href = "">청소년보호정책</a> | 이메일주소무단수집거부 | 서비스 이용문의
		<div id = "under2">
		</div> -->
	</body>
</html>
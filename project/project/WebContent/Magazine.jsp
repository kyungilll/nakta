
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
	</head>
	<body>
		
		<div id = "top">
			<div id = "title">
				<a href="main.jsp">메인으로 이동</a>
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
				
		<hr>
		
				
				<%
					String query = request.getParameter("search");
					String url = "https://www.genie.co.kr/magazine/subMain?ctid=1&mgz_seq="+query+"&pg=1";
					
					Document doc = null;
					int cnt=0;
					try {
						doc = Jsoup.connect(url).get();
					} catch (IOException e) {
						e.printStackTrace();
					}
					Elements element = doc.select("div#body-content");
					Elements title = element.select("div.title > span.txt.ellipsis");
					Elements img = element.select("div.main-visual > div.cover > img");//메인 이미지
				%>
			 		<p style="font-size: 20px; font-style: italic; text-align: center;"><%= title.text() %></p>
			 		<%= img.toString() %>
		
				
			</div>
			
		</div>
		
		<div id="bottom">
			
		</div>
		<!-- <div id = "under">
			<a href = "">회사소개</a> | <a href ="">이용약관</a> | <a href="">개인정보처리방침</a> | <a href = "">청소년보호정책</a> | 이메일주소무단수집거부 | 서비스 이용문의
		<div id = "under2">
		</div>  -->
	</body>
</html>
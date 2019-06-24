
<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberDTO"%>
<%@page import="bean.Mp3DAO"%>
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
		<link rel="stylesheet" type="text/css" href= "style.css">
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
				<table id="table">
					<tr>
						<td><img src="images/music.png"> </td>
						<td><img src="images/music2.png"></td>
						<td><img src="images/music3.png"></td>
						<td><img src="images/music4.png"></td>
					</tr>
					<tr>
						<td><img src="images/music5.png"></td>
						<td><img src="images/music6.png"></td>
						<td><img src="images/music7.png"></td>
						<td><img src="images/music8.png"></td>
					</tr>
				</table>
			</div>
			
			<div id = "hotsearch">
				<h5>인기 검색어</h5>
				<br>
				<ol>
					<% 
						
						String url = "https://www.genie.co.kr/chart/top200";
						Document doc = null;
						try {
							doc = Jsoup.connect(url).get();
						} catch (IOException e) {
							e.printStackTrace();
						}
			
						String rank = null;
						Elements element = doc.select("div.aside_realtime");//인기 검색어
						
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
			<div id = "chart">
				<h6>실시간 차트</h6>
				<hr size="2" color = "black">
				<table>
					<tr>
						<td>솔직하게 말해서 나</td>
						<td>김나영</td>
					</tr>
					<tr>
						<td>2002</td>
						<td>Anne Marie</td>
					</tr>
					<tr>
						<td>사랑에 연습이 있었다면(prod. by 2soo)</td>
						<td>임재현</td>
					</tr>
					<tr>
						<td>너에게 못했던 내 마지막 말은</td>
						<td>다비치</td>
					</tr>
					<tr>
						<td>누구 없소(NO ONE)(Feat. B.I of ikon)</td>
						<td>이하이</td>
					</tr>
					<tr>
						<td>bad guy</td>
						<td>Billie Eilish</td>
					</tr>
					<tr>
						<td>작은 것들을 위한 시(Boy With Luv)(feat.Halsey)</td>
						<td>방탄소년단</td>
					</tr>
					<tr>
						<td>대충 입고 나와</td>
						<td>우디(Woody)</td>
					</tr>
				</table>
			</div>
						
			<div id = "container">
				<div id = "notice">
					<h6>공지사항</h6>
					<hr>
					<ul>
						<li><a href="">낙타 version 2.5 업데이트</a></li>
						<li><a href="">낙타 version 2.2 업데이트</a></li>
						<li><a href="">낙타 version 2.0 업데이트</a></li>
						<li><a href="">낙타 version 1.71 업데이트</a></li>
					</ul>
				</div>
				<br>
				<div id = "news">
					<h6>뉴스토픽</h6>
					<hr>
					<ul id = "news1">
						<%
							String url2 = "https://www.genie.co.kr/magazine?ctid=1";
							try {
								doc = Jsoup.connect(url2).get();
							} catch (IOException e) {
								e.printStackTrace();
							}
				
							element = doc.select("div.list-normal");
							int i=0;
							for(Element el : element.select("div.info > p")){
								if(i < 4){
								String news = el.text();//뉴스 타이틀
								i++;
						%>
					 		<li id = "news1"><a href="Magazine.jsp?search=<%= news %>"><%= news %></a></li> 
						<%
								}
							}
						%>
					</ul>
				</div>
			</div>
		</div>
		<div id = "under">
			<a href = "">회사소개</a> | <a href ="">이용약관</a> | <a href="">개인정보처리방침</a> | <a href = "">청소년보호정책</a> | 이메일주소무단수집거부 | 서비스 이용문의
		<div id = "under2">
		</div>
	</body>
</html>
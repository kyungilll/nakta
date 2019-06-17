<%@page import="bean.Mp3DTO"%>
<%@page import="bean.Mp3DAO"%>
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
		<jsp:useBean id="dto" class="bean.Mp3DTO"></jsp:useBean>
		<jsp:setProperty property="*" name="dto"/>
		<%
			Mp3DAO dao = new Mp3DAO();
			Mp3DTO dto2 = dao.select();
			
		%>
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
					<li class = "menuselect"><a href = "newmusic.jsp">최신음악</a>
					<li class = "menuselect"><a href = "">뉴스토픽</a>
					<li class = "menuselect"><a href = "">에디터추천</a>
					<li class = "menuselect"><a href = "">공지사항</a>
				</ul>
			</table>
		</div>
		<hr class = "hr">
		<div id = "middle">
			<div id = "album">
				<h5 style="font-weight: bold">최신음악</h5>
				<table id="table">
					<tr>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/227/576/81227576_1560504311638_1_200x200.JPG" alt="" width="170px" height="170px"></td>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/226/277/81226277_1560489296971_1_200x200.JPG" alt="" width="170px" height="170px"></td>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/222/522/81222522_1560733312942_1_200x200.JPG" alt="" width="170px" height="170px"></td>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/227/588/81227588_1560509622871_1_200x200.JPG" alt="" width="170px" height="170px"></td>
					</tr>
					<tr>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/227/413/81227413_1560501711179_1_200x200.JPG" alt="" width="170px" height="170px"></td>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/227/269/81227269_1560735807632_1_200x200.JPG" alt="" width="170px" height="170px"></td>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/227/577/81227577_1560510801667_1_200x200.JPG" alt="" width="170px" height="170px"></td>
						<td><img src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/227/026/81227026_1560735349252_1_200x200.JPG" alt="" width="170px" height="170px"></td>
					</tr>
				</table>
			</div>
			<br>
			<div id = "hotsearch">
			<h5 class = "hot" style="font-weight: bold">인기 검색어</h5>
			<br>
				<ol>
					<li>구로점</li>
					<li>구로점 폐쇄</li>
					<li>구내 식당</li>
					<li>노량진역</li>
					<li>노량진 롯데리아</li>
					<li>노량진 지점</li>
					<li>한국 에콰도르</li>
					<li>이강인</li>
					<li>이광연</li>
					<li>김정은</li>
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
						<li id = "news1">카리스마 조장 "HTML 너무 쉬워.. 더 어려운게 필요해.."</li>
						<li id = "news1">정보관리책임 본부장 "실시간 차트 더욱 편하게 만들겠다.."호언장담.</li>
						<li id = "news1">대표이사 사퇴 의사 밝혀..다음 대표이사 후보는 누구?</li>
						<li id = "news1">탤런트 D군 예비군에서 연락 끊겨..검찰 "탈주 여부 조사중.."</li>
					</ul>
				</div>
			</div>
		</div>
		<div id = "under">
				<a href = "">회사소개</a> | <a href ="">이용약관</a> | <a href="">개인정보처리방침</a> | <a href = "">청소년보호정책</a> | 이메일주소무단수집거부 | 서비스 이용문의
			<div id = "under2">
			</div>
		</div>
	</body>
</html>
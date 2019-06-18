<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>음악을 태우다 낙타</title>
		<link rel="stylesheet" type="text/css" href= "stylenew.css">
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
					<li class = "menuselect"><a href = "">최신음악</a>
					<li class = "menuselect"><a href = "">뉴스토픽</a>
					<li class = "menuselect"><a href = "">에디터추천</a>
					<li class = "menuselect"><a href = "">공지사항</a>
				</ul>
			</table>
		</div>
		<hr class = "hr">
		<div id = "content">
			<table id = "list">
				<tr>
					<td width="100px" height="100px">
						<img src="images/music.png"
						alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						솔직하게 말해서 나 - 김나영
					</td>
					<td width="100px" height="100px"></td>
					<td width="100px" height="100px">
						<img src="images/music2.png"
						alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						사랑에 연습이 있었다면 - 임재현(prod.by 2soo)
					</td>
				</tr>
				<tr>
					<td width="100px" height="100px">
						<img src="images/music3.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						너에게 못했던 내 마지막 말은 - 다비치
					</td>
					<td width="100px" height="100px"></td>
					<td width="100px" height="100px">
						<img src="images/music4.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						누구 없소(NO ONE) - 이하이(Feat. B.I of iKON)
					</td>
				</tr>
				<tr>
					<td width="100px" height="100px">
						<img src="images/music5.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						작은 것들을 위한 시(Boy With Luv)(Feat.Halsey)<br>
						- 방탄소년단
					</td>
					<td width="100px" height="100px"></td>
					<td width="100px" height="100px">
						<img src="images/music6.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						bad guy - Billie Eilish
					</td>
				</tr>
				<tr>
					<td width="100px" height="100px">
						<img src="images/music7.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						2002 - Anne Marie
					</td>
					<td width="100px" height="100px"></td>
					<td width="100px" height="100px">
						<img src="images/music8.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						대충 입고 나와 - 우디(Woody)
					</td>
				</tr>
				<tr>
					<td width="100px" height="100px">
						<img src="images/music9.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						EVREYDAY - 반엘(VAN EL)
					</td>
					<td width="100px" height="100px"></td>
					<td width="100px" height="100px">
						<img src="images/music10.png" alt="" width="100px" height="100px">
					</td>
					<td width="300px" height="100px">
						GOOD LUCK - 소베(SOBAE)
					</td>
				</tr>
				<tr>
					<td width="100px" height="100px"></td>
					<td width="300px" height="100px"></td>
					<td width="100px" height="100px" colspan="3" style ="font-align: center">
						<a href = "newmusic.jsp" style="text-decoration: none; color: black">1</a>
						<a href = "newmusic2.jsp" style="text-decoration: none; color: black">2</a>
						<a href = "newmusic3.jsp" style="text-decoration: none; color: black">3</a>
					</td>
				</tr>
			</table>
		</div>
		<div id = "under">
				회사소개 | 이용약관 | 개인정보처리방침 | 청소년보호정책 | 이메일주소무단수집거부 | 서비스 이용문의
			<div id = "under2">
			</div>
		</div>
	</body>
</html>
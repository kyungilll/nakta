<%@page import="bean.ChartDTO"%>
<%@page import="bean.ChartDAO"%>
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
<link rel="stylesheet" type="text/css" href="jung.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style> /* 로딩 CSS */
#loading {
	height: 100%;
	left: 0px;
	position: fixed;
	_position: absolute;
	top: 0px;
	width: 100%;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	opacity: 0.5;
}

.loading {
	background-color: white;
	z-index: 199;
}

#loading_img {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -75px; //
	이미지크기 margin-left: -75px; //
	이미지크기 z-index: 200;
}
</style>

<script type="text/javascript"> // 장르별 갯수, 장르별 재생횟수, 길이별 재생횟수 3개AJAX + 로딩
	$(document)
			.ready(
					function() {
						var loading = $(
								'<img id="loading_img" alt="loading" src="images/loading3.gif" max-width: 100%; height: auto;>')
								.appendTo(document.body).hide();
						$(window).ajaxStart(function() {
							loading.show();
						}).ajaxStop(function() {
							loading.hide();
						});
					});

	$(function() { // 입력된 값들을 모두 넘김
		$.ajax({ // 장르별 갯수
			url : "graphAjax1.jsp",
			dataType : "text",
			success : function(result) {
				var x = $.trim(result); // ajax로 넘어온 값을 문자열로 저장
				var s = []; // 배열선언
				var popCount = [];
				var genreCount = [];
				s = x.split(","); // ,로 구분하여 배열로 만듦
				for (i = 0; i < 2; i++) { // 앞 2개 값들을 가요/POP 배열로 넣음
					popCount[i] = parseInt(s[i]);
				}
				for (i = 2; i < 10; i++) { // 그 다음 값들을 장르별 배열로 넣음
					genreCount[i] = parseInt(s[i]);
				}
				$("#word01").val(popCount[0]);
				$("#word02").val(popCount[1]);
				$("#word03").val(genreCount[0]);
				$("#word04").val(genreCount[1]);
				$("#word05").val(genreCount[2]);
				$("#word06").val(genreCount[3]);
				$("#word07").val(genreCount[4]);
				$("#word08").val(genreCount[5]);
				$("#word09").val(genreCount[6]);
				$("#word10").val(genreCount[7]);
				alert("1번 ajax 완료");/* 나중에 지울 것 -----------------*/
				$.ajax({ // 장르별 재생수
					url : "graphAjax2.jsp",
					success : function(result) {
						var x = $.trim(result);
						var s = [];
						s = x.split("★"); 
						$("#playCount01").val(s[0]);
						$("#playCount02").val(s[1]);
						$("#playCount03").val(s[2]);
						$("#playCount04").val(s[3]);
						$("#playCount05").val(s[4]);
						$("#playCount06").val(s[5]);
						$("#playCount07").val(s[6]);
						$("#playCount08").val(s[7]);
						alert("2번 ajax 완료"); /* 나중에 지울 것 ------------------*/
					}
				});
			}
		});

	});
</script>

<script type="text/javascript">//장르별 점유율 원그래프 실행 스크립트
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() { //장르별 점유율 그래프 그리기 시작
		$("#genreBtn").click(
				function() {
					 $("#top_x_div").hide();
					 $("#piechart").show();
					var data = google.visualization.arrayToDataTable([
							[ 'Task', 'Hours per Day' ],
							[ '발라드', parseInt($("#word03").val()) ],
							[ '힙합', parseInt($("#word04").val()) ],
							[ 'OST', parseInt($("#word05").val()) ],
							[ '댄스', parseInt($("#word06").val()) ],
							[ '블루스 ', parseInt($("#word07").val()) ],
							[ '일렉트로닉 ', parseInt($("#word08").val()) ],
							[ '인디 ', parseInt($("#word09").val()) ],
							[ '락 ', parseInt($("#word10").val()) ] 
							]);

					var options = {
						title : '장르별 점유율'
					};

					var chart = new google.visualization.PieChart(document
							.getElementById('piechart'));

					chart.draw(data, options);
				});

	}
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);
      function drawStuff() {
    		$("#countBtn").click(
      function () {
    	  $("#piechart").hide();
    	  $("#top_x_div").show();
    		   var data = new google.visualization.arrayToDataTable([
    			[ '발라드', $("#playCount01").val()],
   				[ '힙합', $("#playCount02").val()],
   				[ 'OST', $("#playCount03").val()],
   				[ '댄스', $("#playCount04").val()],
   				[ '블루스 ', $("#playCount05").val()],
   				[ '일렉트로닉 ', $("#playCount06").val()],
   				[ '인디 ', $("#playCount07").val()],
   				[ '락 ', $("#playCount08").val()],
    		        ]);

    		        var options = {
    		          title: '장르별 재생횟수',
    		          width: 900,
    		          legend: { position: 'none' },
    		          chart: { title: '',
    		                   subtitle: '' },
    		          bars: 'vertical', // Required for Material Bar Charts.
    		          axes: {
    		            x: {
    		              0: { side: 'top', label: 'Percentage'} // Top x-axis.
    		            }
    		          },
    		          bar: { groupWidth: "90%" }
    		        };

    		        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
    		        chart.draw(data, options);	   
       }
    				)
    	}
    </script>
</head>
<body>
	<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<div class="wrap-loading display-none"></div>
	<div id="top">
		<div id="title">
			<a href="Main.jsp"><img src="images/Title.png"
				style="border-radius: 10px 10px 10px 10px"></a>
		</div>

		<div id="search">
			<form action="search.jsp">
				<input type="text" id="searchbox"
					style="width: 400px; height: 45px;" placeholder="검색어를 입력해주세요."
					name="search">
				<button type="submit" class="btn btn-primary btn-lg">검색</button>
			</form>
		</div>


		<div id="login">
			<table>
				<tr>
					<td><img src="images/Camel.png"></td>
					<td width="150px">
						<%
							Object userId = session.getAttribute("InputId");
							if (userId != null) {
						%> <b><%=session.getAttribute("InputId")%></b>님<br>안녕하세요 :)

						<form action="logout.jsp">
							<button type="submit" id="logout" class="btn btn-dark">로그아웃</button>
						</form> 
						<% 	} else { %>
						<form action="login.jsp">
							<button type="submit" id="loginbutton" class="btn btn-info">로그인</button>
						</form> 
						<% 	} %>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="menu">
		<table>
			<ul>
				<li class="menuselect"><a href="rank.jsp">음원차트</a>
				<li class="menuselect"><a href="newmusic.jsp">최신음악</a>
				<li class="menuselect"><a href="">매거진</a>
				<li class="menuselect"><a href="">공지사항</a>
			</ul>
		</table>
	</div>
	<hr class="hr">
	
	<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

	<button id="genreBtn" class="btn btn-primary">Top200 장르별 점유율</button><br><br>
	<button id="countBtn" class="btn btn-primary">Top200 장르별 재생수</button><br><br>
	<button id="timeBtn" class="btn btn-primary">Top200 노래길이별 재생수</button><br><br>
	
	<input type="hidden" id="word01" value="기본값">
	<input type="hidden" id="word02" value="기본값">
	<input type="hidden" id="word03" value="기본값">
	<input type="hidden" id="word04" value="기본값">
	<input type="hidden" id="word05" value="기본값">
	<input type="hidden" id="word06" value="기본값">
	<input type="hidden" id="word07" value="기본값">
	<input type="hidden" id="word08" value="기본값">
	<input type="hidden" id="word09" value="기본값">
	<input type="hidden" id="word10" value="기본값">
	
	<input type="hidden" id="playCount01" value="기본값"><br>
	<input type="hidden" id="playCount02" value="기본값"><br>
	<input type="hidden" id="playCount03" value="기본값"><br>
	<input type="hidden" id="playCount04" value="기본값"><br>
	<input type="hidden" id="playCount05" value="기본값"><br>
	<input type="hidden" id="playCount06" value="기본값"><br>
	<input type="hidden" id="playCount07" value="기본값"><br>
	<input type="hidden" id="playCount08" value="기본값"><br>
	
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	<div id="top_x_div" style="width: 900px; height: 500px;"></div>
	<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<div id="under">
		회사소개 | 이용약관 | 개인정보처리방침 | 청소년보호정책 | 이메일주소무단수집거부 | 서비스 이용문의
		<div id="under2"></div>
	</div>
</body>
</html>
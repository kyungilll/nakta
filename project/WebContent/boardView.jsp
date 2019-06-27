<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board</title>
		<link rel="stylesheet" type="text/css" href="boardstyle.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#btnList").click(function(){
					location.href = 'boardList.jsp';
				});
			});
		</script>
	</head>
	
	<body>
		<jsp:useBean id="dto" class="music.BoardDTO"></jsp:useBean>
		<jsp:useBean id="dao" class="music.BoardDAO"></jsp:useBean>
		<%
			String getNum = request.getParameter("num");
			int num = Integer.parseInt(getNum);
			
			dto = dao.readCnt(num);
		%>
		
		
		<article>
			<div class="container" role="main">
				<h2>board Content</h2>
				<div class="bg-white rounded shadow-sm">
					<div class="board_title"><c:out value="${dto.getTitle()}"/></div>
					<div class="board_info_box">
						<span class="board_author"><c:out value="${dto.getId()}"/>,</span>
						<span class="board_date"><c:out value="${dto.getDate()}"/></span>
					</div>
					<div class="board_content">${dto.getContent()}</div>
					
				</div>
				<div style="margin-top : 20px">
					<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</div>
			</div>
		</article>
	</body>

</html>




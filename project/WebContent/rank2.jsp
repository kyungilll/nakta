<%@page import="music.MusicDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="music.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">
<title>실시간 순위</title>
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

	<%
		MusicDAO dao = new MusicDAO();
		dao.drop(); /* DB에 있는 자료 모두 버리고 순번 초기화 */
		dao.top50(); /* top50개 음원 제목, 가수명 DB입력 */
		String[] cover = dao.image(); /* 앨범사진 URL을 배열로 만듦 */
		
		ArrayList listAll = new ArrayList();
		listAll = dao.selectAll();
		for (int i = 0; i < listAll.size(); i++) {
			MusicDTO dto = (MusicDTO) listAll.get(i);
			String album = cover[i];
	%>
<div class="alert alert-primary" role="alert">
	<tr class="table-primary">
		<td><img alt="이미지 없음" src=<%=album%>></td>
		<td class="bg-primary"><%=dto.getNum()%></td>위 / 
		<td class="bg-primary"><%=dto.getTitle()%></td> - 
		<td class="bg-primary"><%=dto.getArtist()%></td>
		<br>
	</tr>
</div>

	<%
		}
	%>

</body>
</html>
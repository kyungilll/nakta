<%@page import="java.io.Console"%>
<%@page import="music.MusicDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="music.MusicDAO"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>������ �¿�� ��Ÿ</title>
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
		<div id="title"></div>

		<div id="search">
			<form action="">
				<input type="text" id="searchbox"
					style="width: 400px; height: 45px;" placeholder="�˻�� �Է����ּ���.">
				<button type="submit" class="btn btn-primary btn-lg">�˻�</button>
			</form>
		</div>

		<div id="login">
			<table>
				<tr>
					<td><img src="images/Camel.png" alt="�̹��� ����"></td>
					<td>
						<form action="">
							<button type="submit" id="loginbutton" class="btn btn-info">�α���</button>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="menu">
		<table>
			<ul>
				<li class="menuselect"><a href="rank.jsp">������Ʈ</a>
				<li class="menuselect"><a href="">�ֽ�����</a>
				<li class="menuselect"><a href="">�Ű���</a>
				<li class="menuselect"><a href="">��������</a>
			</ul>
		</table>
	</div>
	<hr class="hr">
	<div id="middle">
		<div id="album" class="album">
			<table>
				<tbody>
					<%
						//������ �ٹ����� 1~4 / 4~8�� url �� �����
						MusicDAO dao = new MusicDAO();
						ArrayList<String> cover = dao.mainImage();
					%>
					<tr>
						<%
							for (int i = 0; i < 4; i++) {
								String x = cover.get(i);
						%>
						<td><a href=""><img alt="�̹��� ����" src=<%=x%> width=173px, height=173px id="mainimage"></a></td>
						<%
							}
						%>

					</tr>
					<tr>
						<%
							for (int i = 4; i < 8; i++) {
								String x = cover.get(i);
						%>
						<td><a href=""><img alt="�̹��� ����" src=<%=x%> width=173px, height=173px id="mainimage"></a></td>
						<%
							}
						%>

					</tr>

				</tbody>
			</table>

		</div>

		<div id="chart">
			<table>
				<tr align="center">�α�˻���
				</tr>
				<br>
				<br>
				<!-- �α�˻��� �������� -->
				<%
					MusicDTO dto = new MusicDTO();
					String url1 = "https://www.genie.co.kr/chart/top200";
					Document doc = null;

					try {
						doc = Jsoup.connect(url1).get();
					} catch (IOException e) {
						e.printStackTrace();
					}

					Elements element = doc.select("div.aside_realtime"); //�˻��� Ʋ
					// ���ϴ� ������ �ִ� Ʋ(?) �Է�

					ArrayList list = new ArrayList();
					int n = 1;

					for (Element y : element.select("a")) { // �˻���
						String word = y.text();
				%>
				<tr><%=n + "��  "%>
				<tr>
				<tr>
					<a href=""><%=word%></a>
					</a>
					<br>
				</tr>
				<%
					n++;
					}
				%>
			</table>
		</div>
	</div>

	<div id="bottom">
		<div id="notice"></div>

		<div id="news"></div>
	</div>
	<div id="under">
		ȸ��Ұ� | �̿��� | ��������ó����ħ | û�ҳ⺸ȣ��å | �̸����ּҹ��ܼ����ź� | ���� �̿빮��
		<div id="under2"></div>
		</div>
</body>
</html>
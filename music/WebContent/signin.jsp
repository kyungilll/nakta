<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel="stylesheet" type="text/css" href="log.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#id").click(function() {
					$.ajax({
						type: "POST",
						url: "id_check.jsp",
						data:{
							"id":$("#id").val()
						},
						success: function(data){
							if($.trim(data) == "YES"){
								alert("사용 가능한 ID입니다.");
							}else{
								alert("중복된 ID입니다.");
							}
						}
					});
				});
			});	
		
			function passchk(){ //비밀번호 체크
				var pw1 = document.querySelector('#pw1');
				var pw2 = document.querySelector('#pw2');
				if (pw1.value.length < 6 || pw1.value == null) {
					alert("비밀번호를 6자 이상 입력하세요!");
					pw1.focus();
				} else if (pw1.value != pw2.value) {
					alert("비밀번호가 일치하지 않습니다.")
				} 
			}
			
		</script>
		
	</head>
	<body>
		<center>
			<h1>회원가입</h1>
			<hr color="pink" size="5">
			<form action="SignIn.jsp" name="f">
				<table border="0" class="sign1">
					<tr>
						<td class="sign1">아이디</td>
						<td class="sign2">
							<input type="text" id="id" name="id" maxlength="50">
							<input type="button" id="idchk" value="중복확인">
						</td>
					</tr>
					<tr>
						<td >비밀번호</td>
						<td><input type="password" id="pw1" name="pw1" placeholder="6자 이상 "></td>
					</tr>
					<tr></tr>
					<tr>
						<td >비밀번호 확인</td>
						<td><input type="password" size="15" maxlength="20" id="pw2" name="pass2" onblur="passchk()">&nbsp;
   						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" placeholder="이름을 입력하세요."></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="gender" value="female" checked>여자
							<input type="radio" name="gender" value="male" >남자
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<select name="birthY">
								<%for(int i = 2019; i > 1900; i--){%>
									<option value="<%=i %>"><%=i%></option>
								<%}%>
							</select> 년 &nbsp;

							<select name="birthM" >
								<%for(int i = 1; i <= 12; i++){%>
									<option value="<%= i %>"><%= i %></option>
								<%}%>
							</select> 월 &nbsp;

							<select name="birthD">
								<%for(int i = 1; i <= 31; i++){%>
									<option value="<%= i %>"><%= i %></option>
								<%}%>
							</select> 일&nbsp;
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" name="eId" maxlength="50">&nbsp;@
							<select name="eAdd">
								<option selected>이메일 선택</option>
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
								<option> hotmail.com</option>
								<option>yahoo.com</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="submit" value="회원정보 등록">
			</center>
		</form>
	</body>
</html>
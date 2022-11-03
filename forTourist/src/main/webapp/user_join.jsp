<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 폼</h1>
	<div>
		<section>
		<!-- no id password name nickname gender phone resDate 8 -->
			<form method = "POST" action = "user_joinPro.jsp">
				<table>
					<tr>
						<td id = "title"> 회원번호 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
					<tr>
						<td id = "title"> 아이디 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
					 <tr>
						<td id = "title"> 비밀번호 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
					 <tr>
						<td id = "title"> 이름 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
					 <tr>
						<td id = "title"> 닉네임 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
					 <tr>
						<td id = "title"> 성별 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
					 <tr>
						<td id = "title"> 핸드폰 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
					 <tr>
						<td id = "title"> 가입날짜 </td>
						<td><input type = "text" id = "no" name = "account" maxlength = "50"><td>
					 </tr>
				</table>
			</form>
		</section>
	</div>
		<script src="resources/vaildationJoin.js"></script>
</body>
</html>
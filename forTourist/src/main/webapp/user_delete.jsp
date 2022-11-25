<%@page import="forTourist.user.UserDto"%>
<%@page import="forTourist.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<h2>회원 	탈퇴</h2>
		<form method="post" action="/forTourist/DeleteAction">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>회원 아이디</td>
					<td><input type="text" id="id" name="id" placeholder = "아이디를 입력해주세요."></td>
				</tr>
				<tr>
					<td>회원 비밀번호</td>
					<td><input type="password" id="password" name="password" placeholder = "비밀번호를 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" onclick="if(confirm('수정하시겠습니까?'))" value="탈퇴"> <!-- onclick="alert('회원이 탈퇴 되었습니다.')" -->
						<input type="button" value="취소" onclick="location.href='user_mypage.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>
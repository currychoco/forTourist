<%@page import="forTourist.user.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="forTourist.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
	<%
	UserDao userDao = UserDao.getInstance();
	ArrayList<UserDto> list = userDao.getUserAll();
	%>
		<table border = "1" >
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>회원 아아디</th>
					<th>회원 비밀번호</th>
					<th>회원 이름</th>
					<th>회원 닉네임</th>
					<th>회원 성별</th>
					<th>회원 핸드폰번호</th>
					<th>회원 가입날짜<th>
				</tr>
			</thead>
			<tbody>
			<%
				for (UserDto user : list) {
			%>
			<tr>
				<!-- 값을 어떻게 넘길건지 -->
				<td><%=user.getNo()%></td>
				<td><%=user.getId() %></td>
				<td><%=user.getPassword()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getNickname()%></td>
				<td><%=user.getGender()%></td>
				<td><%=user.getPhone()%></td>
				<td><%=user.getResDate() %></td>
			</tr>
			<%
			}
			%>
			
		 </form>
		 <input type="button" onclick="location.href='user_joinDelete.jsp'" value="회원 삭제">
		 <input type="button" onclick="location.href='user_login.jsp'" value="로그인페이지이동">
		
		</table>

			</tbody>
	</section>
</body>
</html>
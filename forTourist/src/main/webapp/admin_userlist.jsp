<%@page import="java.util.List"%>
<%@page import="forTourist.user.UserDto"%>
<%@page import="forTourist.user.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/mypage.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp"/>
	<jsp:include page="admin_header.jsp"/>
	
	<section>
		<%
		request.setCharacterEncoding("utf-8");
		
		UserDao userDao = UserDao.getInstance();
		List<UserDto> users = userDao.getUserAll();
		%>
		<h2>회원 정보</h2>
		<table border = "1" class = "mytable" >
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>회원 아아디</th>
					<th>회원 비밀번호</th>
					<th>회원 이름</th>
					<th>회원 닉네임</th>
					<th>회원 성별</th>
					<th>회원 핸드폰번호</th>
				</tr>
			</thead>
			<tbody>
				<% for(UserDto user : users) { %>
				<tr>
					<td><%=user.getNo()%></td>
					<td><%=user.getId()%></td>
					<td><%=user.getPassword()%></td>
					<td><%=user.getName()%></td>
					<td><%=user.getNickname()%></td>
					<td><%=user.getGender()%></td>
					<td><%=user.getPhone()%></td>
				</tr>
				<% } %>
			</tbody>
		</table>

	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>
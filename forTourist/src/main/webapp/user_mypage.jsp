<%@page import="forTourist.user.UserDto"%>
<%@page import="forTourist.user.UserDao"%>
<%@page import="java.util.ArrayList"%>
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
	String id = "test2";  // **현재 임시값** 로그인 하고 받아와야 하는 값 입니다.
	UserDao userDao = UserDao.getInstance();
	UserDto user = userDao.getUserById(id);
	%>
	<h2>회원 정보 수정 및 탈퇴</h2>
	
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
				</tr>
			</thead>
			<tbody>
			<tr>
				<!-- 값을 어떻게 넘길건지 -->
				<td><%=user.getNo()%></td>
				<td><%=user.getId() %></td>
				<td><%=user.getPassword()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getNickname()%></td>
				<td><%=user.getGender()%></td>
				<td><%=user.getPhone()%></td>
			</tr>
		 <form>	
		 <input type="button" onclick="location.href='user_modify.jsp?value=<%=id%>'" value="회원 정보수정">
		 <input type="button" onclick="location.href='user_delete.jsp?value=<%=id%>'" value="회원 탈퇴 ">
		</form>
		</table>
	
	
	</section>
</body>
</html>
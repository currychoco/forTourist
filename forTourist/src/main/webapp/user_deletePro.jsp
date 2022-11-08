<%@page import="forTourist.user.UserDto"%>
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
	<%
	request.setCharacterEncoding("UTF-8");
	UserDao userDao = UserDao.getInstance();
	UserDto user = null;

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	user = userDao.getUserById(id);
	userDao.deleteUser(id);

	if (user != null) {
		String checkPassword = user.getPassword();
		String checkId = user.getId();

		if (id.equals(checkId) && password.equals(checkPassword)) {
			userDao.deleteUser(id);
			session.setAttribute("id", null);
			response.sendRedirect("home");
		} else {
			response.sendRedirect("user_mypage.jsp");
		}
	}
	%>





</body>
</html>
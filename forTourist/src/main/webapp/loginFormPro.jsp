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

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	UserDao dao = UserDao.getInstance();
	UserDto dto = dao.getUserById(id);
	
	if(dto != null){
		if(password.equals(dto.getPassword())){
			session.setAttribute("id", id);
			System.out.println("세션저장성공");
			response.sendRedirect("home");
		}else{
			System.out.println("세션저장실패");
			response.sendRedirect("loginForm.jsp");
		}
	}else{
		System.out.println("세션저장실패");
		response.sendRedirect("loginForm.jsp");
	}

%>
</body>
</html>
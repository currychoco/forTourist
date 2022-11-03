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
UserDao userDao = UserDao.getInstance();
request.setCharacterEncoding("UTF-8");
UserDto user = null;
int no = Integer.parseInt(request.getParameter("no"));
String id = request.getParameter("id");
user = userDao.getUserById(id);

//비밀번호 이름  폰 

String password = request.getParameter("password");
if(password != null)
	user.setPassword(password);

String name = request.getParameter("name");
if(name != null)
	user.setName(name);

String phone = request.getParameter("phone");
if(phone != null)
user.setPhone(phone);



System.out.println(id);
System.out.println(password);
System.out.println(name);
System.out.println(phone);

userDao.modifyUser(user, no);
response.sendRedirect("user_list.jsp");
%>
</body>
</html>
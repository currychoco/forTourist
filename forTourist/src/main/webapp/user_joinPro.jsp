<%@page import="forTourist.user.UserDao"%>
<%@page import="forTourist.user.UserDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
UserDto userDto = null;
/* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");/*  */


request.setCharacterEncoding("UTF-8");
/* no id password name nickname gender phone resDate */
int no =  Integer.parseInt(request.getParameter("no"));
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String gender = request.getParameter("gender");
String phone = request.getParameter("phone");



/* if(no != null && id != null && password != null && name != null && nickname != null && gender != null && phone != null && resDate != null){ */
	userDto = new UserDto(no, id , password, name , nickname , gender, phone);
	userDao.createUser(userDto);
	response.sendRedirect("user_list.jsp");
%>


</body>
</html>
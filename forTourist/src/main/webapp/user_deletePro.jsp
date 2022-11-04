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
	
	
if(user != null){
	String checkPassword = user.getPassword();
	String checkId = user.getId();
	
if(id.equals(checkId) && password.equals(checkPassword)){
%>

alert('회원이 탈퇴 되었습니다.');

<%
userDao.deleteUser(id);
response.sendRedirect("user_list.jsp");
}else{
%>	
alert('
회원이 탈퇴 되었습니다.');
	
<%	
response.sendRedirect("user_mypage.jsp");
	} 
}
%>





</body>
</html>
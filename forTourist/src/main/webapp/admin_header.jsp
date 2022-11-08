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

<div>
	<input type="button" value="회원 리스트 조회" class ="button" onclick="location.href='admin_userlist.jsp'">&nbsp; | &nbsp;
	<input type="button" value="축제 정보 동기화"class ="button" onclick="location.href='admin_sync_festival.jsp'">
</div>
	
		
	
</body>
</html>
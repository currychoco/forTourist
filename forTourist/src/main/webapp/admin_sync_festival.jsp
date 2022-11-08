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
	
	<div>
		<input type="date" id="date" />
		<button onclick="startSyncFestival()">동기화 시작</button>
	</div>
		
	<script src="resources/sync_festival.js"></script>
	 
	<jsp:include page="footer.jsp"/>
</body>
</html>
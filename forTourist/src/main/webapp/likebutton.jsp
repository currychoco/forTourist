<%@page import="java.net.URLEncoder"%>
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
	response.setCharacterEncoding("utf-8");
	
	int contentId = Integer.parseInt(request.getParameter("contentid"));
	String title = request.getParameter("title");
	String addr1 = request.getParameter("addr1");
	String addr1Encode = URLEncoder.encode(addr1,"utf-8").replaceAll("\\+", "%20");
	String firstimage = request.getParameter("firstimage");	
%>


</body>
</html>
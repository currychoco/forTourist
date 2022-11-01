<%@page import="forTourist.festival.FestivalDao"%>
<%@page import="forTourist.util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="header.jsp"/>

<%
	FestivalDao dao = FestivalDao.getInstance();
	int no = dao.test();
	System.out.println(no);

%>
	<section>
		테마 / 전국
	</section>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>
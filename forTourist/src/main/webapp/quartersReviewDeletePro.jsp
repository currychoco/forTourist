<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="forTourist.review.ReviewDao"%>
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
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
int contentId = Integer.parseInt(request.getParameter("contentId"));
String userId = request.getParameter("userId");
String id = (String)session.getAttribute("id");
String tel = request.getParameter("tel");

String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
String addr1En = URLEncoder.encode(addr1De, "utf-8");
String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");

ReviewDao dao = ReviewDao.getInstance();
if(userId.equals(id)){
	dao.deleteReview(no);
	response.sendRedirect("/forTourist/detailQuarters?contentid=" + contentId + "&title=" + title + "&addr1=" + addr1En
			+ "&firstimage=" + firstimage + "&tel=" + tel);
}else{
	response.sendRedirect("/forTourist/detailQuarters?contentid=" + contentId + "&title=" + title + "&addr1=" + addr1En
			+ "&firstimage=" + firstimage + "&tel=" + tel);
}
%>
</body>
</html>
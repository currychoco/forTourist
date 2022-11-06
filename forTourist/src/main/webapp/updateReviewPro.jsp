<%@page import="forTourist.review.ReviewDto"%>
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

System.out.println("no : " + request.getParameter("no"));
System.out.println("content : " + request.getParameter("content"));
System.out.println("contentId : " + request.getParameter("contentId"));

int no = Integer.parseInt(request.getParameter("no"));
String content = request.getParameter("content");
int contentId = Integer.parseInt(request.getParameter("contentId"));
ReviewDto dto = new ReviewDto(no, content);

ReviewDao dao = ReviewDao.getInstance();
dao.updateReview(dto);

response.sendRedirect("/forTourist/detailFestival?contentId=" + contentId);

%>
</body>
</html>
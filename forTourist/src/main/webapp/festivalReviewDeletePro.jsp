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
int no = Integer.parseInt(request.getParameter("no"));
int contentId = Integer.parseInt(request.getParameter("contentId"));
String userId = request.getParameter("userId");
String id = (String)session.getAttribute("id");


ReviewDao dao = ReviewDao.getInstance();
if(userId.equals(id)){
	dao.deleteReview(no);
	response.sendRedirect("/forTourist/detailFestival?contentId="+ contentId);
}else{
	response.sendRedirect("/forTourist/detailFestival?contentId="+ contentId);
}

%>
</body>
</html>
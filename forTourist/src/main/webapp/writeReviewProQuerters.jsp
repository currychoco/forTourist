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
int contentId = Integer.parseInt(request.getParameter("contentId"));
	String content=request.getParameter("content");
	System.out.println(contentId);
	String userid = (String)session.getAttribute("id");

if(session.getAttribute("id") == null){
	response.sendRedirect("login");
}else{

	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = new ReviewDto(contentId, userid, content);
	dao.setReview(dto);
	
	response.sendRedirect("writeReviewQuerters.jsp?contentId=${contentId}&title=${title}&addr1=${addr1}&firstimage=${firstimage}");
}%>



</body>
</html>
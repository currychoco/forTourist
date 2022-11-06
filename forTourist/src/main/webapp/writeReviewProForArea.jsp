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

if(session.getAttribute("id") == null){
	response.sendRedirect("login");
}else{
	int contentId=Integer.parseInt(request.getParameter("contentId"));
	String content=request.getParameter("content");
	String userid = (String)session.getAttribute("id");
	
	String title=request.getParameter("title");
	String addr1=request.getParameter("addr1");
	String firstimage=request.getParameter("firstimage");
	
	
	System.out.println(contentId);
	System.out.println(title);
	System.out.println(addr1);
	System.out.println(firstimage);
	

	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = new ReviewDto(contentId, userid, content);
	dao.setReview(dto);
	/* response.sendRedirect("/forTourist/contentid=" + contentId + "&title=" + title + "&addr1=" + addr1 + "&firstimage=" + firstimage); */
	response.sendRedirect("/forTourist/area");
}


%>
</body>
</html>
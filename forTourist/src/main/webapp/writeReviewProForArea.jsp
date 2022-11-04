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

	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = new ReviewDto(contentId, userid, content);
	dao.setReview(dto);
	
	response.sendRedirect("/forTourist/detailArea?contentId="+contentId+"&title=가람돌솥밥&addr1=제주특별자치도%20서귀포시%20중문관광로%20332&firstimage=http://tong.visitkorea.or.kr/cms/resource/47/2755047_image2_1.jpg");
}


%>
</body>
</html>
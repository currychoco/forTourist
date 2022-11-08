<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
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
response.setCharacterEncoding("utf-8");

if(session.getAttribute("id") == null){
	response.sendRedirect("login");
}else{
	int contentId=Integer.parseInt(request.getParameter("contentId"));
	String content=request.getParameter("content");
	String titleDe = request.getParameter("title");
	String userid = (String)session.getAttribute("id");
	String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
	String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
	String addr1En = URLEncoder.encode(addr1De, "utf-8");
	String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");
	
	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = new ReviewDto(contentId, userid, content ,titleDe, addr1De, firstimage);
	dao.setReviewApi(dto);

	response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&title=" + title + "&addr1=" + addr1En + "&firstimage=" + firstimage);

}

%>
</body>
</html>
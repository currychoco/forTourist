<%@page import="java.net.URLDecoder"%>
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
	String userid = (String)session.getAttribute("id");
	
	String title=request.getParameter("title");
	String addr1=request.getParameter("addr1");
	String firstimage=request.getParameter("firstimage");
	
	String text = URLDecoder.decode(title, "UTF-8") ;
	String text2 = URLDecoder.decode(addr1, "UTF-8") ;
	
	
	System.out.println("지금 실행한거");
	System.out.println(contentId);
	System.out.println(title);
	System.out.println(addr1);
	System.out.println(firstimage);
	System.out.println("지금 실행한거");

	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = new ReviewDto(contentId, userid, content);
	dao.setReview(dto);
	/* response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&title=" + title + "&addr1=" + addr1 + "&firstimage=" + firstimage); */
	/* response.sendRedirect("/forTourist/area"); */
	response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1 + "&&firstimage=" + firstimage);
}


%>
</body>
</html>
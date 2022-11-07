<%@page import="java.net.URLDecoder"%>
<<<<<<< HEAD
<%@page import="java.net.URLEncoder"%>
=======
>>>>>>> refs/remotes/origin/#HongJiung
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
	
	String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
	String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
	String addr1En = URLEncoder.encode(addr1De, "utf-8");
	String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");
	
	String text = URLDecoder.decode(title, "UTF-8") ;
	String text2 = URLDecoder.decode(addr1, "UTF-8") ;
	
	
	System.out.println("지금 실행한거");
	System.out.println(contentId);
	System.out.println(title);
	System.out.println("addr1De :" +addr1De);
	System.out.println(firstimage);
	System.out.println("지금 실행한거");

	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = new ReviewDto(contentId, userid, content);
	dao.setReview(dto);
<<<<<<< HEAD
	response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En + "&&firstimage=" + firstimage);

=======
	/* response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&title=" + title + "&addr1=" + addr1 + "&firstimage=" + firstimage); */
	/* response.sendRedirect("/forTourist/area"); */
	response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1 + "&&firstimage=" + firstimage);
>>>>>>> refs/remotes/origin/#HongJiung
}


%>
</body>
</html>
<%@page import="forTourist.want.WantDto"%>
<%@page import="forTourist.want.WantDao"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="forTourist.like.LikeDto"%>
<%@page import="forTourist.like.LikeDao"%>
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
	String userId = (String)session.getAttribute("id");
	int contentId = Integer.parseInt(request.getParameter("contentId"));
	String url = request.getParameter("url");
	String title = request.getParameter("title");

	String titleEn = URLEncoder.encode(request.getParameter("title"),"utf-8");
	String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
	String addr1En = URLEncoder.encode(addr1De, "utf-8");
	String firstimage = URLEncoder.encode(request.getParameter("firstimage"),"utf-8");
	String titleDe = URLDecoder.decode(request.getParameter("title"),"utf-8");
	System.out.println(userId);
	System.out.println(contentId);
	
	
	WantDao dao = WantDao.getInstance();
	WantDto dto = null;
	
	dto = dao.getWantbyTwoId(contentId,userId);
	
	
	PrintWriter res = response.getWriter();
    String json = new Gson().toJson(dto);
    res.println(json);
    
    
    if(dto!=null){
		if(!dto.isWant()){
			dao.modifyWant(dto, true);
		}else{
			dao.modifyWant(dto, false);
		}
	}else{
		System.out.println(titleDe);
		System.out.println(title);

	dto = new WantDto(dao.getLastNo(), true, contentId, userId, title, url);
	dao.createWant(dto);
	}
	response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&&title=" + titleDe + "&&addr1=" + addr1En
			+ "&&firstimage=" + firstimage);
    
	%>
	

</body>
</html>
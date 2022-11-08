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

	String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
	String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
	String addr1En = URLEncoder.encode(addr1De, "utf-8");
	String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");
	String url = "/forTourist/detailfestival?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En + "&&firstimage=" + firstimage;
	String titleDe = URLDecoder.decode(request.getParameter("title"),"utf-8");
	System.out.println(userId);
	System.out.println(contentId);
	
	
	LikeDao dao = LikeDao.getInstance();
	LikeDto dto = null;
	
	dto = dao.getLikebyTwoId(contentId,userId);
	
	PrintWriter res = response.getWriter();
    String json = new Gson().toJson(dto);
    res.println(json);
    
    
    if(dto!=null){
		if(!dto.isLike()){
			dao.modifyLike(dto, true);
		}else{
			dao.modifyLike(dto, false);
		}
	}else{
		System.out.println(titleDe);
		System.out.println(title);

	dto = new LikeDto(dao.getLastNo(), true, contentId, userId, titleDe, url);
	dao.createLike(dto);
	}
	response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&&title=" + titleDe + "&&addr1=" + addr1En
			+ "&&firstimage=" + firstimage);
    
	%>
	

</body>
</html>
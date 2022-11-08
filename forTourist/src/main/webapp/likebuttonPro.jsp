<%@page import="forTourist.like.LikeDto"%>
<%@page import="forTourist.like.LikeDao"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
<% 

LikeDto dto = null;
if(session.getAttribute("id") == null){
%>
	alert("로그인이 필요한 페이지입니다!");
<%
	response.sendRedirect("login");
}else{
	
	
	response.setContentType("application/json");
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	int contentId=Integer.parseInt(request.getParameter("contentId"));
	String userId = (String)session.getAttribute("id");
	LikeDao dao = LikeDao.getInstance();
	
	dto = dao.getLikebyTwoId(contentId,userId);
	
	
	if(dto!=null){
		if(!dto.isLike()){
			dao.modifyLike(dto, true);
		}else{
			dao.modifyLike(dto, false);
		}
	}else{
	String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
	String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
	String addr1En = URLEncoder.encode(addr1De, "utf-8");
	String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");
	String url = "/forTourist/detailfestival?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En + "&&firstimage=" + firstimage;
	String titleDe = URLDecoder.decode(request.getParameter("title"),"utf-8");
	
	dto = new LikeDto(dao.getLastNo(), true, contentId, userId, titleDe, url);
	dao.createLike(dto);
	}%>


</script>
</body>
</html>
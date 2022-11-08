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
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

if(session.getAttribute("id") == null){
%>
	alert("로그인이 필요한 페이지입니다!");
<%
	response.sendRedirect("login");
}else{
	
	int contentId=Integer.parseInt(request.getParameter("contentId"));
	String userId = (String)session.getAttribute("id");
	LikeDao dao = LikeDao.getInstance();
	LikeDto dto = dao.getLikebyTwoId(contentId,userId);
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
	String url = "/forTourist/detailKeyword?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En + "&&firstimage=" + firstimage;

	dto = new LikeDto(dao.getLastNo(), true, contentId, userId, title, url);
	dao.createLike(dto);
	
	response.sendRedirect("/forTourist/detailKeyword?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En + "&&firstimage=" + firstimage);
	
	}
}

%>
</script>
</body>
</html>
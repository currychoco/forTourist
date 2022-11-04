
<%@page import="forTourist.review.ReviewDto"%>
<%@page import="forTourist.review.ReviewDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	response.setContentType("application/json");
	request.setCharacterEncoding("utf-8");
	int contentId = Integer.parseInt(request.getParameter("contentId"));

	ReviewDao dao = ReviewDao.getInstance();
	List<ReviewDto> dtoList = dao.getAllReview(contentId);
	
	%>
	[
	<% for(ReviewDto dto : dtoList) { %>
	{
		"no" : "<%=dto.getNo() %>",
		"contentId" : "<%=dto.getContentId() %>",
		"userid" : "<%=dto.getUserid() %>",
		"title" : "<%=dto.getTitle() %>",
		"content" : "<%=dto.getContent() %>",
		"resDate" : "<%=dto.getResDate() %>",
		"modDate" : "<%=dto.getModDate() %>"
	}<%if(dtoList.indexOf(dto) != dtoList.size() - 1) { %>
		,
	<%} %>	
	<% } %>
	]
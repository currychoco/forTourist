<%@page import="forTourist.festival.FestivalDto"%>
<%@page import="java.util.List"%>
<%@page import="forTourist.festival.FestivalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	response.setContentType("application/json");
	request.setCharacterEncoding("utf-8");
	String date = request.getParameter("date");

	FestivalDao dao = FestivalDao.getInstance();
	List<FestivalDto> dtoList = dao.getAllFestivalByDate(date);
	
	%>
	[
	<% for(FestivalDto dto : dtoList) { %>
	{
		"contentId" : "<%= dto.getContentId()%>",
		"addr1" : "<%=dto.getAddr1()%>",
		"addr2" : "<%=dto.getAddr2() %>",
		"areacode" : "<%=dto.getAreacode() %>",
		"booktour" : "<%=dto.getBooktour() %>",
		"cat1" : "<%=dto.getCat1() %>",
		"cat2" : "<%=dto.getCat2() %>",
		"cat3" : "<%=dto.getCat3() %>",
		"eventEndDate" : "<%=dto.getEventEndDate() %>",
		"eventStartDate" : "<%=dto.getEventStartDate() %>",
		"posterImage" : "<%=dto.getPosterImage() %>",
		"mapX" : "<%=dto.getMapX() %>",
		"mapY" : "<%=dto.getMapY() %>",
		"mlevel" : "<%=dto.getMlevel() %>",
		"sigungucode" : "<%=dto.getSigungucode() %>",
		"tel" : "<%=dto.getTel().replaceAll("\"", "&quot;") %>",
		"title" : "<%=dto.getTitle() %>"
	}<%if(dtoList.indexOf(dto) != dtoList.size() - 1) { %>
		,
	<%} %>	
	<% } %>
	]
<%@page import="forTourist.festival.FestivalDao"%>
<%@page import="forTourist.festival.FestivalDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	
	int contentId = Integer.parseInt(request.getParameter("contentId"));
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String areacode = request.getParameter("areacode");
	String booktour = request.getParameter("booktour");
	String cat1 = request.getParameter("cat1");
	String cat2 = request.getParameter("cat2");
	String cat3 = request.getParameter("cat3");
	String eventEndDate = request.getParameter("eventEndDate");
	String eventStartDate = request.getParameter("eventStartDate");
	String posterImage = request.getParameter("posterImage");
	double mapX = Double.parseDouble(request.getParameter("mapX"));
	double mapY = Double.parseDouble(request.getParameter("mapY"));
	
	String mlevelStr = request.getParameter("mlevel");
	int mlevel = 0;
	if(mlevelStr!=null && !"".equals(mlevelStr)){
		mlevel = Integer.parseInt(request.getParameter("mlevel"));
	}
	
	String sigungucode = request.getParameter("sigungucode");
	String tel = request.getParameter("tel");
	String title = request.getParameter("title");
		
	FestivalDto dto = new FestivalDto(
			contentId,
			addr1,
			addr2,
			areacode,
			booktour,
			cat1,
			cat2,
			cat3,
			eventEndDate,
			eventStartDate,
			posterImage,
			mapX,
			mapY,
			mlevel,
			sigungucode,
			tel,
			title
		);
	
	FestivalDao dao = FestivalDao.getInstance();
	
	FestivalDto exists = dao.findById(contentId);
	if(exists == null){
		dao.insertFestival(dto);
	}else{
		System.out.println(exists);
	}
		
	%>
</body>
</html>
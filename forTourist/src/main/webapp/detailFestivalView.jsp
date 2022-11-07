<%@page import="forTourist.festival.FestivalDto"%>
<%@page import="forTourist.festival.FestivalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="resources/festival.css"> -->
<!-- <link rel="stylesheet" href="resources/detailFestView.css"> -->
<link rel="stylesheet" href="resources/detailArea.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<%
		int contentId = Integer.parseInt(request.getParameter("contentId"));
			
		FestivalDao dao = FestivalDao.getInstance();
		FestivalDto dto = dao.findById(contentId);
		
		%>
		
		<div class='container' >
			<div class='imgWrap'><!-- festivalImg -->
            	<img src="<%=dto.getPosterImage() %>"  class = "img" style = "width:300px ; margin-left:20%">
	        </div>
	        <div class='content'><!-- festivalTable -->
	        	<table>
	        		<tr>
	        			<th>행사</th>
	        			<td class ="title"><%=dto.getTitle() %></td>
	        		</tr>
	        		<tr>
	        			<th>주소</th>
	        			<td><%=dto.getAddr1() %></td>
	        		</tr>
	        		<tr>
	        			<th>시작일</th>
	        			<td><%=dto.getEventStartDate() %></td>
	        		</tr>
	        		<tr>
	        			<th>종료일</th>
	        			<td><%=dto.getEventEndDate() %></td>
	        		</tr>
	        		<tr>
	        			<th>전화번호</th>
	        			<td><%=dto.getTel() %></td>
	        		</tr>
	        	</table>
		<div class="writeReview">
			<form method="post" action="/forTourist/writeReviewPro.jsp">
				<input type="hidden" id="contentId" name="contentId" value=<%=contentId %>>
				<textarea required name="content" id="content" rows="3" placeholder="리뷰 작성" required></textarea>
	            <input type="submit" value="작성">
            </form>
		</div>
	        </div>
		</div>
		
		<div class="updateReview" style="display:none;">
			<form method="post" action="updateReviewPro.jsp">
				<input type="hidden" id = "contentId" name="contentId" value=<%=contentId %>>
				<input type="hidden" id="no" name="no" value="">
				<textarea required name="content" id="content" rows="3" placeholder="리뷰 수정" required></textarea>
	            <input type="submit" value="수정">
            </form>
		</div>
		<div class="review">
			<input type="hidden" id="contentId" name="contentId" value=<%=contentId %>>
			<input type="hidden" id="userid" name="userid" value=<%=session.getAttribute("id") %>>
		</div>
		<script src="resources/review.js"></script>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>
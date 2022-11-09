<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="forTourist.review.ReviewDao"%>
<%@page import="forTourist.review.ReviewDto"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/writeReviewLookUp.css">

<title>Review</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("id");
	ReviewDao dao = ReviewDao.getInstance();
	List<ReviewDto> list =dao.getAllReviewByIdTwo(id);
	
	

	%>
	<h1>나의 리뷰</h1>
	<div >
		<table border="1" class="table-container">
			<thead>
				<tr>
					<th>no</th>
					<th width="350px">title</th>
					<th width="800px">content</th>
				</tr>
			</thead>
			<tbody>
			<% 
			
			int i=1;
			for(ReviewDto review :list){
				String title = review.getTitle();
				int contentId = review.getContentId();
				String addr1 = review.getAddr1();
				String firstimage= review.getFirstimage();
	
				
				System.out.println(title);
				System.out.println(contentId);
				System.out.println(addr1);
				System.out.println(firstimage);
			%>
				<tr>
					<td><%=i%></td>
					<td><a href='/forTourist/detailKeyword?contentid=<%=contentId%>&title=<%=title%>&addr1=<%=addr1%>&firstimage=<%=firstimage%>'><%=review.getTitle()%></a></td>
					<td><%=review.getContent() %></td>
					</tr>
			<%
			i++;
			}%>
			</tbody>
		</table>
			
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>

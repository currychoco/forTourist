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
	String id = (String)session.getAttribute("id");
	ReviewDao dao = ReviewDao.getInstance();
	List<ReviewDto> list =dao.getAllReviewById(id);
	%>
	<h1>나의 리뷰</h1>
	<div >
		<table border="1" class="table-container">
			<thead>
				<tr>
					<th>no</th>
					<th width="200px">contentId</th>
					<th width="300px">title</th>
					<th width="800px">content</th>
				</tr>
			</thead>
			<tbody>
			<%for(ReviewDto review :list){%>
				<tr>
					<td><%=review.getNo() %></td>
					<td><%=review.getContentId()%></td>
					<td><%=review.getTitle() %></td>
					<td><%=review.getContent() %></td>
				</tr>
			<%}%>
			</tbody>
		</table>
			
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>

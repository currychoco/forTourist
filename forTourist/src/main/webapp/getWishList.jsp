<%@page import="forTourist.want.WantDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="forTourist.want.WantDao"%>
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
	String id = (String)session.getAttribute("id");
	WantDao dao = WantDao.getInstance();
	ArrayList<WantDto> list = dao.getWantAllById(id);
%>

<h1>나의 WishList</h1>
	<div>
		<table border="1" class="table-container">
			<thead>
				<tr>
					<th>no</th>
					<th width="150px">content ID</th>
					<th width="200px">title</th>
				</tr>
			</thead>
			<tbody>
			<% int i=1;
			for(WantDto want :list){%>
				<tr>
					<td><%=i%></td>
					<td><%=want.getContentId()%></td>
					<td><a href="<%=want.getUrl()%>"><%=want.getTitle() %></a></td>
					</tr>
			<%
			i++;
			}%>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@page import="forTourist.user.UserDto"%>
<%@page import="forTourist.user.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/mypage.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<section>
	<%
	request.setCharacterEncoding("utf-8");

	if(session.getAttribute("id") == null){
		response.sendRedirect("login");
	} else {
		String id = (String)session.getAttribute("id");
		UserDao userDao = UserDao.getInstance();
		UserDto user = userDao.getUserById(id);
	%>
	<h2>회원 정보</h2>
			<table border = "1" class = "mytable" >
			<thead>
				<tr>
					<th>회원 아아디</th>
					<th>회원 이름</th>
					<th>회원 닉네임</th>
					<th>회원 성별</th>
					<th>회원 핸드폰번호</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td><%=user.getId()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getNickname()%></td>
				<td><%=user.getGender()%></td>
				<td><%=user.getPhone()%></td>
			</tr>
		 <form>	
		 <input type="button" onclick="location.href='user_modify.jsp?value=<%=id%>'" value="회원 정보수정" class ="button">&nbsp; | &nbsp;
		 <input type="button" onclick="location.href='user_delete.jsp?value=<%=id%>'" value="회원 탈퇴 "class ="button">&nbsp; | &nbsp;
		 <input type="button" value='작성글 모음' class="button" onclick="location.href='writeReviewLookUp.jsp'"/>&nbsp; | &nbsp;	<!-- 수정 (정민식) -->
		 <input type="button" value='찜 목록' class="button" onclick="location.href='getWishList.jsp'"/>
		 <% if((Boolean) request.getSession().getAttribute("manager")) { %>
		 &nbsp; | &nbsp;
		 <input type="button" value='관리자' class="button" onclick="location.href='admin_mypage.jsp'"/>
		 <% } %>
		</form>
		</tbody>
		</table>
<%		
		}
%>
	</section>
	
	
	<jsp:include page="footer.jsp"/>
</body>
</html>
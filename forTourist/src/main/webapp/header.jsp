<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지</title>
<link rel="stylesheet" href="resources/grid.css">
</head>
<body>
	<header>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
	%>
		<ul class = "login"> 
		<li class = "log"><a href="loginForm.jsp">로그인</a>
        <li class = "join"><a href="user_join.jsp">회원가입</a>
    <%}else{ %>
    	<span><b><%=id %></b>님 안녕하세요!</span>
    	<button onclick="location.href='logoutPro.jsp'">logout</button>
    <%} %>
		</ul>
		<h1>관광지 검색</h1>
	</header>
	<nav>
		<ul>
            <li><a>지역별 검색</a></li>
            <li><a>활동별 검색</a></li>
            <li><a>축제별 검색</a></li>
            <li><a>전체 지도 검색</a></li>
        </ul>
	</nav>
	<aside>
		다른 사진
	</aside>
</body>
</html>
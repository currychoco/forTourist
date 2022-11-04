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
		<img src="https://s3.amazonaws.com/files.d20.io/images/312414451/ZZXwa0gsVbRJZBSXs5D2Ew/max.png" style="width:300px;" class= "home"/>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
	%>
		<div class = "logininfo"> 
			<div class = "log"><a href="loginForm.jsp">로그인</a></div>
        	<div class = "join"><a href="join.jsp">회원가입</a></div>
        </div>
    <%}else{ %>
    	<div class = "logininfo">
    	<span><b><%=id %></b>님 안녕하세요!</span>
    	<button onclick="location.href='logoutPro.jsp'">logout</button>
    	</div>
    <%} %>
		</ul>
		<h1>관광지 검색</h1>
	</header>
			<ul class = "mainMenu">
				<li><a href="">지역 명소는?</a></li>
				<li><a href="">활동 찾기</a></li>
				<li><a href="">축제 찾기</a></li>
				<li><a href="">숙소 둘러보기</a></li>
			</ul>
	<!-- <aside></aside> -->
</body>
</html>
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
		<a href=""><img src="https://s3.amazonaws.com/files.d20.io/images/312414451/ZZXwa0gsVbRJZBSXs5D2Ew/max.png" style="width:300px;" class= "home"/></a>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
	%>
		<div class = "logininfo"> 
<<<<<<< HEAD
			<div class = "log"><a href="login">로그인</a></div>
        	<div class = "join"><a href="user_join.jsp">회원가입</a></div>
=======
			<div class = "log"><a href="login">로그인</a></div>&nbsp; | &nbsp;
        	<div class = "join"><a href="join">회원가입</a></div>
>>>>>>> refs/remotes/origin/#RyuHyeKyoung
        </div>
    <%}else{ %>
    	<div class = "logininfo">
    	<span><b><%=id %></b>님 안녕하세요!</span>
    	<button onclick="location.href='logoutPro.jsp'">logout</button>
    	</div>
    <%} %>
	</header>
			<ul class = "mainMenu">
				<li><a href="area">지역 명소는?</a></li>
				<li><a href="keyword">활동 찾기</a></li>
				<li><a href="festival">축제 찾기</a></li>
				<li><a href="">숙소 둘러보기</a></li>
			</ul>
	<!-- <aside></aside> -->
</body>
</html>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta charset="UTF-8">
<style>
/*
.btn-like {
  color: transparent;
  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
}
.btn-like:hover {
  text-shadow: 0 0 0 #ea0;
}
.btn-like.done {
  color: inherit;
  text-shadow: 0;
}
.btn-like.done:hover {
  color: transparent;
  text-shadow: 0 0 0 #777;
}*/
</style>
<title>Insert title here</title>
</head>
<%
String userId = (String)session.getAttribute("id");
%>
<body>
		<div>
			<div class="w3-border w3-center w3-padding">
				<%if(userId == null){%>
					<button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>
					<% }else{%>					
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count"></span>
					</button> 
				<%} %>
			</div>
		</div>
<script>
$(".btn-like").click(function() {
	$(this).toggleClass("done");
})
</script>
<script src="resources/like.js"></script>

</body>
</html>
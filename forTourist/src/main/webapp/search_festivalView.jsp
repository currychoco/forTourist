<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<div>
			<input type="date" id="date" name="date">
			<button onclick="searchFestival()">search</button>
		</div>
	    <div class='container'>
    	</div>
		<script src = "resources/festivalView.js"></script>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>
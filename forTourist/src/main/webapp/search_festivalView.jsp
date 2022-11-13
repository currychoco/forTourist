<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/festival.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
	<div class="searchrow">
		<span class ="searchdate">
			<input type="date" id="date" name="date" value = "2022-11-06">
			<button class="search_paging_button" onclick="searchFestival()">검색</button>
		</span>
	</div>
	    <div class='container'>
    	</div>
    	<div class="page_form">
	        <button class="back_button search_paging_button" onclick="getDataBack()">이전</button>
	        <button class="next_button search_paging_button" onclick="getDataNext()">다음</button>
    	</div>
		<script src = "resources/festivalView.js"></script>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>
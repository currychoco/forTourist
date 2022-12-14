<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width= device-width, initial-scale=1.0">
     <link rel="stylesheet" href="resources/search_keyword.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  
    <title>Document</title>
</head>

<body>
	<jsp:include page="header.jsp"/>
	
			<h2 style = "text-align:center">활동별 검색</h2>
	<section class="page" style = "text-align:center">
		<span class="searchword" style="text-align: center;">
   			<input type="text" id="keyword"  value="등산"/>
    		<button class="search_paging_button" onclick="searchKeyword()">검색</button>
    	</span>
        <div class="container"></div>
		<div class="button" style="text-align: center;">
        	<button class="back_button search_paging_button" onclick="getDataBack()">이전</button>
        	<button class="next_button search_paging_button" onclick="getDataNext()">다음</button>
    	</div>
    </section>
  	<jsp:include page="footer.jsp"/>
    <!-- 문서의 하단에 위치함 -->
     <script src="resources/search_keyword.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width= device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/searchView.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Document</title>
</head>

<body>
	<header>
      <ul class = "login"> 
          <li class = "log"><a href="">로그인</a>
          <li class = "join"><a href="">회원가입</a>
      </ul>
      <h1>한국 관광 사이트</h1>
    </header>
	
	 <nav>
      <ul>
          <li><a href="">지역별 검색</a></li>
          <li><a href="">활동별 검색</a></li>
          <li><a href="">축제별 검색</a></li>
          <li><a href="">전체 지도 검색</a></li>
      </ul>
    </nav>
    
	<section>
	<div>
		<h2>활동별 검색</h2>
   		<input type="text" id="keyword"/>
    	<button onclick="searchKeyword()">search</button>
    </div>

	<div>
        <button class="back_button" onclick="getDataBack()">back</button>
        <button class="next_button" onclick="getDataNext()">next</button>
    </div>
    
    <table border="1">
    	<thead class="head">
            <tr>
                <th>사진</th>              
                <th>이름</th>              
                <th>주소</th>               
            </tr>
        </thead>
        <tbody class="container">
                
        </tbody>
    </table>
    
    <div class="contentSection">
        <h3>추천검색어</h3>
        <h3>레져</h3>
        <ul class="">
          <li>지상</li>
          <li>수상</li>
          <li>항공</li>
        </ul>  
        <h3>힐링</h3>
          <ul>
          <li>산림욕</li>
          <li>해수욕</li>
          <li>온천</li>
          <li>휴양림</li>
          </ul>
        <h3>야외활동</h3>
          <ul>
            <li>글램핑</li>
            <li>캠핑</li>
            <li>낚시</li>
          </ul>
      </div>
  </section> 
    <!-- 문서의 하단에 위치함 -->
     <script src="resources/search_keyword.js"></script>
</body>

</html>

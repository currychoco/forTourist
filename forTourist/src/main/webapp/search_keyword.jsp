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
   	<link rel="stylesheet" href="resources/css/bootstrap.css">
   	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
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
        <label class="reg" for="leisure">레져 :</label>
    <select id="leisure">
        <optgroup label="지상">
            <option value="ground">승마</option>
            <option value="ground">골프</option>
            <option value="ground">자전거</option>
            <option value="ground">스키</option>
            <option value="ground">썰매</option>
        </optgroup>
        <optgroup label="수상">
            <option value="water">요트</option>
            <option value="water">수상스키</option>
            <option value="water">래프팅</option>
            <option value="water">서핑</option>
            <option value="water">카약</option>
            <option value="water">카누</option>
            <option value="water">보트</option>
            <option value="water">스쿠버다이빙</option>
        </optgroup>
        <optgroup label="항공">
            <option value="sky">패러글라이딩</option>
            <option value="sky">스카이워크</option>
            <option value="sky">번지점프</option>
        </optgroup>
        </select>

        <label class="reg" for="healing">힐링 :</label>
        <select size="4" id="healing" multiple>
            <option value="tree">산림욕</option>
            <option value="sea">해수욕</option>
            <option value="hotWater">온천</option>
            <option value="relax">휴양림</option>
       
        </select>

        <label class="reg" for="outside">야외활동 : </label>
        <select size="3" id="outside" multiple>
            <option value="glamping">글램핑</option>
            <option value="camping">캠핑</option>
            <option value="fishing">낚시</option>
            
        </select>
      </div>
  </section>
  
  <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    Dropdown button
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li>
  </ul>
</div> 


   
    <!-- 문서의 하단에 위치함 -->
     <script src="resources/search_keyword.js"></script>
      <script src="resources/js/bootsrap.bundle.js"></script>
     <script src="resources/js/bootsrap.js"></script>
</body>

</html>

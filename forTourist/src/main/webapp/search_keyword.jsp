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
   			<input type="text" id="keyword"/>
    		<button onclick="searchKeyword()">search</button>
    	</span>
        <div class="container"></div>
		<div class="button" style="text-align: center;">
        	<button class="back_button" onclick="getDataBack()">back</button>
        	<button class="next_button" onclick="getDataNext()">next</button>
    	</div>
    
    </section>
    <!-- </section>
    <div class="contentSection">
        <label class="reg" for="selectbox">레져 :</label>
    <select id="selectbox" name="selectbox" onchange="changeSelect()">
        <optgroup label="--">
            <option value=""selected disabled>--</option>
        </optgroup>
        <optgroup label="지상">
            <option value="승마">승마</option>
            <option value="골프">골프</option>
            <option value="자전거">자전거</option>
            <option value="스키">스키</option>
            <option value="썰매">썰매</option>
        </optgroup>
        <optgroup label="수상">
            <option value="6">요트</option>
            <option value="7">수상스키</option>
            <option value="8">래프팅</option>
            <option value="9">서핑</option>
            <option value="10">카약</option>
            <option value="11">카누</option>
            <option value="12">보트</option>
            <option value="13">스쿠버다이빙</option>
        </optgroup>
        <optgroup label="항공">
            <option value="14">패러글라이딩</option>
            <option value="15">스카이워크</option>
            <option value="16">번지점프</option>
        </optgroup>
        </select>

        <label class="reg" for="healing">힐링 :</label>
        <select size="5" id="healing">
            <option value="0" selected disabled>--</option>
            <option value="17">산림욕</option>
            <option value="18">해수욕</option>
            <option value="19">온천</option>
            <option value="20">휴양림</option>
        </select>

        <label class="reg" for="outside">야외활동 : </label>
        <select size="4" id="outside">
            <option value="0" selected disabled>--</option>
            <option value="21">글램핑</option>
            <option value="22">캠핑</option>
            <option value="23">낚시</option>
            
        </select>
        <button onclick="changeSelect()">search</button>
      </div> -->
  
  
  <!-- <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    Dropdown button
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li> 
  </ul>
</div>  --> 



  	<jsp:include page="footer.jsp"/>
    <!-- 문서의 하단에 위치함 -->
     <script src="resources/search_keyword.js"></script>
</body>
</html>

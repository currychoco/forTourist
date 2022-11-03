<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width= device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Document</title>
</head>

<body>
	<div>
		<h1>키워드 검색</h1>
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
   
    <!-- 문서의 하단에 위치함 -->
     <script src="resources/search_keyword.js"></script>
</body>

</html>

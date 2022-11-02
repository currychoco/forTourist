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
	<h1>키워드 검색</h1>
	<div>
    <input type="text" id="keyword"/>
    <button onclick="searchKeyword()">search</button>
    </div>


	<div>
        <table>
            <tbody class="container">
                <tr>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 문서의 하단에 위치함 -->
     <script src="resources/search_keyword.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <meta name="viewport" content="width= device-width, initial-scale=1.0">
    <!-- 라이브러리 등을 참조하는 경우 , 이곳에 위치-->
    <!-- jpquery문서 : https://api.jquery.com-->
    <!-- google cdn : 에서 가져오기-->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Document</title>
	<link rel="stylesheet" href="resources/search_area.css">
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
    <aside>
            <h2>지역별 검색</h2>
            <button id="key" onclick="clk(this)" value="1">서울</button>
            <button id="key" onclick="clk(this)" value="6">부산</button>
            <button id="key" onclick="clk(this)" value="4">대구</button>
            <button id="key" onclick="clk(this)" value="2">인천</button>
            <button id="key" onclick="clk(this)" value="5">광주</button>
            <button id="key" onclick="clk(this)" value="3">대전</button>
            <button id="key" onclick="clk(this)" value="7">울산</button>
            <button id="key" onclick="clk(this)" value="8">세종</button>
            <button id="key" onclick="clk(this)" value="39">제주도</button>
            <button id="key" onclick="clk(this)" value="31">경기도</button>
            <button id="key" onclick="clk(this)" value="32">강원도</button>
            <button id="key" onclick="clk(this)" value="33">충청북도</button>
            <button id="key" onclick="clk(this)" value="34">충청남도</button>
            <button id="key" onclick="clk(this)" value="35">전라북도</button>
            <button id="key" onclick="clk(this)" value="36">전라남도</button>
            <button id="key" onclick="clk(this)" value="37">경상북도</button>
            <button id="key" onclick="clk(this)" value="38">경상남도</button>
    </aside>
        <section>
            <div style="text-align: center;">
                <button id = "key" class="back_button" onclick="getDataBack()">back</button>
                <button id = "key" class="next_button" onclick="getDataNext()">next</button>
            </div>
            
            <div class="container">

            </div>
        </section>
    <script src="resources/search_area.js"></script>
    <footer>

    </footer>
    </body>

</html>
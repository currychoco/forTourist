<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>Document</title>
</head>
<nav>
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
</nav>
<body>
	<div></div>
	<table border = 1px>
		<thead>
			<tr>
				<th>firstimage</th>
				<th>title</th>
				<th>addr1</th>
				<th>tel</th>
				<th>readcount</th>
				<th>굿스테이</th>
				<th>베니키아</th>
			</tr>
		</thead>
		<tbody class = "container">
			
		</tbody>
	</table>
    <button class = "back_button" onclick="getDataBack()">back</button>
    <button class = "next_button" onclick="getDataNext()">next</button>
	<script src="search_quarters.js"></script>
</body>
</html>
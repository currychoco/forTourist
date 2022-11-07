<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="resources/search_area.css">
    </head>
    <body>
    	<jsp:include page="header.jsp"/>
    	<article>
    <aside>
            <button id="key" onclick="clk(this)" value="1">서울</button>ㅣ
            <button id="key" onclick="clk(this)" value="2">인천</button>ㅣ
            <button id="key" onclick="clk(this)" value="3">대전</button>ㅣ
            <button id="key" onclick="clk(this)" value="4">대구</button>ㅣ
            <button id="key" onclick="clk(this)" value="5">광주</button>ㅣ
            <button id="key" onclick="clk(this)" value="6">부산</button>ㅣ
            <button id="key" onclick="clk(this)" value="7">울산</button>ㅣ
            <button id="key" onclick="clk(this)" value="8">세종</button>ㅣ
            <button id="key" onclick="clk(this)" value="39">제주도</button>ㅣ
            <button id="key" onclick="clk(this)" value="31">경기도</button>ㅣ
            <button id="key" onclick="clk(this)" value="32">강원도</button>ㅣ
            <button id="key" onclick="clk(this)" value="33">충청북도</button>ㅣ
            <button id="key" onclick="clk(this)" value="34">충청남도</button>ㅣ
            <button id="key" onclick="clk(this)" value="35">경상북도</button>ㅣ
            <button id="key" onclick="clk(this)" value="36">경상남도</button>ㅣ
            <button id="key" onclick="clk(this)" value="37">전라북도</button>ㅣ
            <button id="key" onclick="clk(this)" value="38">전라남도</button>
    </aside>
        <section>
            <div class="container">
            </div>
            <div style="text-align: center;">
                <button id = "key" class="back_button" onclick="getDataBack()">back</button>
                <button id = "key" class="next_button" onclick="getDataNext()">next</button>
            </div>
        </section>
    	</article>
    <script src="resources/search_area.js"></script>
    <jsp:include page="footer.jsp"/>
    </body>
</html>
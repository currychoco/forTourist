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
    <header>
        <h2>한국 관광 사이트</h2>
    </header>
    <main>
        <nav>
            <ul>
                <li>지역별 검색</li>
                <li>활동별 검색</li>
                <li>축제별 검색</li>
                <li>전체 지도 검색</li>
            </ul>
        </nav>
        <section>
            <h1>지역별 검색</h1>
            <button id="key" onclick="clk(this)" value="부산광역시">부산</button>
            <button id="key" onclick="clk(this)" value="인천광역시">인천</button>
            <button id="key" onclick="clk(this)" value="서울특별시">서울</button>
            <button id="key" onclick="clk(this)" value="광주광역시">광주</button>
            <button id="key" onclick="clk(this)" value="대구광역시">대구</button>
            <button id="key" onclick="clk(this)" value="대전광역시">대전</button>
            <button id="key" onclick="clk(this)" value="울산광역시">울산</button>
            <button id="key" onclick="clk(this)" value="강원도">강원도</button>
            <button id="key" onclick="clk(this)" value="충청북도">충청북도</button>
            <button id="key" onclick="clk(this)" value="충청남도">충청남도</button>
            <button id="key" onclick="clk(this)" value="전라북도">전라북도</button>
            <button id="key" onclick="clk(this)" value="전라남도">전라남도</button>
            <button id="key" onclick="clk(this)" value="경상남도">경상남도</button>
            <button id="key" onclick="clk(this)" value="경상북도">경상북도</button>
            </section>
        <section>
            <div class="listContainer">
                <div>
                    <strong>구룡소 돌개구멍 (경북 동해안 국가지질공원)</strong>
                    <img src="http://tong.visitkorea.or.kr/cms/resource/77/2614477_image2_1.bmp" alt="구룡소">
                    <p>경상북도 포항시 남구 호미곶면 대동배리</p>
                </div>
            </div>
            <!-- <table border="1">
                <thead class="head">
                    <tr>
                        <th>image</th>
                        <th>title</th>
                        <th>address</th>
                    </tr>
                </thead>
                <tbody class="container">

                </tbody>
            </table> -->
        </section>
    </main>
    <footer>
    </footer>
    </body>
    <script src="resources/search_area.js"></script>
</html>
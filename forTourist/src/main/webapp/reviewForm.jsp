<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href ="resources/review.css">    
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>

    </script>
    <title>Document</title>
</head>
<body>

<%
int contentId = Integer.parseInt(request.getParameter("contentid"));
String img = request.getParameter("firstimg");
<<<<<<< HEAD
//System.out.print(contentId, img)
=======
System.out.println(contentId+ img);
>>>>>>> refs/remotes/origin/#RyuHyeKyoung
%>


    <!-- 헤더 대신 임의로 넣은 것. -->
    <img src="https://s3.amazonaws.com/files.d20.io/images/312414451/ZZXwa0gsVbRJZBSXs5D2Ew/max.png" style="width:300px;" class= "home"/>
    <!-- 이미지 , 가게 이름을 이전 페이지에서 받는다는 것을 전제로 하고 -->
    <!-- ㄴ 리뷰 대상을 눌르고 찾아 들어온 뒤의 페이지이기 때문에 -->
    <article id = "input_review">
        <!-- 이전 페이지에서 받은 이미지정보. 임의로 넣은 이미지는 저희 로고입니다!-->
        
        <div ><img src="<%=img%>"class = "get_img"  id = "get_img" style="width:300px;"/></div>
        <div id = "get_review">
                <input type="date" id="startDate" >
                <!-- 당일치기 체크박스 체크 시 끝날짜 없앨 수 있습니다 -->
                <span>당일치기  <input type="checkbox" id="checkbox" checked="checked"></span>
                <input type="date" id="endDate">
                <!-- <input type="text" id="review" rows="15" cols="50" value => -->
                <textarea id="review" rows="15" cols="50" value =getdate()></textarea>
                <!-- 리뷰 버튼을 누르면 등록될 수 있도록 -->
                <input type="button" value = "리뷰 등록" id="send" onclick="">
        </div>
        <script>
            // 체크박스에 대한 js
        $(document).ready(function() {
            $("input:checkbox").on('click', function() {
                if ( $(this).prop('checked') ) {
                    $('#endDate').hide()
                } else {
                    $('#endDate').show()
                }
            });
        });
        //이하 오류있음. 현재 텍스트 칸에 날짜 자동입력 구현중.
        $("#stareDate").datepicker({
            onSelect: function(dateText) {
                console.log("Selected date: " + dateText + "; input's current value: " + this.value);
            }
        });
        </script>

    </article>
    <!-- 이하 내용은 리뷰가 존재할 시 끌어오는 형식으로 js파일로 .append작성 예정 -->
    <!--  -->
    <article class="reviewd">
        <div class="isreviewd">
            <div id = "postedInfo" style="display: flex">
                <!-- 작성자, 등록일자 등을 한줄에 나오도록 -->
                <div>작성자</div>
                <div>장소/축제이름</div>
                <div>등록일자</div>
                <!-- 작성자 본인이 수정/삭제 가능하도록 버튼공간 -->
                <div>
                    <button>수정</button> |
                    <button>삭제</button>
                </div>
                
            </div>

            <div id = "postedReview">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis itaque ea, distinctio provident nam excepturi minima fugiat maiores. Repudiandae iste suscipit doloremque. Qui neque beatae a, nemo repellat soluta debitis!
                <!-- 입력된 리뷰 택스트를 출력하는 공간 -->
                <!-- <div>리뷰텍스트 </div> -->
            </div>
        </div>
    </article>
    
    
    
    
    <!--  -->
</body>
</html>
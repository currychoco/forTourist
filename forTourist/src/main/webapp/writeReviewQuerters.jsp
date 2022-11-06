<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="forTourist.review.ReviewDto"%>
<%@page import="forTourist.review.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel = "stylesheet" href ="resources/review.css">    
<title>Insert title here</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
int contentId = Integer.parseInt(request.getParameter("contentid"));
String img = request.getParameter("firstimage");
String title = request.getParameter("title");

System.out.println(contentId + img);
ReviewDao dao = ReviewDao.getInstance();
List<ReviewDto> list = new ArrayList<>();
list = dao.getAllReview(contentId);

%>
	<jsp:include page="header.jsp"/>
    <!-- 헤더 대신 임의로 넣은 것. -->
    <!-- 이미지 , 가게 이름을 이전 페이지에서 받는다는 것을 전제로 하고 -->
    <!-- ㄴ 리뷰 대상을 눌르고 찾아 들어온 뒤의 페이지이기 때문에 -->
        <!-- 이전 페이지에서 받은 이미지정보. 임의로 넣은 이미지는 저희 로고입니다!-->
        <ul>
  <!-- <li id = "contentId" hidden='<jsp:element name="contentId"></jsp:element>'>contentId</li> -->	
  	<li style = "padding:20px">리뷰 작성하기</li>
        </ul>

    <article id = "input_review">
        <div><img src="<%=img%>"class = "get_img"  id = "get_img" style="height:200px;"/></div>
        
        <form id = "get_review" >
                <input type="text" id="content" name = "content" style="text-align:left" required>
                <!-- <textarea id="content" name = "content" rows="15" cols="50" style="text-align:left" required></textarea> -->
                <!-- 리뷰 버튼을 누르면 등록될 수 있도록 -->
                <input type="button" value = "리뷰 등록" id="send" onclick="location.href='writeReviewProQuerters.jsp?contentId=<%=contentId%>&firstimage=${firstimage}&content=${content}'">
        </form>

    </article>
    <!-- 이하 내용은 리뷰가 존재할 시 끌어오는 형식으로 js파일로 .append작성 예정 -->
    <!--  -->
    <article class="reviewd">
         <%for(ReviewDto review :list){%>
        		<div class="isreviewd" style="height:200px">
                  	<div id = "postedInfo" style="display: flex">
                      <!-- 작성자, 등록일자 등을 한줄에 나오도록 -->
                      <div><%=review.getUserid()%></div>
                     
					<%if(id.equals(review.getUserid())){ %>
                      <div>
                          <button>수정</button> |
                          <button>삭제</button>
                      </div>
                      <%}%>
                  </div>

                  <div id = "postedReview"><%=review.getContent()%></div>
              </div>
              <%}
              System.out.println("불러왔습니다");%>
    </article>
    
    
    
    	<jsp:include page="footer.jsp"/>
</body>
</html>
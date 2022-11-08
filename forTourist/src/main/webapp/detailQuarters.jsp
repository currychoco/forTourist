<%@page import="forTourist.want.WantDto"%>
<%@page import="forTourist.want.WantDao"%>
<%@page import="forTourist.like.LikeDao"%>
<%@page import="forTourist.like.LikeDto"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/detailArea.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
	<%
 	request.setCharacterEncoding("UTF-8"); 
	response.setCharacterEncoding("utf-8");
	
	int contentId = Integer.parseInt(request.getParameter("contentid"));
	String title = request.getParameter("title");
	String addr1 = request.getParameter("addr1");
	String addr1Encode = URLEncoder.encode(addr1,"utf-8").replaceAll("\\+", "%20");
	String tel = request.getParameter("tel");
	
	LikeDao likeDao = LikeDao.getInstance();
	LikeDto likeDto = null;
	
	WantDao wantDao = WantDao.getInstance();
	WantDto wantDto = null;
 	
	String firstimage = request.getParameter("firstimage");
	String id = (String)session.getAttribute("id");
	likeDto = likeDao.getLikebyTwoId(contentId,id);
	wantDto = wantDao.getWantbyTwoId(contentId,id);
	String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
	String addr1En = URLEncoder.encode(addr1De, "utf-8");
	String url = "/forTourist/detailfestival?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En + "&&firstimage=" + firstimage;
	%>	
	
  <div class="container">
      <div class="content">
        <div class="imgWarp"><img src="<%=firstimage%>" class="img" /></div>
        <div class="title"><%=title%></div>
        <div class="text"><%=addr1%></div>
        <div class="tel"><%=tel%></div>
      </div>
       
      <div class="writeReview">  
       <div class="review">
          <input type="hidden" id="contentId" name="contentId" value=<%=contentId%>>
            <input type="hidden" id="userid" name="userid" value=<%=session.getAttribute("id") %>>
        </div>
        <form method="post" action="/forTourist/writeReviewProQuerters.jsp">
          <input type="hidden" id="contentId" name="contentId" value=<%=contentId%>>
          <input type="hidden" id="title" name="title" value=<%=title%>>
          <input type="hidden" id="addr1" name="addr1" value=<%=addr1Encode%>>
          <input type="hidden" id="firstimage" name="firstimage" value=<%=firstimage%>>
          <input type="hidden" id="tel" name="tel" value=<%=tel%>>
          <textarea required name="content" id="content" rows="3" placeholder="리뷰 작성" required></textarea>
          <input type="submit" value="작성" />
        </form>
    </div>
    <div class = "likeBox">
          	<%
          	if(likeDto!=null){
          	if(!likeDto.isLike()){%>
    		<button class = "like" id ="like" name="like" onclick="likecheck()">like <span>숫자</span></button>
    		<%}else{ %>
    		<button class = "liked" id ="like" name="like" onclick="likecheck()">liked <span>숫자</span></button>
    		<%} 
    		}else{%>
    			<button class = "like" id ="like" name="like" onclick="likecheck()">like <span>숫자</span></button>
    		<%}%>
    		<%
          	if(wantDto!=null){
          	if(!wantDto.isWant()){%>
    		<button class = "want" id ="want" name="want" onclick="wantcheck()">want</button>
    		<%}else{ %>
    		<button class = "wanted" id ="wanted" name="wanted" onclick="wantcheck()">wanted</button>
    		<%} 
    		}else{%>
    			<button class = "want" id ="want" name="want" onclick="wantcheck()">want</button>
    		<%}%>
    </div>
    
    
    
    <div class="updateReview" style="display:none;">
      		  <form method="post" action="updateReviewQuartersPro.jsp">
        	<input type="hidden" id = "contentId" name="contentId" value=<%=contentId %>>
       	   <input type="hidden" id="title" name="title" value=<%=title%>>
          <input type="hidden" id="addr1" name="addr1" value=<%=addr1Encode%>>
          <input type="hidden" id="firstimage" name="firstimage" value=<%=firstimage%>>
          <input type="hidden" id="tel" name="tel" value=<%=tel%>>
        	<input type="hidden" id="no" name="no" value="">
        	<textarea required name="content" id="content" rows="3" placeholder="리뷰 수정" required></textarea>
	            <input type="submit" value="수정">
            </form>    
 	   </div>
    </div>
    	<script src="resources/reviewForQuarters.js"></script>
    	<script src="resources/like.js"></script>
    	<script src="resources/want.js"></script>
	</section>
	<jsp:include page="footer.jsp"/>
<script>
	<%
  	if(likeDto!=null){%>
console.log(<%=likeDto.isLike()%>);
<%}%>
</script>


</body>
</html>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/review.css">
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
	String firstimage = request.getParameter("firstimage");
	
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
    </div>
    	<script src="resources/review.js"></script>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>
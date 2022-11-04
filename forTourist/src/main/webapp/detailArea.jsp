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
	
	int contentId = Integer.parseInt(request.getParameter("contentid"));
	String title = request.getParameter("title");
	String addr1 = request.getParameter("addr1");
	String firstimage = request.getParameter("firstimage");
	
	System.out.println(contentId);
 	System.out.println(title); 
	System.out.println(addr1);
	System.out.println(firstimage);
	%>	
	
	<!-- 원본 -->
	<%-- 	<div class='container'>
			<ol class='content'>
				<li><img src="<%=firstimage%>" class = "img"></li>
				<li><%=title%></li>
				<li><%=addr1%></li>				
			</ol>
		</div>
		<div class="writeReview">
			<form method="post" action="/forTourist/writeReviewProForArea.jsp">
				<input type="hidden" id="contentId" name="contentId" value=<%=contentId %>>`
				<textarea required name="content" id="content" rows="3" placeholder="리뷰 작성" required></textarea>
	            <input type="submit" value="작성">
            </form>
		</div>
		<div class="review">
			<input type="hidden" id="contentId" name="contentId" value=<%=contentId %>>
		</div> --%>
		
		
		<%-- 
		
		<div class='container'>
		
      	<div class="content">
        <div class="imgWarp"><img src="<%=firstimage%>" class="img" /></div>
        <div class="title"><%=title%></div>
        <div class="text"><%=addr1%></div>
      </div>
      
      <div class="writeReview">
        <div class="review">
        <form method="post" action="/forTourist/writeReviewProForArea.jsp">
        
          <input type="hidden" id="contentId" name="contentId" value=<%=contentId"%>>
          <textarea required name="content" id="content" rows="3" placeholder="리뷰 작성" required></textarea>
          <input type="submit" value="작성" />
          </form>
      	</div>
	    </div>
	    </div> --%>
		<!-- <script src="resources/review.js"></script> -->
		
		
		
		
		<!-- 에러 확인중  -->
    <div class="container">
      <div class="content">
        <div class="imgWarp"><img src="<%=firstimage%>" class="img" /></div>
        <div class="title"><%=title%></div>
        <div class="text"><%=addr1%></div>
      </div>
      <div class="writeReview">
        <div class="review">
          <input  type="hidden" id="contentId" name="contentId" value=<%=contentId"%>/>
		</div>
        <div>`
        <form method="post" action="/forTourist/writeReviewProForArea.jsp">
          <input type="hidden" id="contentId" name="contentId" value=<%=contentId"%>>`
          <textarea required name="content" id="content" rows="3" placeholder="리뷰 작성" required></textarea>
          <input type="submit" value="작성" />
        </form>
      </div>
    </div>
    
    
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>
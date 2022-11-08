<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/login.css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="inner">
      <form method="post" action="/forTourist/LoginAction">
      
      <h2>LOGIN</h2>
        <input
          type="text"
          id="id"
          name="id"
          placeholder="아이디를 입력해주세요"
        />
        <input
          type="password"
          id="password"
          name="password"
          placeholder="비밀번호를 입력해주세요"
          required
        />
        <input id="submitBtn" type="submit" value="login" />
      </form>
    </div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
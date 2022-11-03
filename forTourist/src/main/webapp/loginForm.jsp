<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div>
		<form method="post" action="loginFormPro.jsp">
			<input type="text" id="id" name="id">
			<input type="password" id="password" name="password">
			<input type="submit" value="login">
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
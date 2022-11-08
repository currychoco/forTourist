<%@page import="java.util.ArrayList"%>
<%@page import="forTourist.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/join.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	request.setCharacterEncoding("utf-8");

	UserDao dao = UserDao.getInstance();
	int no = dao.getLastNo();
	ArrayList<String> id = new ArrayList<>();
	id = dao.getIdAll();

	for (int i = 0; i < id.size(); i++) {
		System.out.println(id.size());
		System.out.println(id.get(i));
	}
	%>

	<h1>회원가입 폼</h1>
	<div>
		<section>
			<!-- no id password name nickname gender phone resDate 8 -->
			<form method="POST" action="user_joinPro.jsp">
				<table>
					<tr>
						<td id="title"></td>
						<td><input type="hidden" id="no" name="no" value="<%=no%>"
							maxlength="50" readonly>
						<td>
					</tr>
					<tr>
						<td id="title">아이디</td>
						<td><input type="text" id="id" name="id" maxlength="20"
							placeholder="아이디를 입력해주세요.">
						<td>
						<td><button type="button" onclick="id_check();">아이디
								중복확인</button>
						<td>
					</tr>
					<tr>
						<td id="title">비밀번호</td>
						<td><input type="password" id="password" name="password"
							maxlength="20" placeholder="영어 + 숫자 + 특수문자 8자리이상 조합">
						<td>
					</tr>
					<tr>
						<td id="title">비밀번호 재확인</td>
						<td><input type="password" id="passwordCheck"
							name="passwordCheck" maxlength="20"
							placeholder="영어 + 숫자 + 특수문자 8자리이상 조합">
						<td>
					</tr>
					<tr>
						<td id="title">이름</td>
						<td><input type="text" id="name" name="name" maxlength="20"
							placeholder="이름을 입력해주세요.">
						<td>
					</tr>
					<tr>
						<td id="title">닉네임</td>
						<td><input type="text" id="nickname" name="nickname"
							maxlength="20" placeholder="닉네임을 입력해주세요.">
						<td>
					</tr>
					<tr>
						<td id="title">핸드폰</td>
						<td><input type="text" id="phone" name="phone" maxlength="20"
							placeholder="010-xxxx-xxxx">
						<td>
					</tr>
					<tr>
						<td id="title">성별[남/여]</td>
						<td><select id="gender" name="gender">
								<option value="">성별을 선택해주세요.</option>
								<option value="남">남</option>
								<option value="여">여</option>
						</select>
						<td>
					</tr>
					<tr>
						<td id="btnWarp" colspan="2" text-align: center><input
							type="button" onclick="checkForm(form)" value="등록"> <input
							type="button" onclick="location.href='index.jsp'" value="취소">
						</td>
					</tr>
				</table>
			</form>
			<script src="resources/vaildationJoin.js"></script>
		</section>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
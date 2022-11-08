<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="forTourist.util.RequestUtil"%>
<%@page import="forTourist.want.WantDto"%>
<%@page import="forTourist.want.WantDao"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="forTourist.like.LikeDto"%>
<%@page import="forTourist.like.LikeDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// get userid in session
final String userId = (String) session.getAttribute("id");

// get params from body
final int contentId = Integer.parseInt(request.getParameter("contentId"));

// connect db
WantDao dao = WantDao.getInstance();

// 찜 정보가 있는지 체크
WantDto dto = dao.getWantbyTwoId(contentId, userId);

PrintWriter res = response.getWriter();
res.println(new Gson().toJson(dto));
%>
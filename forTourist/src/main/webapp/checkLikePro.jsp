<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="forTourist.like.LikeDto"%>
<%@page import="forTourist.like.LikeDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String userId = (String)session.getAttribute("id");
int contentId = Integer.parseInt(request.getParameter("contentId"));

LikeDao dao = LikeDao.getInstance();

LikeDto dto = dao.getLikebyTwoId(contentId, userId);
List<LikeDto> list = dao.getLikeAllbyContentId(contentId);

Map<String, Object> result = new HashMap<String, Object>();
result.put("count", list.size());
result.put("dto", dto);

PrintWriter res = response.getWriter();
res.println(new Gson().toJson(result));
%>
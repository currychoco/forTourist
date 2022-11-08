<%@page import="forTourist.util.RequestUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="forTourist.like.LikeDto"%>
<%@page import="forTourist.like.LikeDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// result data
Map<String, Object> result = new HashMap<String, Object>();

// get body in request inputStream
String body = RequestUtil.getBody(request);

// get body params in body json
Map<String, String> params = new Gson().fromJson(body, Map.class);

// get userid in session
final String userId = (String) session.getAttribute("id");

// get params from body
final int contentId = Integer.parseInt(params.get("contentId"));

LikeDao dao = LikeDao.getInstance();

LikeDto dto = dao.getLikebyTwoId(contentId, userId);

if(dto != null) { // 좋아요 있으면 삭제
	dao.deleteLike(contentId, userId);
	result.put("msg", "DELETED");
} else { // 좋아요 없으면 등록
	dto = new LikeDto(dao.getLastNo(), contentId, userId);
	dao.createLike(dto);
	result.put("msg", "CREATED");
}

result.put("result", "OK");
PrintWriter res = response.getWriter();
res.println(new Gson().toJson(result));
%>
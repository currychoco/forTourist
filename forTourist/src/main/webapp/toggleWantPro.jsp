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
final String title = params.get("title");
final String addr1 = params.get("addr1");
final String firstimage = params.get("firstimage");

final String url = String.format("/forTourist/detailQuarters?contentId=%d&title=%s&addr1=%s&firstimage=%s"
	, contentId
	, title
	, addr1
	, firstimage);

WantDao dao = WantDao.getInstance();

// 찜 정보가 있는지 체크
WantDto dto = dao.getWantbyTwoId(contentId, userId);

if (dto != null) { // 있으면 찜 해제(찜 데이터 삭제)
	dao.deleteWant(contentId, userId);
	result.put("msg", "DELETED");
} else { // 없으면 찜 등록(찜 데이터 등록)
	dto = new WantDto(dao.getLastNo(), true, contentId, userId, title, url);
	dao.createWant(dto);
	result.put("msg", "CREATED");
}

result.put("result", "OK");
PrintWriter res = response.getWriter();
res.println(new Gson().toJson(result));
%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%


String result="";

//Json데이터
//{"키1": "값1","키2":"값2"}

	JSONArray jarr = new JSONArray();

	JSONObject jobj2 = new JSONObject();
	jobj2.put("title", "볼펜이");
	jobj2.put("start","2020-06-09T16:00:00");
	jobj2.put("end","2020-06-10T16:00:00");
	
	JSONObject jobj = new JSONObject();
	jobj.put("title", "고구마");
	jobj.put("start","2020-07-09T16:00:00");
	jobj.put("end","2020-07-10T16:00:00");
	
	JSONObject jobj1 = new JSONObject();
	jobj1.put("title", "감자");
	jobj1.put("start","2020-07-15T16:00:00");
	
	jarr.add(jobj);
	jarr.add(jobj1);
	jarr.add(jobj2);
	out.println(jarr.toString());


%>
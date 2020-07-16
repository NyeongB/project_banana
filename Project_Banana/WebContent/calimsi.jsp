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



	JSONObject jobj = new JSONObject();
	jobj.put("title", "고구마");
	jobj.put("start","2020-07-09T16:00:00");
	
	out.println(jobj.toString());


%>
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
jobj.put("num",100);
jobj.put("name",name);
jobj.put("content",content);

out.println(jobj.toString());

%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.banana.rent.RPostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>



<c:forEach var="reservationTime" items="${reservationTime }">
${reservationTime.success_date }
</c:forEach>





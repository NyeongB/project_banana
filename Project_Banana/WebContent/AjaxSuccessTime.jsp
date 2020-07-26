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


<%-- <%
JSONArray jarr = new JSONArray();


ArrayList<RPostDTO> successDates = (ArrayList<RPostDTO>)request.getAttribute("reservationTime");



for(int i=0; i<successDates.size(); i++)
{
	JSONObject obj = new JSONObject();
	
	obj.put("success", successDates);
	
	jarr.add(obj);
	
}


out.println(jarr.toString());

%> --%>

<c:forEach var="reservationTime" items="${reservationTime }">
${reservationTime.success_date }
</c:forEach>





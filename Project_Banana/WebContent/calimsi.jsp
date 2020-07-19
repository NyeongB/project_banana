<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	JSONArray jarr = new JSONArray();
%>



<script type="text/javascript">
	
	var lists = ${list };
	
	

	for(var i =0; i<list.length; i++)
	{
			
		
		
		
		
	}

</script>
<%

	out.println(jarr.toString());



%>
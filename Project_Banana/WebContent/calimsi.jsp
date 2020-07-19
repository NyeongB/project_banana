<%@page import="com.banana.groupbuying.GPostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	ArrayList<GPostDTO> list = (ArrayList<GPostDTO>)request.getAttribute("list");
	JSONArray jarr = new JSONArray();
	
	for(int i =0; i<list.size(); i++)
	{
		JSONObject obj = new JSONObject();
		obj.put("title","[시작일]"+list.get(i).getTitle());
		System.out.println(list.get(i).getTitle());
		obj.put("start",list.get(i).getStart_date());
		jarr.add(obj);
		
	}	
	out.println(jarr.toString());
	
%>



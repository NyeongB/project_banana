<%@page import="com.banana.my.ScheduleDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	ArrayList<ScheduleDTO> startEnd = (ArrayList<ScheduleDTO>) request.getAttribute("startEnd");
	ArrayList<ScheduleDTO> bunReci = (ArrayList<ScheduleDTO>) request.getAttribute("bunReci");
	JSONArray jarr = new JSONArray();
	

	
	// 시작일 json 에 넣기
	for(int i =0; i<startEnd.size(); i++)
	{
		JSONObject obj = new JSONObject();
		obj.put("title",startEnd.get(i).getTitle());
		obj.put("start",startEnd.get(i).getStart_date());
		obj.put("desciption",startEnd.get(i).getPost_code());
		obj.put("color","#FFCC4F");
		jarr.add(obj);
		
	}
	// 종료일 json 에 넣기
	for(int i =0; i<startEnd.size(); i++)
	{
		JSONObject obj = new JSONObject();
		obj.put("title",startEnd.get(i).getTitle());
		obj.put("start",startEnd.get(i).getEnd_date());
		obj.put("desciption",startEnd.get(i).getPost_code());
		obj.put("color","#2383ed");
		jarr.add(obj);
		
	}
	// 분배일자 json 에 넣기
	for(int i =0; i<bunReci.size(); i++)
	{
		JSONObject obj = new JSONObject();
		obj.put("title",bunReci.get(i).getTitle());
		obj.put("start",bunReci.get(i).getBun_date());
		obj.put("desciption",bunReci.get(i).getPost_code());
		obj.put("color","#52BF88");
		jarr.add(obj);
		
	}
	// 영수증 첨부일자
	for(int i =0; i<bunReci.size(); i++)
	{
		JSONObject obj = new JSONObject();
		obj.put("title",bunReci.get(i).getTitle());
		obj.put("start",bunReci.get(i).getReceipt_date());
		obj.put("desciption",bunReci.get(i).getPost_code());
		obj.put("color","#ff8fb8");
		jarr.add(obj);
		
	}
	
	out.println(jarr.toString());
	
%>



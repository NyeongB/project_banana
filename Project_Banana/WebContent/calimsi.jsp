<%@page import="com.banana.my.ScheduleDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	int check = (int)request.getAttribute("check");
	JSONArray jarr = new JSONArray();
	
	if(check == 0)
	{
		ArrayList<ScheduleDTO> startEnd = (ArrayList<ScheduleDTO>) request.getAttribute("startEnd");
		ArrayList<ScheduleDTO> bunReci = (ArrayList<ScheduleDTO>) request.getAttribute("bunReci");
		
		
		
		// 시작일 json 에 넣기
		for(int i =0; i<startEnd.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",startEnd.get(i).getTitle());
			obj.put("start",startEnd.get(i).getStart_date());
			obj.put("id",startEnd.get(i).getPost_code());
			obj.put("color","#FFCC4F");
			obj.put("display","list-item");
			jarr.add(obj);
			
		}
		// 종료일 json 에 넣기
		for(int i =0; i<startEnd.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",startEnd.get(i).getTitle());
			obj.put("start",startEnd.get(i).getEnd_date());
			obj.put("id",startEnd.get(i).getPost_code());
			obj.put("color","#2383ed");
			obj.put("display","list-item");
			jarr.add(obj);
			
		}
		// 분배일자 json 에 넣기
		for(int i =0; i<bunReci.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",bunReci.get(i).getTitle());
			obj.put("start",bunReci.get(i).getBun_date());
			obj.put("id",bunReci.get(i).getPost_code());
			obj.put("color","#52BF88");
			obj.put("display","list-item");
			jarr.add(obj);
			
		}
		// 영수증 첨부일자
		for(int i =0; i<bunReci.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",bunReci.get(i).getTitle());
			obj.put("start",bunReci.get(i).getReceipt_date());
			obj.put("id",bunReci.get(i).getPost_code());
			obj.put("display","list-item");
			obj.put("color","#ff8fb8");
			jarr.add(obj);
			
		}
		
	}else
	{
		ArrayList<ScheduleDTO> gBunReci = (ArrayList<ScheduleDTO>) request.getAttribute("gBunReci");
		

		//---------------------------------------------- 참여자 입장
		// 분배일자 json 에 넣기
		for(int i =0; i<gBunReci.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",gBunReci.get(i).getTitle());
			obj.put("start",gBunReci.get(i).getBun_date());
			obj.put("id",gBunReci.get(i).getPost_code());
			obj.put("color","#52BF88");
			obj.put("display","list-item");
			jarr.add(obj);
			
		}
		// 영수증 첨부일자
		for(int i =0; i<gBunReci.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",gBunReci.get(i).getTitle());
			obj.put("start",gBunReci.get(i).getReceipt_date());
			obj.put("id",gBunReci.get(i).getPost_code());
			obj.put("display","list-item");
			obj.put("color","#ff8fb8");
			jarr.add(obj);
			
		}
		
	}
	
	
	
	out.println(jarr.toString());
	
%>



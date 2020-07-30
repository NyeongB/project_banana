<%@page import="com.banana.rent.RPostDTO"%>
<%@page import="com.banana.my.ScheduleDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	System.out.println((int)request.getAttribute("check"));
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
			
			System.out.println(startEnd.get(i).getTitle());
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
		
	}else if(check == 1)
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
		
	}else if(check == 3)
	{
		ArrayList<RPostDTO> schedule = (ArrayList<RPostDTO>) request.getAttribute("schedule");
		
		// 렌트 제공일
		for(int i = 0; i<schedule.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",schedule.get(i).getTitle());
			System.out.println(schedule.get(i).getTitle());
			obj.put("start",schedule.get(i).getStart_date());
			System.out.println(schedule.get(i).getStart_date());
			obj.put("id",schedule.get(i).getR_apply_code());
			obj.put("color","#ff8fb8");
			jarr.add(obj);
		}
		
		// 렌트 회수일
		for(int i = 0; i<schedule.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",schedule.get(i).getTitle());
			obj.put("start",schedule.get(i).getEnd_date());
			obj.put("id",schedule.get(i).getR_apply_code());
			obj.put("color","#52BF88");
			jarr.add(obj);
		}
		
	}else
	{
		ArrayList<RPostDTO> rentSchedule = (ArrayList<RPostDTO>) request.getAttribute("rentSchedule");
		
		// 렌트 제공일
		for(int i = 0; i<rentSchedule.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",rentSchedule.get(i).getTitle());
			System.out.println(rentSchedule.get(i).getTitle());
			obj.put("start",rentSchedule.get(i).getStart_date());
			System.out.println(rentSchedule.get(i).getStart_date());
			obj.put("id",rentSchedule.get(i).getR_apply_code());
			obj.put("color","#ff8fb8");
			jarr.add(obj);
		}
		
		// 렌트 회수일
		for(int i = 0; i<rentSchedule.size(); i++)
		{
			JSONObject obj = new JSONObject();
			obj.put("title",rentSchedule.get(i).getTitle());
			obj.put("start",rentSchedule.get(i).getEnd_date());
			obj.put("id",rentSchedule.get(i).getR_apply_code());
			obj.put("color","#52BF88");
			jarr.add(obj);
		}
		
	}


	
	out.println(jarr.toString());
	
%>



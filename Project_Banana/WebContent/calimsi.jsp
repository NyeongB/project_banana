<%@page import="com.banana.rent.RPostDTO"%>
<%@page import="com.banana.my.ScheduleDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 인코딩 UTF-8로 설정
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	// 사용자 정보 받아오기 
	// check = 0 공동구매 제안자
	// check = 1 공동구매 참여자 
	int check = (int) request.getAttribute("check");
	
	// JSON 배열 생성
	JSONArray jarr = new JSONArray();

	// 공동구매 제안자 입장 일정 불러오기
	if(check == 0)
	{
		// 시작일자, 종료일자 받아오기
		ArrayList<ScheduleDTO> startEnd = (ArrayList<ScheduleDTO>) request.getAttribute("startEnd");
		// 분배일자 ,영수증일자 받아오기
		ArrayList<ScheduleDTO> bunReci = (ArrayList<ScheduleDTO>) request.getAttribute("bunReci");
			
		// 시작일자 JSON객체에 넣기
		for(int i =0; i<startEnd.size(); i++)
		{
			// JSON 객체 생성
			JSONObject obj = new JSONObject();
			
			// 일정 등록을 위한 fullcalendar 속성 설정 
			// 일정 제목 설정
			obj.put("title",startEnd.get(i).getTitle());
			// 일정 시작일 설정(모집 시작날짜)
			obj.put("start",startEnd.get(i).getStart_date());
			// 일정 클릭시 상세정보를 위한 게시물코드 저장
			obj.put("id",startEnd.get(i).getPost_code());
			// 일정 컬러 설정
			obj.put("color","#FFCC4F");
			
			// JSON 배열에 객체 넣기
			jarr.add(obj);			
		}
		
		// 종료일자 JSON객체에 넣기
		for(int i =0; i<startEnd.size(); i++)
		{
			// JSON 객체 생성
			JSONObject obj = new JSONObject();
			
			// 일정 등록을 위한 fullcalendar 속성 설정 
			// 일정 제목 설정
			obj.put("title",startEnd.get(i).getTitle());
			// 일정 시작일 설정(모집 종료날짜)
			obj.put("start",startEnd.get(i).getEnd_date());
			// 일정 클릭시 상세정보를 위한 게시물 코드 저장
			obj.put("id",startEnd.get(i).getPost_code());
			// 일정 컬러 설정
			obj.put("color","#2383ed");
			
			// JSON 배열에 객체 넣기
			jarr.add(obj);			
		}
		
		// 분배일자 JSON객체에 넣기
		for(int i =0; i<bunReci.size(); i++)
		{
			// JSON 객체 생성
			JSONObject obj = new JSONObject();
			
			// 일정 등록을 위한 fullcalendar 속성 설정
			// 일정 제목 설정
			obj.put("title",bunReci.get(i).getTitle());
			// 일정 시작일 설정 (물품 분배날짜)
			obj.put("start",bunReci.get(i).getBun_date());
			// 일정 클릭시 상세정보를 위한 게시물 코드 저장
			obj.put("id",bunReci.get(i).getPost_code());
			// 일정 컬러 설정
			obj.put("color","#52BF88");
			
			// JSON 배열에 객체 넣기
			jarr.add(obj);			
		}
		
		// 영수증 첨부일자 JSON객체에 넣기
		for(int i =0; i<bunReci.size(); i++)
		{
			// JSON 객체 생성
			JSONObject obj = new JSONObject();
			// 일정 제목 설정
			obj.put("title",bunReci.get(i).getTitle());
			// 일정 시작일 설정(영수증 첨부날짜)
			obj.put("start",bunReci.get(i).getReceipt_date());
			// 일정 클릭시 상세정보를 위한 게시물 코드 저장
			obj.put("id",bunReci.get(i).getPost_code());
			// 일정 컬러 설정
			obj.put("color","#ff8fb8");
			
			// JSON 배열에 객체 넣기
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



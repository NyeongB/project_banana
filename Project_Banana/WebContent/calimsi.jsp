<%@page import="java.awt.Color"%>
<%@page import="java.util.Random"%>
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
	
	/*   int r,g,b;
	  Random generator=new Random();
	  r=generator.nextInt(256);      //0~256 사이값이 랜덤으로 선택된다
	  g=generator.nextInt(256);
	  b=generator.nextInt(256);
	  System.out.println(new Color(r,g,b)); */
	
	for(int i =0; i<list.size(); i++)
	{
		JSONObject obj = new JSONObject();
		obj.put("title","[ 종료일 ]"+list.get(i).getTitle());
		System.out.println(list.get(i).getTitle());
		//obj.put("start",list.get(i).getStart_date());
		obj.put("start",list.get(i).getEnd_date());
		obj.put("display","list-item");
		jarr.add(obj);
		
	}	
	out.println(jarr.toString());
	
%>



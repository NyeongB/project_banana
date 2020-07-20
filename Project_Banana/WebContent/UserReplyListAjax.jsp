<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.banana.my.UserReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
/* 	ArrayList<UserReplyDTO> list = (ArrayList<UserReplyDTO>)request.getAttribute("rReplyList");
	
	// 데이터 담을 배열 선언
	JSONArray jarr = new JSONArray();
	
	for(int i =0; i<list.size(); i++)
	{
		JSONObject obj = new JSONObject();
		obj.put("title",list.get(i).getTitle());
		obj.put("reply",list.get(i).getReply());		
		obj.put("reply_list",list.get(i).getReply_like());
		obj.put("reply_list",list.get(i).getwDate());
		jarr.add(obj);
	
	}
	
	out.print(jarr.toString());	 */

%>
<div id="rReplyLists">
	<c:forEach var="rReplyLists" items="${rReplyList }" varStatus="status">
		<tr>
			<td>${status.count }</td>									
			<td>${rReplyLists.title }</td>
			<td>${rReplyLists.reply }</td>
			<td>${rReplyLists.wDate }</td>
			<td>${rReplyLists.reply_like }</td>
			<td>
			<div class="btn-group" role="group">
	
			<button class="btn btnDefault" type="button" id="openModalBtn">
				<span class=""></span> 댓글 삭제
			</button>
			
			</div>
			</td>
		</tr>
	</c:forEach>	

</div>
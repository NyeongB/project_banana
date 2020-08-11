<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	
	 System.out.println("ajax확인");
	 SimpleDateFormat format = new SimpleDateFormat("y-m-d");
     
	 String sdate = request.getParameter("sdate");
	 String edate = request.getParameter("edate");
	 
	 // String을 Date로 바꿔 연산하기
	 Date sDate = format.parse(sdate);
	 Date eDate = format.parse(edate);
	 
	 long calDate = eDate.getTime() - sDate.getTime();
	 
	 long calDateDays = calDate / (24*60*60*1000);

	 // 음수일 경우 양수로 변환
	 calDateDays = Math.abs(calDateDays);
	 
	 System.out.println(calDateDays);
%>
<c:forEach var="rpostDetail" items="${rpostDetail }">
${rpostDetail.cost } * calDateDays + ${rpostDetail.deposit}

</c:forEach>


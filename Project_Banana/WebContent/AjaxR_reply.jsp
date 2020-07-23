<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<c:forEach var="rreplyList" items="${rreplyList }">
	<div>
		<div>${rreplyList.nickname }</div>
		
		<div class="form-inline">
		<div>${rreplyList.reply }</div> <div class="text-right">${rreplyList.wdate }</div>
		</div>
	</div>
	<hr>
</c:forEach>


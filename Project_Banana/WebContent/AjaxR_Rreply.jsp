<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!-- 대댓글 뿌려주기!! userrentdetail l_level 확인 후 1이면 페이지에서  화살표 넣어주기 -->
<c:forEach var="rreplyList" items="${rreplyList }">
					<div>
						<div class="form-inline">
						<div class="col-md-10">${rreplyList.nickname }</div><div class="col-md-2 text-right">${rreplyList.wdate }</div>
						</div>
		
						<div id="Rreply">${rreplyList.reply }</div> 
						<div class="form-inline text-right">
						<div class="col-md-9"></div>
						<div class="col-md-1" id="rreplyinsert">댓글달기</div>
						<div class="col-md-1">좋아요</div>
						<div class="col-md-1">신고하기</div>
						</div>
					</div>
					<hr>	
					
</c:forEach>


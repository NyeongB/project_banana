<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<c:forEach var="itemDetails" items="${itemDetail }" varStatus="status">
		<li><img id="itemImg" src=" ${itemDetails.photo }" alt="" class="img-thumbnail"/></li>
		<li>[ 글 제목   ] : ${itemDetails.title }</li>
		<li>[ 모집기간  ] : ${itemDetails.start_date } - ${itemDetails.end_date } </li>
		<li>[ 분배 장소 ] : ${itemDetails.loc_name }</li>
		<li>[ 인원현황  ] : ${itemDetails.count+1 }/${itemDetails.member_num }</li>
</c:forEach>

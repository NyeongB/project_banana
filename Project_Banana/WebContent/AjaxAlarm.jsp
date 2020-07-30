<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:forEach var="dto" items="${list }">	
	<li class="text1">[${dto.alarm_head_type }]  ${dto.sdate }</li>
	<li class="text1"><a href="${dto.url }"><span class="text1"><!-- <i class="fas fa-star"></i> --> &#128155; ${dto.alarm_content_type }</span></a></li>
	<hr>
	</c:forEach>

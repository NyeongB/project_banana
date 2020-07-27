<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:forEach var="dto" items="${list }">
<li><a href="${dto.url }">유형 : ${dto.alarm_head_type }/ 내용 : ${dto.alarm_content_type } / ${dto.sdate }</a></li>
<hr>
</C:forEach>
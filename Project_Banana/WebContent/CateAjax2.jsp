<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="cateListAjax">
<table id="tblCount">
<c:forEach var="list" items="${postMCateList }">
	<tr>
		<td name= "${list.g_cate_code }" id="${list.g_cate_code }" onclick="cateFinal(this)">${list.cate_name }</td>
	</tr>
</c:forEach>
</table> 
</div>

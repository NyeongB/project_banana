<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="cateListAjax">
<table id="tblCount">
<c:forEach var="list" items="${postMCateList }">
	<tr>
		<td onclick="cateFinal(this)"  id="${list.r_cate_code }" >${list.cate_name }</td>
	</tr>
</c:forEach>
</table> 
</div>

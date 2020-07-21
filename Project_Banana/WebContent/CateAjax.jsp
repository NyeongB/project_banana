<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="cateListAjax">
<table>
<c:forEach var="list" items="${postCateList }">
	<tr>
		<td onclick="mCate(this)" id="${list.g_cate_code }">${list.cate_name }</td>
	</tr>
</c:forEach>
</table> 
</div>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="indexListAjax"> 
<select name="selectLoc2" id="selectLoc2" class="form-control">
<c:forEach var="list" items="${locList2 }">

	<option value="${list.loc_code }">${list.loc_name }</option>


</c:forEach>
</select>
</div>


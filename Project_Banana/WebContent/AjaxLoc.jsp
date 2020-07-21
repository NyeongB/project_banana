<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:forEach var="userLoc" items="${userlocation }">
	${userLoc.locname1 } ${userLoc.locname2 }
	
	</c:forEach>

</div>
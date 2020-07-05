<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BANANA401</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="icon" href="images/favicon.ico" />
</head>
<body>
	<div>
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
	<div id="content">

	</div>
	
	<div>
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>
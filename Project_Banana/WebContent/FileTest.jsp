<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banana</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			$("#submitForm").submit();
		});
	});
	
</script>

</head>
<body>
<!-- Header  -->

<!-- content  -->

<div class="container-fluid">

<form action="filetest.action" method="post" id="submitForm" enctype="multipart/form-data">
<input type="file" name="upload">
<input type="text" name="text">

<button type="button" id="submitBtn">보내기</button>
</form>
</div>


<!-- content end -->

<!-- footer  -->
</body>
</html>
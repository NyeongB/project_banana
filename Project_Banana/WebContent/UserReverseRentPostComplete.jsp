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


</head>
<body>
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12">
      <jsp:include page="Header.jsp"></jsp:include>   
   </div>
</div>

<!-- content  -->

<div class="container-fluid">

<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				
					<jsp:include page="MenuUser.jsp"></jsp:include>   
				
				</div>
				<div class="col-md-8" style="padding-top: 170px;">
					<h1 class="text-center">
						 글 작성이 완료되었습니다.
					</h1>
					<br /><br />
					<div style="text-align: center;">
					<button type="button" class="btn btn-success">
						홈으로 이동
					</button>
					<button type="button" class="btn btn-success">
						역렌트 목록으로 이동
					</button>
					</div>
					
					
				</div>
				
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>


</div>


<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>
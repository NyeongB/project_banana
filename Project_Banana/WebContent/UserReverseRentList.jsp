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
				<div class="col-md-8">
				<div>
					<h3>역렌트 신청 현황</h3>
					<hr>
				</div>
				
				<div class="panel panel-primary"><!-- panel -->
				
				
				<div class="row">
				<div class="col-md-2"><!-- 사진 -->
				
				<img alt="Bootstrap Image Preview"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTzDMtEOltBIDuq-dRjaOstZ67y2lPrLX2e_w&usqp=CAU"
								style="width: 150px; height: 150px; text-align: center;">
				
				</div><!-- 사진끝 -->
				<div class="col-md-8"><!-- 센터 -->
				
				<div class="panel-body">
				  	  Panel content
				  	</div>
				  	
				 
				
				</div><!-- 센터끝 -->
				<div class="col-md-2"><!-- 버튼시작 -->
				
				<div class="btn-group" role="group">

					<button class="" type="button">
						<span class=""></span> 수락
					</button>
									
				</div>
				
				<div class="btn-group" role="group">

					<button class="" type="button">
						<span class=""></span> 수락
					</button>
									
				</div>
				
				</div><!-- 버튼끝 -->
				</div>
				
				
				
				  	
				  	
				</div><!-- end panel -->
				
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>

<!-- container-fluid end -->



<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>
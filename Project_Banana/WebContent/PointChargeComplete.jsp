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
<title>PointChargeComplete.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

.center-block
{
	display: block;
	margin-top : 200px;
	
	
}	

h2
{
	font-weight: bold;
	font-size: 40px;
}

.pointBtn
{
	margin-top: 80px;
}


#chargemore
{
	margin-left: 20px;
}

#mainback
{
	margin-right: 20px;
}

#mainback, #chargemore
{
	width: 150px;
	height: 50px;
	font-weight: bold;
    font-size: 20px;
	
}


</style>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#mainback").click(function()
		{
			$(location).attr("href", "main.action");
		});
		
		$("#chargemore").click(function()
		{
			$(location).attr("href", "pointchargepage.action");
		});
	});


</script>

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

<div class="content">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="center-block text-center">
							<div class="col-md-12">
								
									<h2>포인트 충전을 완료했습니다.</h2>
  								</div>
									
																	
							<div class="col-md-12 pointBtn">
								    <button class="btn btn-primary" type="button" id="mainback" href="">메인으로 가기</button>
								    <button class="btn btn-primary" type="button" id="chargemore" >충전 더하기</button>
  								</div>
								
										
  									
		
							</div> <!-- end center-block -->
						</div>  <!-- col-md-8 end -->
					</div> 
					
					
					<div class="col-md-2"></div>
				</div> <!-- end col-md-12 -->
			</div> <!-- end content -->
</div> <!-- end container-fluid -->









<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>
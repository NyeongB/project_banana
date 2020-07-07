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
<style type="text/css">
body
{
	background-color: #fffcf4;
}

img
{
	width: 40px;
	height: 40px;
}

strong
{
	font-size: 25px;
	
}

span
{
	color: var(--back-color);
	font-weight: bold;
	font-size: 20px;
	
}

.myBaName
{
	margin-top: 80px;
	margin-bottom: 20px;
}

.center-block
{
	display: block;
	
	padding-top : 20px;
	background-color: #faedd8;
	width: 100%;
	height: 400px;
	
	border-radius: 30px;
	padding-top: 60px;
	padding-left: 20px;
}




.middle
{
	text-align: left;
}

.box
{
	width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
  	
}


.profile
{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.rating
{
	margin-left: 20px;
}

.progress
{
	
	width: 85%;
}




</style>

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
		<div class="col-md-3"></div>
		
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12 text-center myBaName"> 
					<p><strong>바나나</strong> 님의  &nbsp;<span>My Banana</span> <img src="images/banana_icon.png"></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 center-block">
					<div class="row">
					
						<div class="col-md-12">
						<div class="col-md-1"></div>
						<!-- 프로필 사진 -->
						<div class="col-md-4 box">
							
							<img alt="" src="images/oz.jpg" class="profile">
						
						</div>
						<!-- end 프로필 사진 -->
						<div class="col-md-1"></div>
						
						
						<div class="col-md-6 rating">
						
						<!-- 활동등급 -->
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-4">
									활동등급
									</div>
									<div class="col-md-4 middle">
									 <img src="images/banana_icon4.png">
									 </div>
									 <div class="col-md-4">
									<button type="button" class="btn btn default">친구하기</button>
									</div>
								
								</div>
							</div>
						<!-- end 활동등급 -->	
							
							
							
							<!-- 신용등급 -->
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-4">
									
									신용등급  
									</div>
									<div class="col-md-4 middle">
									88<small>Brix / 100</small>
									</div>
									<div class="col-md-4"></div>
								</div>
							</div>
							<!-- end 신용등급 -->
							
							
							<!-- 프로그래스 바 -->
							<div class="row">
								<div class="col-md-12">
								
								<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="88" aria-valuemin="0"
									aria-valuemax="100" style="width: 88%">
									
								</div>
							</div>
								
								</div>
							</div><!-- end 프로그래스 바 -->
						</div>
					</div>
				</div>	
					
					<div class="row">
						<div class="col-md-12">
							<b>바나나</b>님의 후기
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
					
					
					
				</div>
			</div>
		</div>
		<div class="col-md-3">
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
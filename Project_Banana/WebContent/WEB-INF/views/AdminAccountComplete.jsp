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
<title>AdminReportComplete</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">

<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

*
{
	text-align: center;
}

.center-block
{
	display: block;
	margin-top : 100px;
	background-color: black;
	height: 200px;

	display: block;
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	padding-top : 20px;
	background-color: #f4f4f4;
	width: 50%;
	height: 330px;
	margin-bottom: 80px;	
	border-radius: 30px;
	
}	

.comfirm_logo h2
{
	margin-top : 80px;
	font-weight: bold;
	font-size: 40px;
	color: #FFCC4F;
}


img
{
	width: 50px;
	margin-bottom: 40px;	
	margin-top: 40px;
}

p
{
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 50px;
}

#backhome
{
	font-weight: bold;
}


</style>


</head>




<body>
<!-- Header  -->
	<div class="row Header">
		<div class="col-md-12">
		</div>
	</div>
	
	<div class="col-md-12">
		<h2 class="comfirm_logo">Banana</h2>
	</div>
<!-- content  -->

<div class="container-fluid">
	<div class="content">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<div class="center-block">
							<div class="col-md-12">
								<div class="text-center">
									<img alt="Bootstrap Image"
									src="images/banana_icon.png" >
									<p>"임효림님의 관리자 계정이 생성되었습니다."</p>
									
								    <button class="btn btn-primary" type="button" id="">메인으로</button>
  									
								</div>

							</div> 
						</div> <!-- end center-block -->
					</div>  <!-- col-md-8 end -->
					
					
					<div class="col-md-2"></div>
				</div>
			</div>  <!-- end col-md-12 -->
	</div> <!-- end content -->
</div> <!-- end container-fluid -->









<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
   </div>
</div>
</body>
</html>
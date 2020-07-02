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
<title>SignUpComplete.jsp</title>
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
/*	display: block;
	margin-top : 100px;
	background-color: black;
	height: 200px;
*/
display: block;
	margin-top: 80px;
	margin-left: auto;
	margin-right: auto;
	background-color: #f4f4f4;
	width: 100%;
	height: 650px;
	margin-bottom: 80px;	
	
}	

h1
{
	margin-top : 20px;
	font-weight: bold;
	font-size: 40px;
}

p
{
	margin-top:  
 }

</style>


</head>




<body>
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12 text-center">
     <h1>Banana</h1>
   </div>
</div>

<!-- content  -->

<div class="container-fluid">

<div class="content">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="center-block">
							<div class="col-md-12">
								<div class="page-header text-center">
									<img alt="Bootstrap Image"
									src="images/icons8-bing-50.png">
									<h1>"회원가입이 완료되었습니다."</h1>
								</div>

									
																	
							<div class="col-md-12 backhome">
								    <button class="btn btn-primary" type="button" id="backhome">홈으로 돌아가기</button>
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
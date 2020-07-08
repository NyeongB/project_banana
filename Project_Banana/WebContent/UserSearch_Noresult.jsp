<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

.rentNav
{
	margin-top: 40px;
	margin-left: 200px;
	font-size: 20px;
	font-weight: bold;
}

.empty-block
{
	margin-top: 200px;
	height: 300px;
	display: block;
	
}

#rent1 
{
	margin-right: 30px;
}

.noresult
{
	color: #d00926;
	font-size: 60px;
	font-weight: bold;
}

.Ad
{

	width: 500px;
	height: 150px;
	background-color: #e6e6e6;
	margin-top : 50px;
	
}

.floating 
{ 
	position: fixed; 
	right: 50%; 
	top: 180px; 
	margin-right: -720px; 
	text-align:center; 
	width: 130px; 
	height: 120px;
	background-color: var(--back-color);
	border-radius: 10%;
	margin-top: 5px;
}

.thick
{
	margin: 5px;
	color: var(--text-color);
}

.lastest_img
{
	width:80px;
	margin: 5px;
}

*
{
	font-size: 20px;
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



<div class="container-fluid">
	<div class="row">
	
		
					<div class="row">
					<div class="col-md-12 rentNav">

							<!-- 없다ㅏ에대한 검색 결과 0 개 -->

						</div>
					</div>
				
	
	
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
		
		
			
				
				
			
			<div class="row">
				<div class="col-md-12 empty-block text-center">
				  
				  <p><span class="noresult">없다아ㅏ</span><br>에 대한 검색결과가 없습니다.</p>
						
				
				</div>
			</div>
			
			
			<div class="row">
				
				
				<div class="col-md-12 Ad">
								<div class="col-md-3"></div>
								<div class="col-md-6 block text-center" >광고배너</div>
								<div class="col-md-3"></div>
							</div>
				
				
			</div>
			
			
			
			
			
			
		</div> <!-- end col-md-6 -->
		
		<div class="col-md-3">
			
			<div class="floating">
				<div><span  class="thick">최근게시물</span></div>
				<div><img src="images/oz.jpg" class="lastest_img img-rounded"></div>
				<div><button class="btn">▲</button><button class="btn">▼</button></div>
			</div>

		
		</div>
	</div>
</div> <!-- end container-fluid -->


<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>

</body>
</html>
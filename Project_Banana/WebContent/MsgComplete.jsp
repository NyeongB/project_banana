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

h2
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

<!-- content  -->

<div class="container-fluid">
	<div class="content">
			<div class="col-md-12">
				<div class="text-center">
					<img alt="Bootstrap Image"
					src="images/banana_icon.png" >
					<p>"쪽지를 보냈습니다."</p>									
				</div>
			</div> 
		</div> 
	</div>  
					
					
		

<!-- content end -->

</body>
</html>
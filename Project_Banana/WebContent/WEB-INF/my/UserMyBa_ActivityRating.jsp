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
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">

*
{
	font-size: 16px;
}

.score1
{
	font-size: 30px;
	font-weight: bold;
}

.score2
{
	color: var(--hover-color);
	font-size: 18px;
	font-weight: bold;
}

#green
{
	width: 50px;
	height: 55px;
	margin-left: 90px;
}

#bana1
{
	width: 40px;
	height: 40px;
	margin-left: 110px;
}

#bana2
{
	width: 70px;
	height: 55px;
	margin-left: 80px;
}

#bana3
{
	width: 60px;
	height: 55px;
	margin-left: 75px;
}

#bana4
{
	width: 80px;
	height: 55px;
	margin-left: 70px;
}

#banatree 
{
	width: 40px;
	height: 40px;
	margin-left: 220px;
}

#userrating
{
	width: 80px;
	height: 55px;
	margin-left: 20px;
}

.activity
{
	margin-top : 20px;
	margin-left: 70px;
	margin-bottom: 60px;
}

ins
{
	font-size : 20px;
	font-weight: bold;
}


.center-block
{
	display: block;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	
	/*padding-top : 40px;
	padding-left : 40px;*/
	
	padding : 40px 40px 40px 40px;
	
	
	background-color: #f4f4f4;
	width: 70%;
	height: 500px;
	margin-bottom: 50px;	
	border-radius: 30px;
}

</style>


</head>
<body>
	<!-- Header  -->
	<div class="row Header">
		<div class="col-md-12">
			<jsp:include page="../../Header.jsp"></jsp:include>
		</div>
	</div>

	<!-- content  -->

	<div class="container-fluid">
		<div class="content">
			<div class="col-md-2">
				<jsp:include page="../../MenuUser.jsp"></jsp:include>
			</div>
			<!-- 왼쪽 MenuUser end  -->

			<div class="col-md-8">
				<div>
					<h3>개인 활동 등급</h3>
					<hr>
				</div>
				
				<div class="row">
					<div class="col-md-12 activity">			
						<h2 class="thick">${nickName } 님</h2> <p>활동등급 &nbsp;&nbsp;: ${grade }</p>
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-12 text-center">	
						<p><span class="score1">${sum }</span>점</p>
						<p>다음 등급인 <span class="score2">${nextGrade }</span>까지 <span class="score2">${leftPoint }</span>점 남았습니다.</p>
					</div>
				</div><br>
				
				<div class="center-block text-center">
							<div class="col-md-12 ">

									<h4>○ 활동 등급 안내</h4><br>
									<p>▶ 초록 바나나 한 송이 : 회원 가입 ~ 1,000점   		<img alt="" src="images/bananagreen_icon.png" id="green"></p>
									<p>▶ 노란 바나나 한 송이 : 1,001점 ~ 5000점    		<img alt="" src="images/banana_icon.png" id="bana1"></p>
									<p>▶ 노란 바나나 두 송이 : 5,001점 ~ 12,000점   	<img alt="" src="images/banana_icon2.png" id="bana2"></p>
									<p>▶ 노란 바나나 세 송이 : 12,001점 ~ 22,000점	<img alt="" src="images/banana_icon3.png" id="bana3"></p>
									<p>▶ 노란 바나나 네 송이 : 22,001점 ~ 37,000점	<img alt="" src="images/banana_icon4.png" id="bana4"></p>
									<p>▶ 바나나 나무 : 37,001점 ~					<img alt="" src="images/bananatree_icon.png" id="banatree"></p>
							
								
							</div> 
						</div>
				
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>

	<!-- content end -->

	<!-- footer  -->
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="../../Footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
				
				
				
				
				
				

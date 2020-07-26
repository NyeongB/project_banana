<%@ page contentType="text/html; charset=UTF-8"%>
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

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!--<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>-->

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font: 17px 'Nanum Gothic', sans-serif;
}

.bxslider ul {
	width: 700px;
	
}


li {
	list-style: none;
}

.form-inline {
	margin-bottom: 20px;
}

#allCheck, #selectDelete {
	margin-left: 10px;
}
</style>
<script src="script/script.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$('.bxslider').bxSlider(
		{
			auto : true, // 자동으로 애니메이션 시작
			speed : 500, // 애니메이션 속도
			pause : 3000, // 애니메이션 유지 시간 (1000은 1초)
			mode : 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
			autoControls : false, // 시작 및 중지버튼 보여짐
			pager : true, // 페이지 표시 보여짐
			captions : true, // 이미지 위에 텍스트를 넣을 수 있음
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

		<!-- content  -->
		<div class="content">
			<div class="col-md-2"></div>
			<!-- 왼쪽 MenuUser end  -->


			<div class="col-md-8">
				<ul class="bxslider">
					<li><a href="#"><img
							src="https://thumbnail8.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_c233b4a0-95b3-4481-b578-b62b75850dfd.jpg"
							alt="" ></a></li>
					<li><a href="#"><img
							src="https://thumbnail6.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_5388d7d5-6f13-434b-937e-f81ef1f9c370.jpg"
							alt=""></a></li>
					<li><a href="#"><img
							src="https://static.coupangcdn.com/ma/cmg_paperboy/image/1595402468204/C1_PC1%2820%29.jpg"
							alt="" ></a></li>
							
					<li><a href="#"><img
					src="https://thumbnail6.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_e1a80f94-7610-4a37-80b3-434766555d22.jpg"
					alt="" ></a></li>
				</ul>


			</div>
			<!-- col-md-8 end -->

			<div class="col-md-2"></div>

		</div>
		<!-- content end -->

		<!-- 페이징 바 -->


	</div>
	<!-- container-fluid end -->


	<!-- footer  -->
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>


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

@font-face 
{ 
	font-family: 'yg-jalnan';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
	font-weight: normal; 
	font-style: normal; 
 }
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: 'GmarketSansLight';
	/* font: 17px 'Nanum Gothic', sans-serif; */
}

.bxslider  {
	width: 700px;
	
}


li {
	list-style: none;
}

.form-inline {
	margin-bottom: 18px;
}

#allCheck, #selectDelete {
	margin-left: 10px;
}

.introduce
{
	width: 100%;
	background-color: #fff5d9;
	height: 450px;
	display: flex;
	justify-content: center;
	align-items: center;

}


.content_menu
{
	display:flex;
	align-self: flex-end;
		
}
.content_menu button
{

	padding-top: 20px;
	padding-bottom: 20px;
	border-radius: 10px;
	text-align: center;
	vertical-align: center;		
	margin: 5px;	
	font-size: 13pt;
	font-weight: bold;	
	color: var(--text-color);
	line-height: 5px;

}
.point_area
{
	width: 80%;
	height: 300px;
	background-color: #fff5d9;

}
.point_image
{
	margin: 30px;

}
</style>
<script src="script/script.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$('.bxslider').bxSlider(
		{
			auto : true, // 자동으로 애니메이션 시작
			speed : 1000, // 애니메이션 속도
			pause : 30000, // 애니메이션 유지 시간 (1000은 1초)
			mode : 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
			autoControls : false, // 시작 및 중지버튼 보여짐
			pager : true, // 페이지 표시 보여짐
			captions : true, // 이미지 위에 텍스트를 넣을 수 있음
		});
	});
	
	function goGonggu()
	{
		
		location.href="g_main.action";
		
	}
	
	
	function goReng()
	{
		
		location.href="r_main.action";
		
	}
	
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
			<div class="col-md-1"></div>
			<!-- 왼쪽 MenuUser end  -->


			<div class="col-md-10">
				<!-- 
					<div class="col-md-12 introduce">
						<div class="text-center content">
							<p class="thick" style="/* color:var(--hover-color); */">" 바나나 서비스를 통해 이웃과 나눠보세요 "</p>
							<img src="images/banana_1.png" style="width:300px; height: 280px;" alt="" />
							<div class="form-group form-inline content_menu">
								<button class="btn form-control thick" onclick="goGonggu()">공동구매 하러가기</button>
								<button class="btn form-control thick" onclick="goReng()">렌트 하러가기</button>					
							</div>
								
						
						</div>
					</div> -->
					
					
						
				<div class="col-md-12">
					<ul class="bxslider">
						<li><a href="#"><img  style="width:100%; height: 450px;"
								src="https://thumbnail8.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_c233b4a0-95b3-4481-b578-b62b75850dfd.jpg"
								alt="" ></a></li>
						<li><a href="#"><img  style="width:100%; height: 450px;"
								src="https://thumbnail6.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_5388d7d5-6f13-434b-937e-f81ef1f9c370.jpg"
								alt=""></a></li>
						<li>
							<div class="col-md-12 introduce">
						<div class="text-center content">
							<p class="thick" style="/* color:var(--hover-color); */">" 바나나 서비스를 통해 이웃과 나눠보세요 "</p>
							<img src="images/banana_1.png" style="width:300px; height: 280px;" alt="" />
							<div class="form-group form-inline content_menu">
								<button class="btn form-control thick" onclick="goGonggu()">공동구매 하러가기</button>
								<button class="btn form-control thick" onclick="goReng()">렌트 하러가기</button>					
							</div>
								
						
						</div>
					</div>
									
						
						</li>
								
						<li><a href="#"><img style="width:100%; height: 450px;"
						src="https://thumbnail6.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_e1a80f94-7610-4a37-80b3-434766555d22.jpg"
						alt="" ></a></li>
					</ul> 
				</div>
				
				<div class="col-md-12">
						<div class="col-md-4">
							<div class="col-md-12">
								<h3 class="thick">포인트 충전</h3>
								<div class="point_area text-center">
									<img src="images/banana_icon.png"  style=" height: 50px; alt="" class="point_image" />
									<h3 class="thick"> 포인트 충전을 통해 </h3>
									<h3 class="thick">바나나 서비스를 이용해보세요</h3>
									<form action="<%=cp%>/pointchargepage.action"><button class="btn" >포인트 충전하러가기</button></form>
									
								</div>
							
							</div>
						
						</div>
						<div class="col-md-8 notice-area">
							<h3 class="thick">공지사항</h3>
							<table class="table">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성일</th>
								</tr>
							<c:forEach var="lists" items="${list }">
								<tr>
									<td>${lists.rnum }</td>
									<td>${lists.title }</td>
									<td>23</td>
									<td>${lists.wdate }</td>
								</tr>
							</c:forEach>								
							</table>
						
						</div>
					</div>
				
				
			</div>
			<!-- col-md-8 end -->

			<div class="col-md-1"></div>

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


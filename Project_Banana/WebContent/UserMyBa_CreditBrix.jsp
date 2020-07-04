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
* {
	font-size: 16px;
}

.Brix1 {
	font-size: 30px;
	font-weight: bold;
}

strong {
	font-weight: bold;
	font-size: 20px;
}

.credit {
	margin-top: 20px;
	margin-left: 70px;
	margin-bottom: 60px;
}

ins {
	font-size: 20px;
	font-weight: bold;
}

.center-block {
	display: block;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	/*padding-top : 40px;
	padding-left : 40px;*/
	padding: 40px 40px 40px 40px;
	background-color: #f4f4f4;
	width: 70%;
	height: 300px;
	margin-bottom: 50px;
	border-radius: 30px;
}

.progress
{
	margin-top : 20px;
	margin-left : auto;
	margin-right : auto;
	width: 40%;
}

.col-md-6>p
{
	margin-left: 420px;
	font-size: 15px;
}

h5
{
	margin-left: 50px;
}

h5>span
{
	margin-left: 390px;
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
		<div class="content">
			<div class="col-md-2">
				<jsp:include page="MenuUser.jsp"></jsp:include>
			</div>
			<!-- 왼쪽 MenuUser end  -->

			<div class="col-md-8">
				<div>
					<h3>개인 신용 등급(당도)</h3>
					<hr>
				</div>

				<div class="row">
					<div class="col-md-12 credit">
						<p>
							<ins>바나나</ins>
							님의 신용등급
						</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 text-center">
						<p>
							<span class="Brix1">88</span><strong>Brix</strong> / 100
						</p>

					</div>
					<!-- end text-center 신뢰도 점수-->
					<br>
					<br>

					<div class="row">
						<div class="col-md-12">
							<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="88" aria-valuemin="0"
									aria-valuemax="100" style="width: 88%">
									
								</div>
								
							</div>
							<div class="col-md-3"></div>
							<div class="col-md-6">
							<h5>0<span>100</span></h5>
							<p>단위 Brix</p>
							</div>
							<div class="col-md-3"></div>
						</div>
						
						
					</div> <!-- end progress -->
					


					<div class="center-block">
						<div class="col-md-12">

							<h4>○ 신용 등급 안내</h4>
							<br>
							<p>▶ 회원 가입 시 : 0점</p>
							<br>
							<p>- 신용등급은 거래에 대한 신뢰도를 나타내는 것으로 거래 후 리뷰 작성을 통한 평점을 통해 계산된다.
							<p>- 리뷰의 별 반개는 10점이며, 거래 후 거래 상대방이 평가해준 별 점수와 기존의 나의 당도를 더한 뒤
								평균을 내어 갱신된다.</p>


						</div>
					</div>
					<!-- end center-block -->

				</div>
			</div>
			<!-- end col-md-8 -->


			<div class="col-md-2"></div>


		</div>
		<!-- content end -->

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







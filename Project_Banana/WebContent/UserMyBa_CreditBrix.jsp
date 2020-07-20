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
.body
{
	font-size: 16px;
	font-weight: 600;
} 

.Brix1 {
	font-size: 30px;
	font-weight: bold;
}

strong {
	font-weight: bold;
	font-size: 20px;
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
	height: 40px !important;

	width: 100%;
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
.demo{ background: #dad9d4; }
.progress{
    height: 40px;
    background: #fff;
    border-radius: 100px;
    box-shadow: none;
    margin-top: 40px;
    position: relative;
}
.progress .progress-title{
    width: 20%;
    height: 100%;
    background: #fff;
    border-radius: 100px 0 0 100px;
    float: left;
    margin: 0;
    font-size: 15px;
    color: #000;
    line-height: 40px;
    letter-spacing: 1px;
    text-align: center;
    text-transform: uppercase;
    position: relative;
}
.progress .progress-title:after{
    content: "";
    border-left: 10px solid #fff;
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
    position: absolute;
    top: 10px;
    right: -10px;
    z-index: 1;
}
.progress .progress-bar{
    width: 80%;
    background: #fff;
    box-shadow: none;
    position: relative;
}
.progress .progress-value{
    height: 100%;
    border-radius: 0 100px 100px 0;
    font-size: 15px;
    font-weight: bold;
    line-height: 40px;
    color: #fff;
    animation: animate-positive 2s;
}
.pro-bar
{
	width: 100px;
	height: 100px;

}

element.style
{
	width:100% !important;

}
.progress.yellow .progress-value
{ background: var(--hover-color); }

@keyframes animate-positive{
    0%{ width: 0; }
}
@media only screen and (max-width: 480px){
    .progress .progress-title{
        font-size: 12px;
        letter-spacing: 0;
    }
}
#bana1
{
	width: 40px;
	height: 40px;

}

</style>


</head>
<body class="body">
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
					<h3>개인 신뢰 등급(당도)</h3>
					<hr>
				</div>

				<div class="row">
					<div class="col-md-12 credit text-center">									
						<h2 class="thick">바나나의 </h2><p>신뢰등급</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 text-center">
						<img alt="" src="images/banana_icon.png" id="bana1">
						<p>
							<span class="Brix1">${brix }</span><strong>Brix</strong> / 5
						</p>

					</div>
					<!-- end text-center 신뢰도 점수-->
					<br>
					<br>

					<div class="row">
						<div class="col-md-12">
							
							<div class="col-md-3">
							
							</div>
							<div class="col-md-6">
							<div class="container pro-bar">
							    <div class="row">
							        <div class="col-md-6">
							          			 
							            <div class="progress yellow">
							                <h3 class="progress-title">Brix</h3>
							                <div class="progress-bar">
							                    <div class="progress-value" style="width: ${brixMul }%;">${brixMul}%</div>
							                </div>
							            </div>
							            <p class="thick"> &#11088; 첫거래 시 0brix</p>
							        </div>
							    </div>
							</div>
							
							
							</div>
							
							
							<div class="col-md-3"></div>
						</div>
						
						
					</div> <!-- end progress -->
					


					<div class="center-block">
						<div class="col-md-12">

							<h4 class="thick">&#127820; Brix 안내</h4>
							<br>
							<p>- Brix는 거래에 대한 신뢰도를 나타내는 것으로 거래 후 리뷰 작성을 통한 평점을 통해 계산된다.
							<p>- 거래 후 거래 상대방이 평가해준 별 점수와 기존의 나의 당도를 더한 뒤 평균을 내어 갱신된다.</p>


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







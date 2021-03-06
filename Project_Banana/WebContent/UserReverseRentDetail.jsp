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
<link rel="stylesheet" type="text/css" href="css/GroupBuyingItemPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


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
		<div class="col-md-2">

			<jsp:include page="MenuUser.jsp"></jsp:include>

		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 img-area">
					<img src="images/IlsanStation.JPG" alt=""  class="img-responsive img-rounded"/>
				</div>
				<div class="col-md-6 item_writer">
					<div class="row">
						<div class="col-md-12 text-right">
						    <ul>
						    	<li><!-- 오레오 박사 --></li>
						    	<li>조회수 : 55  |  2020.07.01</li>			    
						    </ul>
						    <hr />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 item-title">
						<span class="text-right"></span>
						 <span class="text-left title">자전거 대여해주실분 구합니다.</span>
						 <span class="text-right">신고하기</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-left item_detail">
							<ul>
								<li>카테고리 : 스포츠/레저 > 자전거 > 자전거</li>
								<li>수령장소 : 일산역</li>
								<li>반납장소 : 일산역</li>
								<li>대여기간 : 2020.06.24부터 2020.07.14까지</li>
								<li>수령시간 : 19:00</li>
								<li>반납시간 : 19:30</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						 	<button class="btn item_btn">역렌트 신청</button>
						 	<button class="btn item_btn">찜하기</button>
						</div>
					</div>
				</div>
				
				
				<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12 ">
							<span class="">상품상세</span>
							<p> 둘이 먹다 하나 죽어도 모르게 맛있는 오레오 오즈 공구원 모읍니다...</p>
						</div>
					</div>
				</div>
			</div>
				
				
			</div>
			<hr />
			
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable" id="tabs-367736">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link" href="#tab1" data-toggle="tab">리뷰</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active show" href="#tab2" data-toggle="tab">댓글문의</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-789870">
								<p>
									I'm in Section 1.
								</p>
							</div>
							<div class="tab-pane" id="tab2">
								<p>
									Howdy, I'm in Section 2.
								</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2">
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
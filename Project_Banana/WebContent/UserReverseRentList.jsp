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

	#apply
	{	
		margin: 20px;
		
		height: 120px;
		width: 95%;
		border: 0.5px solid black;
		padding: 10px;
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
	<div class="row">
	
	
	
		<div class="col-md-12">
		
		
		
			<div class="row">
				<div class="col-md-3">
					<jsp:include page="MenuUser.jsp"></jsp:include>
				</div>
				<div class="col-md-6">
				
				<h3>역렌트 신청 현황</h3>
				<hr />
				
					<div class="row" id="apply"><!-- 한 구성요소 시작 -->
						<div class="col-md-3 img-area">
							
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/3_%EB%B3%B8%EB%AA%85-_
							%ED%8B%B0%ED%83%84_%EC%95%A0%EC%B9%AD-_%EB%AA%BD%EC%93%B0.jpg/220px-3_%EB%B3%B8%EB%AA%85-_%ED%8B%
							B0%ED%83%84_%EC%95%A0%EC%B9%AD-_%EB%AA%BD%EC%93%B0.jpg" alt=""  class="img-responsive img-rounded"
							style="width: 120px; height: auto;">
						
						</div>
						<div class="col-md-7">
						
						<div class="col-md-12 text-left item_detail">
							
								<p>제목     : 자전거 빌려드려요~!!!</p>
								<p>대여기간 : 2020.06.24부터 2020.07.14까지</p>
								<p>1일 렌트비 : 1,500원 / 보증금 10,000원</p>
							
						</div>
						
						</div>
						<div class="col-md-2" style="padding: 10px">
						
							<button class="btn item_btn">역렌트 신청</button>
												 	<br /><br />
						 	<button class="btn item_btn">찜하기</button>
						
						
						</div>
					</div><!-- 한 구성요소 종료  -->
					
					<div class="row" id="apply"><!-- 한 구성요소 시작 -->
						<div class="col-md-3 img-area">
							
							<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkpW2m4KeInLpPaPlg0VOcrJRl4yu8fbSdng&usqp=CAU" alt=""  class="img-responsive img-rounded"/
							style="width: 120px; height: auto;">
						
						</div>
						<div class="col-md-7">
						
						<div class="col-md-12 text-left item_detail">
							
								<p>제목     : 제 자전거 쓰세요 좋음!!</p>
								<p>대여기간 : 2020.06.24부터 2020.07.14까지</p>
								<p>1일 렌트비 : 2,500원 / 보증금 15,000원</p>
							
						</div>
						
						</div>
						<div class="col-md-2" style="padding: 10px">
						
							<button class="btn item_btn">역렌트 신청</button>
												 	<br /><br />
						 	<button class="btn item_btn">찜하기</button>
						
						
						</div>
					</div><!-- 한 구성요소 종료  -->
					
					<div class="row" id="apply"><!-- 한 구성요소 시작 -->
						<div class="col-md-3 img-area">
							
							<img src="https://www.sisaweek.com/news/photo/201902/118581_103236_572.jpg" alt=""  class="img-responsive img-rounded"/
							style="width: 120px; height: auto;">
						
						</div>
						<div class="col-md-7">
						
						<div class="col-md-12 text-left item_detail">
							
								<p>제목     : 거저 가져가세요~!!</p>
								<p>대여기간 : 2020.06.24부터 2020.07.14까지</p>
								<p>1일 렌트비 : 1,000원 / 보증금 20,000원</p>
							
						</div>
						
						</div>
						<div class="col-md-2" style="padding: 10px">
						
							<button class="btn item_btn">역렌트 신청</button>
												 	<br /><br />
						 	<button class="btn item_btn">찜하기</button>
						
						
						</div>
					</div><!-- 한 구성요소 종료  -->
					
					
					<div>
			<nav style="text-align: center;">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
			</div>
					
				</div>
				
				
				<div class="col-md-3">
				</div>
			</div>
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
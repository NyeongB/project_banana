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
	height: 260px;
	margin-bottom: 50px;	
	border-radius: 30px;
	
}	

img
{
	width: 200px;
	height: 180px;
	

}

.txt, h4, h3
{
	font-weight: bold;	
}

#btn1
{
	margin-right: 10px;
	font-weight: bold;
	width: 80px;
}

#btn2
{
	margin-left: 10px;
	font-weight: bold;
	width: 80px;
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
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-12">
								<h3>결제</h3>
								<hr><br><br>
							</div>
						</div> <!-- end 결제 title div -->
						
						<div class="center-block">
							<div class="col-md-12">
								<div class="col-md-5">
									<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/3_%EB%B3%B8%EB%AA%85-_
							%ED%8B%B0%ED%83%84_%EC%95%A0%EC%B9%AD-_%EB%AA%BD%EC%93%B0.jpg/220px-3_%EB%B3%B8%EB%AA%85-_%ED%8B%
							B0%ED%83%84_%EC%95%A0%EC%B9%AD-_%EB%AA%BD%EC%93%B0.jpg" alt="" >
								</div>

								<div class="col-md-7 txt">
									<h4>자전거 빌려드려요!!</h4><br>
									<p>렌트비 : 10,500원 &nbsp; &nbsp; &nbsp;  &nbsp;나의 잔고 : 30,000포인트</p>
									<p>보증금 : 10,000원</p>
									<p>합계 : 10,000원</p><br>
									<p>기간 : 2020년 6월 24일 ~ 2020년 6월 30일</p>
								</div>
								
							</div> 
						</div> <!-- end center-block -->
						
						
						<div class="col-md-12 text-center">
							<h4>정말로 결제 하시겠습니까?</h4>
							<button type="button" class="btn btn-default" id="btn1">수락</button>
							<button type="button" class="btn btn-default" id="btn2">거절</button>
						</div>
						
						
						
					</div>  <!-- col-md-8 end -->
					
					
					<div class="col-md-2"></div>
				</div>
			</div>  <!-- end col-md-12 -->
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
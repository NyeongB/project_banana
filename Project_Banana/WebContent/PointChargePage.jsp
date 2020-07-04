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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">
h2, .check
{
	margin-left: 15px;
	font-weight: bold;
}

p
{
	margin-right: 15px;
	font-size: 20px;
	font-weight: bold;
}

.pointBtn
{
	margin-bottom: 60px; 
}

#Cancel, #Payment
{
	font-weight: bold;
}

.point2
{
	margin-bottom: 20px;
}

span
{
	color: var(--hover-color1);

}

.paym
{
	height: 100px;
	border-top: 1px solid gray;
	line-height: 100px;
}

.muPay, .cardPay
{
	width: 160px;
	background-color: #e6e6e6;
}

img
{
	width: 25px;
	
}

.center
{
	height: 200px;
}

#paym2
{
	border-bottom: 1px solid gray;
}

i
{
	margin-right: 10px;
}


.btn
{
	background-color: white;
	font-weight: bold;
	
	
}

#i1
{
	margin-left: 15px;
}

label
{
	font-size: 17px;
}

input
{
	width: 30px;
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
					<div class="col-md-3"></div>
					<div class="col-md-6">
					
					
					
						<div class="row">
							<div class="col-md-12 point1">
								<h3>포인트 충전</h3>
								<hr><br><br>
							</div>
						</div> <!-- end 포인트 충전 div -->
						
						
						<div class="row">
							<div class="col-md-12">

								<div class="row">
									<div class="col-md-12"> 
										<h2>충전할 금액</h2>
									</div>
								</div><br>

								<div class="row">
									<div class="col-md-12 check"> 
									   <label for="m5000"><input type="radio" name="charge" id="m5000"/>5,000원</label>
									   <label for="m10000"><input type="radio" name="charge" id="m10000"/>10,000원</label>
									   <label for="m20000"><input type="radio" name="charge" id="m20000"/>20,000원</label>
									   <label for="m30000"><input type="radio" name="charge" id="m30000"/>30,000원</label>
									   <label for="m40000"><input type="radio" name="charge" id="m40000"/>40,000원</label>
									</div>
								</div><br>

								<div class="row">
									<div class="col-md-12 text-right">
										<p>선택된 금액 : <span>40,000</span>원</p> 
									
									</div>
								</div><hr><br><br>



							</div>
						</div>  <!-- end 충전할 금액 div -->
						
						
						
						
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-12">
										<h2>결제 수단</h2>
									
									</div>
								</div><br>
								<div class="row">
									<div class="col-md-12 point2">
										<div class="col-md-3"></div>
									
										<div class="col-md-6 center">
											
											<div class="col-md-12 paym" id="paym1">
												<div class="col-md-4">					
													<p>무통장 입금</p> 
												</div>
												<div class="col-md-8">
													<button type="button" class="btn btn-default muPay"><i class="fa fa-money" aria-hidden="true" id="i1"></i>무통장 입금</button>
												</div>
											</div>
											
											<div class="col-md-12 paym" id="paym2">
												<div class="col-md-4">			
													<p>신용카드</p>
												</div>
												<div class="col-md-8">				
													<button type="button" class="btn btn-default cardPay"><i class="fa fa-credit-card-alt" aria-hidden="true" id="i2"></i>신용카드</button>
												</div>
											</div>
										
										
										
										</div>
									
									
										<div class="col-md-3"></div>
									</div>
								</div><hr><br> <!-- end 결제수단 div -->
								
								
								
								<div class="row">
									<div class="col-md-12 pointBtn">
										<div class="col-md-2"></div>
										<div class="col-md-8 text-right">
											<button class="btn btn-primary" type="button" id="Payment">결제하기</button>
											<button class="btn btn-primary" type="button" id="Cancel">취소하기</button>
										</div>	
										<div class="col-md-2"></div>
									</div>
								</div> <!-- end 결제&취소 버튼 -->
								
							</div>
						</div>

					





					</div>
					<!-- col-md-8 end -->


					<div class="col-md-3"></div>
				</div>
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end content -->
	</div>
	<!-- end container-fluid -->



	<!-- content end -->

	<!-- footer  -->
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
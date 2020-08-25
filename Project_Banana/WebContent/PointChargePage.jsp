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


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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

<script type="text/javascript">

	// 충천할 포인트
	var point = 0;
	// 충전 타입
	var type;
	
	$(document).ready(function()
	{
		// 충전버튼 클릭 시 이벤트 
		$("#payment").click(function()
		{	
			
			//alert("결제요청");
			//alert("결제 금액 : " + point + "결제 타입 : " + type);
			
			// 충전 타입 
			if(type=='type1')
	  			t = 'trans';		// 계좌이체
	  		else if(type=='type2')
	  			t = 'card';			// 카드
	  		else if(type=='type3')
	  			t = 'phone';		// 휴대폰결제			
			
			requestPay(point,t);
		});
		
		$("#cancel").click(function()
		{
			alert("취소");
		});
	});
	
	// 이니시스 결제 API
	function requestPay(p,t) 
	{	
		IMP.init('imp63967210');
	    // IMP.request_pay(param, callback) 호출
		IMP.request_pay({
			
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : t, //card 
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'BANANA401 : 포인트 결제',
		    amount : p,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		},function(rsp)
		{
			
		   if ( rsp.success ) 
		   {
		        var msg = '결제가 완료되었습니다.';
		        alert(msg);
		        		        
		        // 결제 완료시 사용자 포인트 update하기 위해 주소 요청
		        // 가격과 결제유형 같이 넘긴다
		        location.href = "<%=cp%>/pointcharge.action?point=" + p + "&type="+ t;		        
		        
		    }else 
		    {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		    }
		    
		});
	  }
  
	 // 사용자가 선택한 포인트 설정 
	 function getPoint(id)
	 {
		point = Number(id);
		// 사용자가 선택한 포인트 노출
		document.getElementById('point').innerHTML = point;

	 }
	  
	// 사용자가 선택한 결제타입 설정
	function getType(id)
	{
		var typeText;
		type = id;
		
		// 결제 타입 분기
		if(id=='type1')
			typeText='실시간 계좌이체';
		else if(id=='type2')
			typeText='카드 결제';
		else if(id=='type3')
			typeText='휴대폰 결제';
		
		// 사용자가 선택한 결제 타입 노출
		document.getElementById('type').innerHTML=typeText;
	
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

		<div class="content">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-3" ></div>
					
					<div class="col-md-6">
					
					
					
						<div class="row">
							<div class="col-md-12 point1">
								<h3 class="thick">포인트 충전</h3>
								<hr><br><br>
							</div>
						</div> <!-- end 포인트 충전 div -->
						
						
						<div class="row">
							<div class="col-md-12">

								<div class="row">
									<div class="col-md-12"> 
										<h2 class="thick">충전할 금액</h2>
									</div>
								</div><br>
						
								<div class="row">
									<div class="col-md-12 check" > 
									   <label for="m5000"><input type="radio" name="charge" id="5000"   onclick="getPoint(this.id)">5,000원</label>
									   <label for="m10000"><input type="radio" name="charge" id="10000" onclick="getPoint(this.id)">10,000원</label>
									   <label for="m20000"><input type="radio" name="charge" id="20000" onclick="getPoint(this.id)">20,000원</label>
									   <label for="m30000"><input type="radio" name="charge" id="30000" onclick="getPoint(this.id)">30,000원</label>
									   <label for="m40000"><input type="radio" name="charge" id="40000" onclick="getPoint(this.id)">40,000원</label>
									   <label for="m50000"><input type="radio" name="charge" id="50000" onclick="getPoint(this.id)">50,000원</label>
									</div>
								</div><br>

								<div class="row">
									<div class="col-md-12 text-right">
										<p>선택된 금액 : <span id="point"></span>원</p> 
									
									</div>
								</div><hr><br>



							</div>
						</div>  <!-- end 충전할 금액 div -->
						
						
						
						
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-12">
										<h2 class="thick">결제 수단</h2>
									
									</div>
								</div><br>
								
									<div class="col-md-12 point2">
										<div class="col-md-12">
										
										<div class="row">
								</div><br>

								<div class="row">
									<div class="col-md-12 check" > 
									   <label for="m5000"><input type="radio" name="type" id="type1" onclick="getType(this.id)">실시간 계좌이체</label>
									   <label for="m10000"><input type="radio" name="type" id="type2" onclick="getType(this.id)">카드 결제</label>
									   <label for="m20000"><input type="radio" name="type" id="type3" onclick="getType(this.id)">휴대폰 결제</label>
									</div>
								</div><br>

								<div class="row">
									<div class="col-md-12 text-right">
										<p>선택된 결제수단 : <span id="type"></span></p> 
									
									</div>
								</div>
										
										
										</div>
									
										
									
									
									</div>
								<hr><br> <!-- end 결제수단 div -->
								
								
								<br />
								<br />
								<br />
								<div class="row">
									<div class="col-md-12 pointBtn">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary" type="button" id="payment">결제하기</button>
											<button class="btn btn-primary" type="button" id="cancel">취소하기</button>
										</div>	
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
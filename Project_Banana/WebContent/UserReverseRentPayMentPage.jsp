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
				
				<div>
					<h3>역렌트 결제</h3>
					<hr />
				</div>
				
				
				<!-- 상세정보시작 -->
				<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
					<img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="img-thumbnail" />
				</div>
				<div class="col-md-8">
					<h2 class="text-left">
						자전거 빌려드려요~!!!
					</h2>
					<h5>렌트비 : 1,500원</h5>
					<h5>보증금 : 10,000원</h5>
					<h5>합계   : 20,500원</h5>
					<h5>기간   : 2020.06.24 ~ 2020.06.30</h5>
					<h3></h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<hr />
					<dl>
						<dt>
							결제 예정 금액
						</dt>
						<dd>
							20,500원
						</dd>
						<dt>
							나의 포인트
						</dt>
						<dd>
							30,000원
						</dd>
					</dl>
				</div>
				
				<div >
				<button type="button" class="btn btnDefault">결제하기</button>
				
				<button type="button" class="btn btnDefault">취소하기</button>
				</div>
				
			</div>
		</div><!-- 상세정보 종료 -->
				
				
				
				</div><!-- 콜 엠디 6 끝 -->
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
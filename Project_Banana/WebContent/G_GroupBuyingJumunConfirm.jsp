<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.jumun_confirm
{
	background-color: var;
	background-color: #f4f4f4;
	width: 100%;
	height: 200px;

}
.jumun_img
{
	width:100%;
	margin: 10px;

}
.jumun_list
{

	margin: 10px;
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
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12 thick">
							<h3 class="thick" >
								주문확인
							</h3>
						</div>
					</div>
					<c:forEach var="lists" items="${gPostConfirmList }">
					<div class="row">
						<div class="col-md-12 jumun_confirm">
							<div class="col-md-4">
								<img src="images/oz.jpg"  class="jumun_img img-rounded">
							</div>
							<div class="col-md-8">

								<ul class="jumun_list">
								
									<li><h3 class="thick">${lists.title }</h3></li>
									<li>분배일시 : ${lists.bun_date }</li>
									<li>분배장소 : ${lists.loc_name }</li>
									<li>신청수량 : 1개</li>
									<li>공구금액 : <fmt:formatNumber value="${lists.dis_cost/lists.member_num }" ></fmt:formatNumber>원</li>
								
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="line"></div>
					<h3 class="thick">결제 예정 금액</h3>
						<ul>
							<li>주문 합계 : <fmt:formatNumber value="${lists.dis_cost/lists.member_num }" ></fmt:formatNumber>원</li>
							<li>보유 포인트 : 1000원</li>
							<li>부족한 포인트 : 1500원</li>
							<li>※ 포인트 잔액이 부족하여 결제 할 수 없습니다.</li>
						</ul>
				
				</div>
			</div>
			</c:forEach>
			<div class="row">
				<div class="col-md-12 text-center">
					<button class="btn">포인트충전</button>
					<button class="btn">결제하기</button>
					<button class="btn">결제취소</button>
				</div>
			</div>
		</div>
		<div class="col-md-3">
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
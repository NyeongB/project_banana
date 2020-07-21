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

img
{
	height: 180px;
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
		<div class="col-md-3">
		<jsp:include page="MenuAdmin.jsp"></jsp:include>
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12 thick">
							<h3 class="thick">
								광고 수락
							</h3>
							<hr />
							<br />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 jumun_confirm">
							<div class="col-md-4">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTzDMtEOltBIDuq-dRjaOstZ67y2lPrLX2e_w&usqp=CAU"  class="jumun_img img-rounded">
							</div>
							<div class="col-md-8">

								<ul class="jumun_list" style="font-size: large; margin-bottom: 30px;">
									<li>신청자 : cjfsud23</li>
									<li>2020.06.25 ~ 2020.07.10</li>
									<li>종류 : 상단광고</li>
									<li>내용 : 사이트 홍보</li>
									<li>주소 : <a href="http://naver.com">주소로 바로가기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br><br><br>
			<div class="row">
				<div class="col-md-12 text-center">
					<button class="btn btn-lg">광고 수락</button>
					<button class="btn btn-lg">취소</button>
				</div>
			</div>
		</div>
		<div class="col-md-3">
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
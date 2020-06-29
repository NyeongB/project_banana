<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminUserList.jsp</title>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() 
	{
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function() 
		{
			$("ul", this).slideToggle("fast");	
		});
	})
	
	
</script>
<style type="text/css">
li
{
	font-weight: bold;
	font-size: 18px;
	
}

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="header">
			<div class="col-md-12">
				<jsp:include page="header.jsp"></jsp:include>
			</div>
		</div>
		<div class="content">
			<div class="col-md-3">
			
			<div id="nav">
		<ul class="menu">
			<li><a href="#">조 회</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">접수된 신고</a></li>
					<li><a href="#">거래 조회</a></li>
					<li><a href="#">관리자 계정 관리</a></li>
					<li><a href="#">사용자 조회</a></li>
				</ul>
			</li>
			<li><a href="#">정책 확인 및 변경</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">신고</a></li>
					<li><a href="#">마일리지</a></li>
					<li><a href="#">활동 등급</a></li>
					
				</ul>
			</li>
			<li><a href="#">매출관리</a></li>
			<li><a href="#">광고관리</a></li>

			
		</ul>
	</div>
			
			</div>
			<div class="col-md-6">
				<div class="row">
				<div class="col-md-12">
					<h2>
						사용자 조회
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<ul class="nav nav-pills">
					<li role="presentation"><a href="#">일반회원</a></li>
					<li role="presentation"><a href="#">소상공인회원</a></li>
					<li role="presentation"><a href="#">정지회원</a></li>
					<li role="presentation"><a href="#">탈퇴회원</a></li>
					<li role="presentation"><a href="#">휴면회원</a></li>
				</ul>
				</div>
			</div>
			
			
			<div class="row">
				<table class="table table-striped">
 					<tr>
 						<th>이름</th>
 						<th>주민번호</th>
 						<th>핸드폰번호</th>
 						<th>주소</th>
 						<th>아이디</th>
 						<th>Email</th>
 						<th>신뢰도</th>
 						<th>활동등급</th>
 						<th>포인트</th>
 						<th></th>
 						<th></th>
 						<th></th>
 						<th></th>
 						<th></th>
 						<th></th>
 						<th></th>
 						<th></th>
 					</tr>
				</table>
				
				
			
			</div>
			
			
			
			</div> 
			
			
			
			
			<div class="col-md-3"></div>
		</div>
		<div class="footer">
			<div class="col-md-12">
				<C:import url="footer.jsp"></C:import>
			</div>
		</div>
	</div>

</body>
</html>	
 					